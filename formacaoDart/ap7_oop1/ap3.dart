//classe produto
import 'dart:math';

class produto {
  late String nome;
  late double preco;

  produto({required this.nome, required this.preco});

  //metodo desconto
  double desconto({required double percentualDesconto}){
    //pega o percentual de desconto e faz ele/100
    percentualDesconto = percentualDesconto/100;
    // pega o valor principal e multiplica por esse novo valor de percentual
    double novopreco = preco*percentualDesconto;
    return novopreco;

  }

}


void main(){
  //criando a lista com vários produtos
  List <produto> listaProdutos= [
    produto(nome: "farofa", preco: 13.50),
    produto(nome: "Banana", preco: 7.50),
    produto(nome: "Shampoo", preco: 23.75),
    produto(nome: "Nescau", preco: 12.00),
    produto(nome: "Hamburguer", preco: 24.00)
  ];

  listaProdutos.forEach((produto){
    double descontoAleatorio = Random().nextDouble()*100;
    double novoValor = produto.desconto(percentualDesconto: descontoAleatorio);
    print("Novo preço do produto ${produto.nome} = R\$${novoValor.toStringAsFixed(2)} (desconto de: ${descontoAleatorio.toStringAsFixed(2)}%)");
  });



}