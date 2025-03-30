
//criação da classe pessoa 
class Pessoa {
  
  //criação das variávei com as interrogações já que elas não podem ser inicializadas como nulas;
  String? nome;
  String? sobrenome;
  bool? ativo;
  int? idade;
  double? peso;
  String? nacionalidade;

  //método para juntar o nome e sobrenome
  String nomeCompleto(String? nome, String? sobrenome){
    String nomeCompleto = "Nome completo: " + nome! + " " + sobrenome! + "\n"; 
    return nomeCompleto;
  }


  @override
  String toString() {
    //criação da string que será retornada na impressão
    var impressao = "";
    impressao += nomeCompleto(nome, sobrenome);
    impressao += "Idade = $idade \n";

    //Verificador da situação ativo para realizar a correta impressão
    if(ativo == true){
        impressao+= "Situação: Ativo \n";
    } else {
        impressao+= "Situação: Inativo \n";
    }  

    impressao += "Peso: $peso \n";

    //verificador da inicialização ou não da nacionalidade para a correta impressão
    if(nacionalidade != null && nacionalidade!.isNotEmpty){ //Com o uso do isNotEmpty é possível verificar se a variável não foi apenas iniciada sem nenhum conteúdo dentro (como por exemplo aspas sem nenhum conteúdo dentro)
        impressao += "Nacionalidade: $nacionalidade \n";
    } else{
        impressao += "Nacionalidade não informada \n";
    }

    return impressao;
  }



}

void main(){
  //instancia uma nova pessoa
  Pessoa pessoa1 = new Pessoa();

  //Preenche essa instância
  pessoa1.nome = "Rafael";
  pessoa1.sobrenome = "Antunes";
  pessoa1.ativo = true;
  pessoa1.idade = 18;
  pessoa1.peso = 73.5;
  pessoa1.nacionalidade = "Brasil";

  //imprime essa instância
  print(pessoa1.toString());

}