void main() {
  //criando o mapa
  Map<String, List<String>> cidades = Map<String, List<String>>();
  //adicionando as cidades e os estados ao mapa
  cidades["SC"] = ["Gaspar", "Blumenau", "Florianopolis"];
  cidades["PR"] = ["Curitiba", "Cascavel"];
  cidades["SP"] = ["Sao Paulo", "Guarulhos", "Campinas"];
  cidades["MG"] = ["Belo Horizonte", "Juiz de Fora", "Berlinda"];

  //imprimindo as siglas dos estados (keys)
  String estados = "";
  cidades.forEach((key, value) => estados += "$key; ");
  print("Estados: $estados");

  //pegando as cidades de SC
  List <String> cidadesSC = cidades.entries.where((entry) => entry.key == "SC").expand((entry) =>  entry.value).toList();
  cidadesSC.sort();

  //imprimindo as cidades de SC em ordem alfabética
  String cidadeSC = "";
  cidadesSC.forEach((cidade) => cidadeSC += "$cidade; ");
  print("\nCidades de SC: $cidadeSC");

  //criando lista com cidades em ordem alfabética
  List<String> todasCidades = cidades.entries.expand((entry) => entry.value.map((cidade) => "$cidade - ${entry.key}")).toList();todasCidades.sort();

  // Imprimindo as cidades em ordem alfabética
  print("\nCidades ordenadas:");
  todasCidades.forEach((cidade)=> {
    print("$cidade")
  });

}


