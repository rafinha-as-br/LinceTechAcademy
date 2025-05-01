//classe música
import 'dart:io';

class Musica {
  late final String _tituloMusica;
  late final String _nomeArtista;
  late final String _nomeDoAlbum;
  late final double _duracao;

  Musica(String titulodaMusica, String nomeArtista, String nomeAlbum, double duracaoMusica){
    this._tituloMusica = titulodaMusica;
    this._nomeArtista = nomeArtista;
    this._nomeDoAlbum = nomeAlbum;
    this._duracao = duracaoMusica;
  }

}
//função imprimir toda a biblioteca música
void imprimirBiblioteca(){
  print("\n***Imprimindo toda a biblioteca: *** \n");
  for(int i=0; i<listaMusicas.length; i++){
    print("Nome da música: ${listaMusicas[i]._tituloMusica}");
    print("Artista: ${listaMusicas[i]._nomeArtista}");
    print("Álbum: ${listaMusicas[i]._nomeDoAlbum}");
    print("Duração: ${listaMusicas[i]._duracao}");
    print("\n");
  }
}

//função procurar por uma música 
void procurarMusica(){
  int i=0;
  print("\nProcurar uma música...");
  print("Informe o nome da música, artista ou o álbum!");
  String info = stdin.readLineSync()?? "";
  if(info.length < 3){
    while (i!=1){
      print("Você precisa informar pelo menos 3 caracteres na pesquisa, tente novamente!");
      info = stdin.readLineSync()?? "";
      if(info.length>3){
        i=1;
      }
    }
  }

  print("\nProcurando...\n");
  bool encontrado = listaMusicas.any((musica) => musica._tituloMusica.toLowerCase().contains(info.toLowerCase()) || musica._nomeArtista.toLowerCase().contains(info.toLowerCase()) || musica._nomeDoAlbum.toLowerCase().contains(info.toLowerCase()));
  if(encontrado){
    print("Encontramos músicas!!\n");
    for(int i=0; i<listaMusicas.length; i++){
      if(listaMusicas[i]._tituloMusica.toString().toLowerCase().contains(info.toLowerCase()) || listaMusicas[i]._nomeArtista.toString().toLowerCase().contains(info.toLowerCase()) || listaMusicas[i]._nomeDoAlbum.toString().toLowerCase().contains(info.toLowerCase())){
        print("Nome da música: ${listaMusicas[i]._tituloMusica}");
        print("Artista: ${listaMusicas[i]._nomeArtista}");
        print("Álbum: ${listaMusicas[i]._nomeDoAlbum}");
        print("Duração: ${listaMusicas[i]._duracao}");
        print("\n");
      }
    }
  } else{
    print("Não foi encontrado nenhuma música, artista ou álbum com esse nome...\n");
  }
  



}

//lista com instâncias da classe música (representa a biblioteca de músicas)
List <Musica> listaMusicas = [
  Musica('Emptiness Machine', 'Linkin Park', 'From Zero', 3.05),
  Musica('Cut the brigde', 'Linkin Park', 'From zero', 3.35),
  Musica('Blinded In Chains', 'Avenged Sevenfold', 'City of evil', 6.34),
  Musica('Chop Suey', 'System of a Down', 'Toxity', 3.30),
  Musica('Striken', 'Disturbed', 'Ten tousand Fists', 4.05),
  Musica('Awake and Alive', 'Skillet', 'Awake', 3.29)
];

void main(){
  int i=0;
  while(i!=1){
    print("Olá! Escolha uma ação: ");
    print("1 - Imprimir toda a biblioteca de músicas");
    print("2 - Procurar por uma música");
    print("3 - Sair");
    int j = int.tryParse(stdin.readLineSync()??"")??0;
    switch(j){
      case 1:
        imprimirBiblioteca();
      case 2:
        procurarMusica();
      case 3:
        print("\nEncerrando o programa!");
        i=1;
    }
  }
  
  
}