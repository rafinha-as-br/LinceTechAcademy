
//classes abstratas
abstract class Carro{
  //metodo carro ligado
  void carroLigado();
}
abstract class Pneu{
  //metodo pneuCheio
  void pneuCheio();
}

//classe concreta
class FiatUno implements Carro, Pneu{
  //fazendo a construções dos métodos abstratos
  carroLigado(){
    print("O Fiat Uno está ligado!");
  }
  pneuCheio(){
    print("Os pneus do uno estão calibrados!");
  }
}

void main(){
  //instanciando a classe concreta e chamando os métodos
  final unoDeFirma = FiatUno();
  unoDeFirma.carroLigado();
  unoDeFirma.pneuCheio();
}