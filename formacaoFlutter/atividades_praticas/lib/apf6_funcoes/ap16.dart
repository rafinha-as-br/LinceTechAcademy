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

  //Getter da lista de pessoas
  get listaDePessoas => _listaDePessoas;
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: _MyWidgetState.routeName,
      routes: {
        _MyWidgetState.routeName: (context) => MyWidget(),
        TelaListagemPessoas.routeName: (context) => TelaListagemPessoas(),
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
                      onTap: (){
                        Navigator.pushNamed(context, TelaListagemPessoas.routeName);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        child: Column(
                         children: [
                           Text('Listar as pessoas',
                             style: TextStyle(
                               fontSize: 30,
                               fontWeight: FontWeight.bold,
                             ),),
                         ],
                        ),
                      ),
                    ),
                  ),
                ]
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
            (context, pessoa, child) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Form(
                child: ListView.builder(
                  itemCount: pessoa._listaDePessoas.length,
                  itemBuilder: (context, indice) {
                    return ListTile(
                      title: Text(
                        pessoa.listaDePessoas[indice],
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
  const TelaInclusao({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class TelaEdicao extends StatelessWidget {
  const TelaEdicao({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
