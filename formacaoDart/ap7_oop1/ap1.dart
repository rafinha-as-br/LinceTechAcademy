import 'dart:io';

//classe conta bancária
class contaBancaria{
  late int saldo;
  late String? titular;

  contaBancaria({this.saldo = 100, required this.titular});

  //metodo para depositar
  int depositar(int valor){
    saldo += valor;
    return saldo;
  }

  //metodo para sacar
  int sacar(int valor){
    saldo -= valor;
    return saldo;
  }

  //metodo para printar o nome do titular e saldo atual
  void exibirConta(){
    print("Nome do titular: $titular");
    print("Saldo atual: $saldo");
}




}

void main(){
  int i=0;
  //obtendo o nome do usuário
  print("Olá! Informe o seu nome para ser cadastrado: ");
  String novoUsuario = stdin.readLineSync()?? "Sem Nome";
  contaBancaria usuario1 = new contaBancaria(titular: novoUsuario);
  print("Conta bancária criada Sr(a) $novoUsuario! você começa com o saldo inicial de R\$100!");

  while(i!=4){
    print("\nEscolha uma das opções abaixo para continuar: ");
    print("1 - Depositar dinheiro");
    print("2- Sacar dinheiro");
    print("3 - Exibir sua conta e saldo");
    print("4 - Para sair");
    i = int.tryParse(stdin.readLineSync()?? "")?? 0;

    switch (i){
      case 1:
        print("\n\nOpção escolhida: Depositar dinheiro");
        print("Informe o valor a ser depositado: ");
        int valor = int.tryParse(stdin.readLineSync()?? "")?? 0;
        if(valor<=0){
        throw Exception("Não foi possível depositar, valor é igual ou menor que zero!");
        } else{
          usuario1.depositar(valor);
        }

      case 2:
        print("\n\nOpção escolhida: Sacar dinheiro");
        print("Informe o valor a ser retirado: ");
        int valor = int.tryParse(stdin.readLineSync()?? "")?? 0;
        if(valor>usuario1.saldo){
          throw Exception("Não foi possível sacar, o valor é superior ao saldo!");
        } else{
          usuario1.sacar(valor);
        }

      case 3:
        print("\n\nOpção escolhida: Exibir conta e saldo");
        usuario1.exibirConta();

    }
  }



}