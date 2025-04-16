//classe pessoa
import 'dart:io';
import 'dart:math';

class Pessoa {
  late final String _nome;
  late final int _idade;
  late final double _altura;

  Pessoa({required String nome, required int idade, required double altura}){
    setterNome = nome;
    setterIdade = idade;
    setterAltura = altura;
  }


  //setter para o nome
  set setterNome(String valor) => _nome = valor;

  //setter para a idade
  set setterIdade(int valor){
    if(valor>=0){
      _idade = valor;
    } else{
      throw Exception("Idade não pode ser menor que zero!");
    }
  }

  //setter para a altura
  set setterAltura(double valor) => _altura = valor;

  //getters para exibir os valores
  get getNome => _nome;
  get getIdade => _idade;
  get getAltura => _altura.toStringAsFixed(2);

  //função que exibe uma pessoa
  void exibirPessoa(Pessoa pessoaI){
    print("Nome: ${pessoaI.getNome}");
    print("Idade: ${pessoaI.getIdade}");
    print("Altura: ${pessoaI.getAltura}");
  }

}


void main(){
  //obtendo qualquer nome
  print("Informe o nome: ");
  String valor1 = stdin.readLineSync()?.toString() ?? (throw Exception("O nome não pode ser vazio!"));
  //gerando idade aleatória entre 1 e 100
  int valor2 = Random().nextInt(100 - 1 + 1);
  //gerando uma altura aleatória
  double valor3 = 1 + Random().nextDouble() * (2.3 - 1.0 );

  //instanciando a classe com os valores
  Pessoa pessoa1 = new Pessoa(nome: valor1, idade: valor2, altura: valor3);
  pessoa1.exibirPessoa(pessoa1);
}