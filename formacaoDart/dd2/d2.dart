import 'dart:io';
import 'dart:math';

/* *Observação: Eu criei apenas um único novo fornecedor de alimentos pois
não faz sentido adicionar novos fornecedores para cada tipo de alimento,
 é mais lógico e ideal se criar um único tipo de fornecedor que fornece os alimentos
 */

void main() {
  final pessoa = Pessoa();

  final fornecedorAlimentos = FornecedorDeAlimentos();
  final fornecedorBebidas = FornecedorDeBebidas();
  int i=1;
  int vezesComer = 0;


  while(i==1){
    pessoa.informacoes();
    // *** 6. Informando o número de refeições realizado pela pessoa
    print("Você comeu $vezesComer vezes!");
    print("Você deseja comer? (1 - Sim | 2 - Não)");
    int j= int.tryParse(stdin.readLineSync()?? "")?? 0;
    if(j==1){
      pessoa.refeicao(fornecedorBebidas, fornecedorAlimentos);
      vezesComer++;
    } else if(j==2){
      print("Você parou de comer!");
      i==0;
    } else{
      print("\n\n **Erro! Você precisa informar um valor válido!***");
    }
  }


}

class Produto {
  Produto(this.nome, this.calorias);

  /// Nome deste produto
  final String nome;

  /// Total de calorias
  final int calorias;
}

class FornecedorDeBebidas {
  final _random = Random();
  final _bebidasDisponiveis = <Produto>[
    Produto('Agua', 0),
    Produto('Refrigerante', 200),
    Produto('Suco de fruta', 100),
    Produto('Energetico', 135),
    Produto('Cafe', 60),
    Produto('Cha', 35),
  ];

  // ***** 2. Escolhendo produtos aleatórios *****
  Produto fornecer() {
    return _bebidasDisponiveis[_random.nextInt(_bebidasDisponiveis.length)];
  }
}

// *** 1. Criando novos fornecedores

class FornecedorDeAlimentos {
  final _random = Random();
  final _alimentosDisponiveis = <Produto>[
    Produto('Sanduíche de atum', 360),
    Produto('Sanduíche de hambúrguer ', 240),
    Produto('Bolo de cenoura', 100),
    Produto('Bolo de chocolate', 135),
    Produto('Batata Frita', 680),
    Produto('Torresmo', 670),
    Produto('Hamburgão', 935),
    Produto('Dogão', 835),
  ];

  // ***** 2. Escolhendo produtos aleatórios *****
  Produto fornecer() {
    return _alimentosDisponiveis[_random.nextInt(_alimentosDisponiveis.length)];
  }
}

class Pessoa {
  // **** 4. Definindo um número de calorias aleatório
  int _caloriasConsumidas = Random().nextInt(2500);
  get getCaloriaConsumidas => _caloriasConsumidas;



  /// Imprime as informacoes desse consumidor
  void informacoes() {
    print('Calorias consumidas: $_caloriasConsumidas');

    //**** 5. Definindo se a pessoa precisa de refeição ou não
    final statusCalorico = obterStatusCaloria(_caloriasConsumidas);
    if(statusCalorico == statusCaloria.DeficitExtremo){
      print("\nStatus calórico: ${statusCalorico.name}");
      print("A pessoa precisa de mais refeições!");
    } else if(statusCalorico == statusCaloria.Deficit){
      print("\nStatus calórico: ${statusCalorico.name}");
      print("A pessoa precisa de um pouco de refeições!");
    } else if(statusCalorico == statusCaloria.Satisfeita){
      print("\nStatus calórico: ${statusCalorico.name}");
      print("A pessoa está satisfeita! Não precisa de mais refeições!");
    }else if(statusCalorico == statusCaloria.Excesso){
      print("\nStatus calórico: ${statusCalorico.name}");
      print("A pessoa precisa parar imediatamente de comer!");
    }

  }

  //**** 3. Lógica Status
  statusCaloria obterStatusCaloria(int calorias){
    //definido o status calórico por padrão como satisfeito pois senão ele não deixa retornar
    statusCaloria statusCalorico = statusCaloria.Satisfeita;
    if(calorias<=500){
      statusCalorico = statusCaloria.DeficitExtremo;
    } else if(calorias>500 && calorias<=1800){
      statusCalorico = statusCaloria.Deficit;
    } else if(calorias>1800 && calorias<=2500){
      statusCalorico = statusCaloria.Satisfeita;
    } else if(calorias>2500){
      statusCalorico = statusCaloria.Excesso;
    }
    return statusCalorico;
  }


  /// Consome um produto e aumenta o número de calorias
  void refeicao(FornecedorDeBebidas fornecedorBebida, FornecedorDeAlimentos fornecedorAlimentos) {
    final bebida = fornecedorBebida.fornecer();
    final comida = fornecedorAlimentos.fornecer();


    print('Comendo ${comida.nome} (${comida.calorias} calorias) e bebendo ${bebida.nome} (${bebida.calorias} calorias)');

    _caloriasConsumidas += comida.calorias;
    _caloriasConsumidas += comida.calorias;

  }


}

enum statusCaloria{
  DeficitExtremo,
  Deficit,
  Satisfeita,
  Excesso
}