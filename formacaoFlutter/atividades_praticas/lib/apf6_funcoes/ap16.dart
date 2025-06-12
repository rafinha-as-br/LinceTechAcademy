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

enum TiposFiltros { nenhum, inverso, tipoSanguineos }

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

  //Lista de pessoas original
  final _listaDePessoasOriginal = <Pessoa>[];

  TiposFiltros filtroSelecionado = TiposFiltros.nenhum;
  TipoSanguineo? _tipoSanguineo;

  bool editandoPessoa = false;

  TipoSanguineo? get tipoSelecionado => _tipoSanguineo;

  List<Pessoa> get pessoas => List.unmodifiable(_listaDePessoas);

  List<Pessoa> get pessoasOriginal =>
      List.unmodifiable(_listaDePessoasOriginal);

  void incluir(Pessoa pessoa) {
    _listaDePessoasOriginal.add(pessoa);
    notifyListeners();
  }

  void excluir(Pessoa pessoa) {
    _listaDePessoasOriginal.remove(pessoa);
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
  InkWell exibirPessoa(
    Pessoa pessoa,
    EstadoListaDePessoas p,
    bool bloqueadorOnTap,
    BuildContext context,
  ) {
    return InkWell(
      child: Column(
        children: [
          Row(
            children: [
              Text('Nome: ${pessoa.nome} ', style: TextStyle(fontSize: 20)),
            ],
          ),
          Row(
            children: [
              Text('Gmail: ${pessoa.email}', style: TextStyle(fontSize: 20)),
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
              Text('GitHub: ${pessoa.github}', style: TextStyle(fontSize: 20)),
            ],
          ),
          Row(
            children: [
              Text('Tipo sanguíneo: ', style: TextStyle(fontSize: 20)),
              Text(
                '${pessoa.tipoSanguineo.name}',
                style: TextStyle(
                  fontSize: 20,
                  color: p.selecionaCor(pessoa.tipoSanguineo),
                ),
              ),
            ],
          ),
        ],
      ),
      onTap: () {
        if (bloqueadorOnTap == false) {
          //abrir uma tela com um formulário já preenchido com os atuais dados e é só alterar os dados e depois salvar que ele atualiza essa pessoa
          p.editandoPessoa = true;
          Navigator.pushNamed(
            context,
            TelaInclusao.routeName,
            arguments: pessoa,
          );
        }
      },
    );
  }

  void editarPessoa() {}

  //função que recarrega a lista editável
  void resetaListaPessoas() {
    pessoas.clear();
    pessoas.addAll(pessoasOriginal);
    notifyListeners();
  }

  //função que define qual é o tipo de filtro selecionado no dropButton
  void definirFiltroSelecionado(TiposFiltros novoValor) {
    filtroSelecionado = novoValor;
    notifyListeners();
  }

  //função que ordena tipos sanguíneos
  List<Pessoa> ordenaSanguineos() {
    final ordemPrioritaria = {
      TipoSanguineo.aPositivo: 1,
      TipoSanguineo.aNegativo: 2,
      TipoSanguineo.bPositivo: 3,
      TipoSanguineo.bNegativo: 4,
      TipoSanguineo.oPositivo: 5,
      TipoSanguineo.oNegativo: 6,
      TipoSanguineo.abPositivo: 7,
      TipoSanguineo.abNegativo: 8,
    };

    final listaOrdenada = List<Pessoa>.from(_listaDePessoasOriginal);
    listaOrdenada.sort((a, b) {
      return ordemPrioritaria[a.tipoSanguineo]!.compareTo(
        ordemPrioritaria[b.tipoSanguineo]!,
      );
    });

    return listaOrdenada;
  }

  // função que altera a lista
  void alterarListaPessoas(TiposFiltros filtroSelecionado) {
    switch (filtroSelecionado) {
      case TiposFiltros.inverso:
        _listaDePessoas.clear();
        _listaDePessoas.addAll(_listaDePessoasOriginal.reversed);
        notifyListeners();
        break;
      case TiposFiltros.tipoSanguineos:
        _listaDePessoas.clear();
        List<Pessoa> listOrdenada = ordenaSanguineos();
        _listaDePessoas.addAll(listOrdenada);
        notifyListeners();
        break;
      case TiposFiltros.nenhum:
        _listaDePessoas.clear();
        _listaDePessoas.addAll(_listaDePessoasOriginal);
        break;
    }
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
        TelaEdicao.routeName: (context) => TelaEdicao(),
      },

      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: Center(child: MyWidget())),
    );
  }
}

//widget pai
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
                        //botar função de recarregar as pessoas da lista
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
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, TelaEdicao.routeName);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        child: Column(
                          children: [
                            Text(
                              'Editar uma pessoa',
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

//tela de listagem das pessoas
class TelaListagemPessoas extends StatelessWidget {
  TelaListagemPessoas({super.key});

  static const routeName = '/telaListagemPessoas';

  TiposFiltros filtroselecionado = TiposFiltros.nenhum;

  @override
  Widget build(BuildContext context) {
    return Consumer<EstadoListaDePessoas>(
      builder:
          (context, p, child) => Scaffold(
            appBar: AppBar(
              title: Text("Listagem de pessoas"),
              actions: [
                DropdownButton<TiposFiltros>(
                  items:
                      TiposFiltros.values.map((value) {
                        return DropdownMenuItem<TiposFiltros>(
                          value: value,
                          child: Text(value.name.toString()),
                        );
                      }).toList(),
                  hint: Text(p.filtroSelecionado.name.toString()),
                  value: p.filtroSelecionado,
                  onChanged: (selecao) {
                    p.definirFiltroSelecionado(selecao!);
                    p.alterarListaPessoas(p.filtroSelecionado);
                  },
                ),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: ListView.builder(
                itemCount: p._listaDePessoas.length,
                itemBuilder: (context, indice) {
                  //resetando a lista usada para o filtro
                  p.resetaListaPessoas();

                  return ListTile(
                    title: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(color: Colors.white, width: 3),
                              bottom: BorderSide(color: Colors.white, width: 3),
                            ),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 16,
                          ),
                          child: p.exibirPessoa(
                            p.pessoas[indice],
                            p,
                            true,
                            context,
                          ),
                        ),
                      ],
                    ),
                  );
                },
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

  //recebendo pessoa via rota para caso de edição

  var nomeController = TextEditingController();
  var emailController = TextEditingController();
  var telefoneController = TextEditingController();
  var linkGithubController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final p = Provider.of<EstadoListaDePessoas>(context);

    // Verifica se há argumentos e só então faz o cast
    final args = ModalRoute.of(context)?.settings.arguments;
    Pessoa? pessoaSelecionada = args is Pessoa ? args : null;

    // Inicializa os controladores com valores padrão ou da pessoa selecionada
    nomeController.text = pessoaSelecionada?.nome ?? '';
    emailController.text = pessoaSelecionada?.email ?? '';
    telefoneController.text = pessoaSelecionada?.telefone ?? '';
    linkGithubController.text = pessoaSelecionada?.github ?? '';
    TipoSanguineo tipoSanguineo =
        pessoaSelecionada?.tipoSanguineo ?? TipoSanguineo.oPositivo;

    return Scaffold(
      appBar: AppBar(title: Text('Adicionando uma pessoa')),
      body: Consumer<EstadoListaDePessoas>(
        builder:
            (context, pessoa, child) => Padding(
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
                    InkWell(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          Pessoa pessoaNova = Pessoa(
                            nome: nomeController.text,
                            email: emailController.text,
                            telefone: telefoneController.text,
                            github: linkGithubController.text,
                            tipoSanguineo: tipoSanguineo,
                          );
                          if (p.editandoPessoa == true) {
                            pessoaSelecionada = pessoaNova;
                          } else {
                            pessoa.incluir(pessoaNova);
                          }
                        }
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 20), // Espaço acima do botão
                        width: double.infinity, // Largura total
                        height: 50,
                        child: Text('Salvar', textAlign: TextAlign.center),
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

  static const routeName = '/telaEdicaoPessoas';

  @override
  Widget build(BuildContext context) {
    return Consumer<EstadoListaDePessoas>(
      builder:
          (context, p, child) => Scaffold(
            appBar: AppBar(
              title: Text('Edição de pessoas - Selecione uma pessoa!'),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: ListView.builder(
                itemCount: p.pessoasOriginal.length,
                itemBuilder: (context, indice) {
                  return ListTile(
                    title: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(color: Colors.white, width: 3),
                              bottom: BorderSide(color: Colors.white, width: 3),
                            ),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 16,
                          ),
                          child: p.exibirPessoa(
                            p.pessoas[indice],
                            p,
                            false,
                            context,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
    );
  }
}
