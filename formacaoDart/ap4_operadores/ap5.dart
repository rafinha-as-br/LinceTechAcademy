void main(){
  //inicializando mapa
  Map<String, int?> pessoas = Map<String, int?>();
  pessoas["Nelson"] = null;
  pessoas["Jane"] = null;
  pessoas["Jack"] = 16;
  pessoas["Rupert"] = 37;
  pessoas["Andy"] = 13;
  pessoas["Kim"] = 27;
  pessoas["Robert"] = 31;

  //imprimindo as pessoas
  pessoas.forEach((key, value){
    print("$key - ${value ?? "idade não informada"}");
  });

}