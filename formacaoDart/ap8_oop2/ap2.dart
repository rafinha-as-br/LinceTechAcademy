//classe abstrata animal
abstract class Animal{

  //metodo beber
  void beber(){
    print("O animal está bebendo!");
  }

  //metodo comer
  void comer(){
    print("O animal está comendo!");
  }

}
//classe de animal de preferência
class Gato extends Animal{
  //metodo miar
  void miar(){
    print("O gato está miando");
  }
}

void main(){
  //instanciando a classe concreta
  Gato gato1 = new Gato();
  //chamando os métodos
  gato1.beber();
  gato1.comer();
  gato1.miar();
}