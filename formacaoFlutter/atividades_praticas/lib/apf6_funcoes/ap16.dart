import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => EstadoListaDePessoas(),
      child: MyApp(),
    ),
  );
}

enum TipoSanguineo {
  aPositivo,
  aNegativo,
  bPositivo,
  bNegativo,
  oPositivo,
  oNegativo,
  abPositivo,
  abNegativo,
}

class Pessoa {
  const Pessoa({
    required this.nome,
    required this.email,
    required this.telefone,
    required this.github,
    required this.tipoSanguineo,
  });

  final String nome;
  final String email;
  final String telefone;
  final String github;
  final TipoSanguineo tipoSanguineo;

// todo: implementar equals e hashcode
}

class EstadoListaDePessoas with ChangeNotifier {
  final _listaDePessoas = <Pessoa>[];
  TipoSanguineo? _tipoSanguineo;

  TipoSanguineo? get tipoSelecionado => _tipoSanguineo;

  List<Pessoa> get pessoas => List.unmodifiable(_listaDePessoas);

  void incluir(Pessoa pessoa) {
    _listaDePessoas.add(pessoa);
    notifyListeners();
  }

  void excluir(Pessoa pessoa) {
    _listaDePessoas.remove(pessoa);
    notifyListeners();
  }

  // todo: implementar métodos restantes

  //Função para pegar o tipo sanguineo no dropdbutton
  void selecionaTS(TipoSanguineo? tipo) {
    _tipoSanguineo = tipo;
    notifyListeners();
  }

  //função para retornar o tipo de cor baseado no tipo sanguineo
  Color selecionaCor(TipoSanguineo tipo) {
    switch (tipo) {
      case TipoSanguineo.aPositivo:
        return Colors.blue;
      case TipoSanguineo.aNegativo:
        return Colors.red;
      case TipoSanguineo.bPositivo:
        return Colors.purple;
      case TipoSanguineo.bNegativo:
        return Colors.orange;
      case TipoSanguineo.oPositivo:
        return Colors.green;
      case TipoSanguineo.oNegativo:
        return Colors.yellow;
      case TipoSanguineo.abPositivo:
        return Colors.cyan;
      case TipoSanguineo.abNegativo:
        return Colors.white;
    }
  }

  //função que exibe uma pessoa
  Column exibirPessoa(Pessoa pessoa, EstadoListaDePessoas p) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Nome: ${pessoa.nome} ',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
        Row(
          children: [
            Text(
              'Gmail: ${pessoa.email}',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
        Row(
          children: [
            Text(
              'Telefone: ${pessoa.telefone}',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
        Row(
          children: [
            Text(
              'GitHub: ${pessoa.github}',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
        Row(
          children: [
            Text(
              'Tipo sanguíneo: ',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              '${pessoa.tipoSanguineo.name}',
              style: TextStyle(
                fontSize: 20,
                color: p.selecionaCor(
                  pessoa.tipoSanguineo,
                ),
              ),
            ),
          ],
        ),
      ],
    );

  }

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: _MyWidgetState.routeName,
      routes: {
        _MyWidgetState.routeName: (context) => MyWidget(),
        TelaListagemPessoas.routeName: (context) => TelaListagemPessoas(),
        TelaInclusao.routeName: (context) => TelaInclusao(),
      },

      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: Center(child: MyWidget())),
    );
  }
}

class MyWidget extends StatefulWidget {
  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  static const routeName = '/telaHome';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          TelaListagemPessoas.routeName,
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        child: Column(
                          children: [
                            Text(
                              'Listar as pessoas',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, TelaInclusao.routeName);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        child: Column(
                          children: [
                            Text(
                              'Adicionar uma pessoa',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TelaListagemPessoas extends StatelessWidget {
  const TelaListagemPessoas({super.key});

  static const routeName = '/telaListagemPessoas';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Listagem de pessoas")),
      body: Consumer<EstadoListaDePessoas>(
        builder:
            (context, p, child) =>
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Form(
                child: ListView.builder(
                  itemCount: p._listaDePessoas.length,
                  itemBuilder: (context, indice) {
                    return ListTile(
                      title: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border(
                                top: BorderSide(color: Colors.white, width: 3),
                                bottom: BorderSide(
                                  color: Colors.white,
                                  width: 3,
                                ),
                              ),
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 16,
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Nome: ${p.pessoas[indice].nome} ',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Gmail: ${p.pessoas[indice].email}',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Telefone: ${p.pessoas[indice].telefone}',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'GitHub: ${p.pessoas[indice].github}',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Tipo sanguíneo: ',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    Text(
                                      '${p.pessoas[indice].tipoSanguineo.name}',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: p.selecionaCor(
                                          p.pessoas[indice].tipoSanguineo,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
      ),
    );
  }
}

class TelaInclusao extends StatelessWidget {
  TelaInclusao({super.key});

  final _formKey = GlobalKey<FormState>();
  static const routeName = '/telaInclusao';

  final nomeController = TextEditingController();
  final emailController = TextEditingController();
  final telefoneController = TextEditingController();
  final linkGithubController = TextEditingController();
  final tipoSanguineoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TipoSanguineo tipoSanguineo = TipoSanguineo.oPositivo;
    return Scaffold(
      appBar: AppBar(title: Text('Adicionando uma pessoa')),
      body: Consumer<EstadoListaDePessoas>(
        builder:
            (context, pessoa, child) =>
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: nomeController,
                      decoration: InputDecoration(labelText: 'Nome completo'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Campo obrigatório';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(labelText: 'Email'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Campo obrigatório';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: telefoneController,
                      decoration: InputDecoration(labelText: 'Telefone'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Campo obrigatório';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: linkGithubController,
                      decoration: InputDecoration(labelText: 'GitHub'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Campo obrigatório';
                        }
                        return null;
                      },
                    ),
                    DropdownButton<TipoSanguineo>(
                      hint: Text('Tipo sanguíneo'),
                      value: tipoSanguineo,
                      items:
                      TipoSanguineo.values.map((tipo) {
                        return DropdownMenuItem<TipoSanguineo>(
                          value: tipo,
                          child: Text(tipo.name),
                        );
                      }).toList(),
                      onChanged: (TipoSanguineo? novoValor) {
                        if (novoValor != null) {
                          tipoSanguineo = novoValor;
                        }
                      },
                    ),
                    Expanded(
                      child: Container(
                        child: InkWell(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              Pessoa pessoaNova = Pessoa(
                                nome: nomeController.text,
                                email: emailController.text,
                                telefone: telefoneController.text,
                                github: linkGithubController.text,
                                tipoSanguineo: tipoSanguineo,
                              );
                              pessoa.incluir(pessoaNova);
                            }
                          },
                          child: Text('Salvar e adicionar'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
      ),
    );
  }
}

class TelaEdicao extends StatelessWidget {
  const TelaEdicao({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
