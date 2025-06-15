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
  nenhum,
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
  TipoSanguineo _tipoSanguineo = TipoSanguineo.nenhum;

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
  void selecionaTS(TipoSanguineo tipo) {
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
      case TipoSanguineo.nenhum:
        return Colors.white;
    }
  }

  //função que exibe uma pessoa
  InkWell exibirPessoa(
    Pessoa pessoa,
    EstadoListaDePessoas p,
    bool bloqueadorOnTap,
    bool exluirPessoa,
    BuildContext context,
  ) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 500,
          height: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Nome: ${pessoa.nome} ',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Email: ${pessoa.email}',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Telefone: ${pessoa.telefone}',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'GitHub: ${pessoa.github}',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Text('Tipo sanguíneo: ', style: TextStyle(fontSize: 20)),
                    Text(
                      '${pessoa.tipoSanguineo.name}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        color: p.selecionaCor(pessoa.tipoSanguineo),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
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
        if (exluirPessoa == true) {
          showDialog(
            context: context,
            builder:
                (context) => AlertDialog(
                  title: Text('Confirmação'),
                  content: Text('Você deseja exluir ${pessoa.nome}?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text('Cancelar'),
                    ),
                    TextButton(
                      onPressed: () {
                        p.excluir(pessoa);
                        Navigator.of(context).pop();
                      },
                      child: Text('Sim'),
                    ),
                  ],
                ),
          );
        }
      },
    );
  }

  //método de editar pessoa
  void editarPessoa(Pessoa pessoaAntiga, Pessoa pessoaNova) {
    int index = _listaDePessoasOriginal.indexOf(pessoaAntiga);
    if (index != -1) {
      _listaDePessoasOriginal[index] = pessoaNova;
      notifyListeners();
    }
  }

  //função que recarrega a lista editável
  void resetaListaPessoas() {
    _listaDePessoas.clear();
    _listaDePessoas.addAll(_listaDePessoasOriginal);
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
        TelaRemoverPessoas.routeName: (context) => TelaRemoverPessoas(),
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
            spacing: 10,
            children: [
              Row(
                spacing: 10,
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
                        height: 70,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Icon(Icons.list_outlined, size: 60),
                            ),
                            Expanded(
                              child: Text(
                                'Listar as pessoas',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
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
                        height: 70,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Icon(
                                Icons.add_circle_outline_sharp,
                                size: 50,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                'Adicionar pessoa',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
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
                spacing: 10,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, TelaEdicao.routeName);
                      },
                      child: Container(
                        height: 70,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        child: Row(
                          children: [
                            Expanded(child: Icon(Icons.edit, size: 50)),
                            Expanded(
                              child: Text(
                                'Editar pessoa',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
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
                        Navigator.pushNamed(
                          context,
                          TelaRemoverPessoas.routeName,
                        );
                      },
                      child: Container(
                        height: 70,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        child: Row(
                          spacing: 5,
                          children: [
                            Expanded(child: Icon(Icons.group_remove, size: 50)),
                            Expanded(
                              child: Text(
                                'Remover pessoa',
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
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
    final p = Provider.of<EstadoListaDePessoas>(context);
    p.resetaListaPessoas();

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
                      spacing: 10,
                      children: [
                        Container(
                          width: 400,
                          decoration: BoxDecoration(color: Colors.white24),
                          child: p.exibirPessoa(
                            p.pessoas[indice],
                            p,
                            true,
                            false,
                            context,
                          ),
                        ),
                        SizedBox(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.white,
                                  width: 3,
                                ),
                              ),
                            ),
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

//tela de adicionar pessoas
class TelaInclusao extends StatelessWidget {
  TelaInclusao({super.key});

  final _formKey = GlobalKey<FormState>();
  static const routeName = '/telaInclusao';

  //recebendo pessoa via rota para caso de edição

  var nomeController = TextEditingController();
  var emailController = TextEditingController();
  var telefoneController = TextEditingController();
  var linkGithubController = TextEditingController();

  TipoSanguineo tipoSanguineo = TipoSanguineo.nenhum;

  @override
  Widget build(BuildContext context) {
    final p = Provider.of<EstadoListaDePessoas>(context);

    final args = ModalRoute.of(context)?.settings.arguments;
    Pessoa? pessoaSelecionada = args is Pessoa ? args : null;

    nomeController.text = pessoaSelecionada?.nome ?? '';
    emailController.text = pessoaSelecionada?.email ?? '';
    telefoneController.text = pessoaSelecionada?.telefone ?? '';
    linkGithubController.text = pessoaSelecionada?.github ?? '';

    return Scaffold(
      appBar: AppBar(title: Text('Adicionando uma pessoa')),
      body: Form(
        key: _formKey,
        child: Column(
          spacing: 20,
          children: [
            //Campos de texto
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
            //seletor de tipo sanguíneo
            Column(
              spacing: 10,
              children: [
                Text('Tipo sanguíneo'),
                Row(
                  spacing: 10,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        tipoSanguineo = TipoSanguineo.aPositivo;
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 7,
                          horizontal: 10,
                        ),
                        decoration: BoxDecoration(
                          border: Border.symmetric(
                            horizontal: BorderSide(
                              width: 1,
                              color: Colors.white,
                            ),
                            vertical: BorderSide(width: 1, color: Colors.white),
                          ),
                        ),
                        child: Text('A+', style: TextStyle(fontSize: 20)),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        tipoSanguineo = TipoSanguineo.aNegativo;
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 7,
                          horizontal: 10,
                        ),
                        decoration: BoxDecoration(
                          border: Border.symmetric(
                            horizontal: BorderSide(
                              width: 1,
                              color: Colors.white,
                            ),
                            vertical: BorderSide(width: 1, color: Colors.white),
                          ),
                        ),
                        child: Text('A-', style: TextStyle(fontSize: 20)),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        tipoSanguineo = TipoSanguineo.abPositivo;
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 7,
                          horizontal: 10,
                        ),
                        decoration: BoxDecoration(
                          border: Border.symmetric(
                            horizontal: BorderSide(
                              width: 1,
                              color: Colors.white,
                            ),
                            vertical: BorderSide(width: 1, color: Colors.white),
                          ),
                        ),
                        child: Text('B+', style: TextStyle(fontSize: 20)),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        tipoSanguineo = TipoSanguineo.bNegativo;
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 7,
                          horizontal: 10,
                        ),
                        decoration: BoxDecoration(
                          border: Border.symmetric(
                            horizontal: BorderSide(
                              width: 1,
                              color: Colors.white,
                            ),
                            vertical: BorderSide(width: 1, color: Colors.white),
                          ),
                        ),
                        child: Text('B-', style: TextStyle(fontSize: 20)),
                      ),
                    ),
                  ],
                ),
                Row(
                  spacing: 10,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        tipoSanguineo = TipoSanguineo.oPositivo;
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 7,
                          horizontal: 10,
                        ),
                        decoration: BoxDecoration(
                          border: Border.symmetric(
                            horizontal: BorderSide(
                              width: 1,
                              color: Colors.white,
                            ),
                            vertical: BorderSide(width: 1, color: Colors.white),
                          ),
                        ),
                        child: Text('O+', style: TextStyle(fontSize: 20)),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        tipoSanguineo = TipoSanguineo.oNegativo;
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 7,
                          horizontal: 10,
                        ),
                        decoration: BoxDecoration(
                          border: Border.symmetric(
                            horizontal: BorderSide(
                              width: 1,
                              color: Colors.white,
                            ),
                            vertical: BorderSide(width: 1, color: Colors.white),
                          ),
                        ),
                        child: Text('O-', style: TextStyle(fontSize: 20)),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        tipoSanguineo = TipoSanguineo.abPositivo;
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 7,
                          horizontal: 10,
                        ),
                        decoration: BoxDecoration(
                          border: Border.symmetric(
                            horizontal: BorderSide(
                              width: 1,
                              color: Colors.white,
                            ),
                            vertical: BorderSide(width: 1, color: Colors.white),
                          ),
                        ),
                        child: Text('AB+', style: TextStyle(fontSize: 20)),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        tipoSanguineo = TipoSanguineo.abNegativo;
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 7,
                          horizontal: 10,
                        ),
                        decoration: BoxDecoration(
                          border: Border.symmetric(
                            horizontal: BorderSide(
                              width: 1,
                              color: Colors.white,
                            ),
                            vertical: BorderSide(width: 1, color: Colors.white),
                          ),
                        ),
                        child: Text('AB-', style: TextStyle(fontSize: 20)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            //botão de salvar
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
                  if (p.editandoPessoa == true && pessoaSelecionada != null) {
                    p.editarPessoa(pessoaSelecionada, pessoaNova);
                    p.editandoPessoa = false;
                  } else {
                    p.incluir(pessoaNova);
                  }
                  p.resetaListaPessoas();
                  Navigator.pop(context);
                }
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                decoration: BoxDecoration(
                  color: Colors.white38,
                  border: Border.symmetric(
                    horizontal: BorderSide(width: 1, color: Colors.white),
                    vertical: BorderSide(width: 1, color: Colors.white),
                  ),
                ),
                child: Text(
                  'Salvar',
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//tela edição de pessoas
class TelaEdicao extends StatelessWidget {
  const TelaEdicao({super.key});

  static const routeName = '/telaEdicaoPessoas';

  @override
  Widget build(BuildContext context) {
    return Consumer<EstadoListaDePessoas>(
      builder:
          (context, p, child) => Scaffold(
            appBar: AppBar(title: Text('Edição de pessoas')),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                children: [
                  Text('Selecione a pessoa que deseja editar'),
                  Expanded(
                    child: ListView.builder(
                      itemCount: p.pessoasOriginal.length,
                      itemBuilder: (context, indice) {
                        return ListTile(
                          title: Column(
                            spacing: 10,
                            children: [
                              Container(
                                width: 400,
                                decoration: BoxDecoration(
                                  color: Colors.white24,
                                ),
                                child: p.exibirPessoa(
                                  p.pessoas[indice],
                                  p,
                                  false,
                                  false,
                                  context,
                                ),
                              ),
                              SizedBox(
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Colors.white,
                                        width: 3,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
    );
  }
}

//teça remover pessoas
class TelaRemoverPessoas extends StatelessWidget {
  const TelaRemoverPessoas({super.key});

  static const routeName = '/telaRemoverPessoas';

  @override
  Widget build(BuildContext context) {
    return Consumer<EstadoListaDePessoas>(
      builder:
          (context, p, child) => Scaffold(
            appBar: AppBar(title: Text('Remoção de pessoas')),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                children: [
                  Text('Selecione a pessoa que deseja excluir'),
                  Expanded(
                    child: ListView.builder(
                      itemCount: p.pessoasOriginal.length,
                      itemBuilder: (context, indice) {
                        return ListTile(
                          title: Column(
                            spacing: 10,
                            children: [
                              Container(
                                width: 400,
                                decoration: BoxDecoration(
                                  color: Colors.white24,
                                ),
                                child: p.exibirPessoa(
                                  p.pessoas[indice],
                                  p,
                                  true,
                                  true,
                                  context,
                                ),
                              ),
                              SizedBox(
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Colors.white,
                                        width: 3,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
    );
  }
}
