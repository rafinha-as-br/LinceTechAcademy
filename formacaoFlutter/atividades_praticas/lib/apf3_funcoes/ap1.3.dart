import 'package:flutter/material.dart';

void main() {
  runApp(ap13app());
}

class Pessoa {
  late String nome;
  late int idade;

  Pessoa({required this.nome, required this.idade});
}

List<Pessoa> listaPessoas = [];

class formulario extends StatefulWidget {
  final Function(Pessoa) onSalvar;

  const formulario({required this.onSalvar, super.key});

  @override
  State<formulario> createState() => _formularioState();
}

class _formularioState extends State<formulario> {

  final TextEditingController nomeController = TextEditingController();
  final TextEditingController idadeController = TextEditingController();


  void salvarButton() {
    final nome = nomeController.text.trim();
    final idadeStr = idadeController.text.trim();

    //valida nome
    if (nome.isEmpty || nome.length < 3 || nome[0] != nome[0].toUpperCase()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Nome inválido!")),
      );
      return;
    }

    //valida idade
    final idade = int.tryParse(idadeStr);
    if (idade == null || idade < 18) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Idade inválida!")),
      );
      return;
    }

    // instanciar uma classe e adicionar na lista de pessoas
    final pessoa = Pessoa(nome: nome, idade: idade);
    widget.onSalvar(pessoa);

    nomeController.clear();
    idadeController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Insira seus dados: '),
        //input nome
        TextField(
          controller: nomeController,
          decoration: InputDecoration(labelText: 'Nome'),
        ),
        //input idade
        TextField(
          controller: idadeController,
          decoration: InputDecoration(labelText: 'Idade'),
        ),
        ElevatedButton(
          onPressed: () {
            salvarButton();
          },
          child: Text('Salvar'),
        ),
      ],
    );
  }
}

class pessoasWidgetLista extends StatelessWidget {
  const pessoasWidgetLista({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listaPessoas.length,
      itemBuilder: (context, indice) {
        return ListTile(title: Text('${listaPessoas[indice]}'));
      },
    );
  }
}

class ap13app extends StatefulWidget {
  const ap13app({super.key});

  @override
  State<ap13app> createState() => _ap13appState();
}

class _ap13appState extends State<ap13app> {

  List<Pessoa> pessoas = [];

  void adicionarPessoa(Pessoa pessoa) {
    setState(() {
      pessoas.add(pessoa);
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              // formulario widget
              formulario(onSalvar: adicionarPessoa),
              //column de exibição das informações
              pessoasWidgetLista(),
            ],
          ),
        ),
      ),
    );
  }
}

