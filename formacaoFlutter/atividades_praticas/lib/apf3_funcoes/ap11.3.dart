import 'package:flutter/material.dart';

void main() {
  runApp(ap113App());
}



class ap113App extends StatefulWidget {
  const ap113App({super.key});


  @override
  State<ap113App> createState() => _ap113AppState();
}

class _ap113AppState extends State<ap113App> {
  void adicionarPessoa(Pessoa pessoa) {
    listaPessoas.add(pessoa);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            FormularioWidget(onSalvar: adicionarPessoa),
            Expanded(child: ListPessoasWidget()),
          ],
        ),
      ),
    );  }
}

class Pessoa {
  String nome;
  int idade;

  Pessoa({required this.nome, required this.idade});
}

List<Pessoa> listaPessoas = [];

class FormularioWidget extends StatefulWidget {
  final Function(Pessoa) onSalvar;

  const FormularioWidget({super.key, required this.onSalvar});

  @override
  State<FormularioWidget> createState() => _FormularioWidgetState();
}

class _FormularioWidgetState extends State<FormularioWidget> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController idadeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Text("Insira os seus dados: "),
          //input nome
          TextFormField(
            controller: nomeController,
            decoration: InputDecoration(labelText: 'Nome'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Nome obrigatório";
              }
              if (value.length < 3) {
                return "Nome deve ter pelo menos 3 letras";
              }
              if (!value[0].contains(RegExp(r'[A-Z]'))) {
                return "Nome deve começar com letra maiúscula";
              }
              return null;
            },
          ),
          //input idade
          TextFormField(
            controller: idadeController,
            decoration: InputDecoration(labelText: 'Idade'),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Idade obrigatória!";
              }
              // a fazer validador de números inteiros...
              final idade = int.tryParse(value);
              if (idade == null) {
                return "Digite um número válido!";
              }
              //validador de maioridade
              if (idade < 18) {
                return 'Não pode ser menor de 18 anos!';
              }
              return null;
            },
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                final pessoa = Pessoa(
                  nome: nomeController.text,
                  idade: int.parse(idadeController.text),
                );
                widget.onSalvar(pessoa);
                nomeController.clear();
                idadeController.clear();
              }
            },
            child: Text("Salvar"),
          ),
        ],
      ),
    );
  }
}

class ListPessoasWidget extends StatefulWidget {
  const ListPessoasWidget({super.key});

  @override
  State<ListPessoasWidget> createState() => _ListPessoasWidgetState();
}

class _ListPessoasWidgetState extends State<ListPessoasWidget> {
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
