import 'dart:io';

void main(){
  // 10 => 7
  // 3
  // 7/10 => 0.3 * 100 => 30
  print("Calculando o desconto sob um produto!\n");
  print("Informe o valor original do produto: ");
  double valorTotal = double.tryParse(stdin.readLineSync()?? "")?? 1; //tratametno onde em caso de possível valor nulo, é colocado o valor 1
  print("Informe o valor do produto com desconto: ");
  double valorComDesconto = double.tryParse(stdin.readLineSync()?? "")?? 1;

  //calculando o desconto
  double diferenca = valorTotal - valorComDesconto;
  double desconto = diferenca / valorTotal * 100;
  print("O valor original do produto era de R\$$valorTotal, passando para R\$$valorComDesconto, com %${desconto.toStringAsFixed(2)} de desconto!");
}