void main(){

    //criação das variáveis, algumas estão com o interrogação no final a fim de evitar erro de compilação por se tratar de variáveis não nuláveis por padrão
    String? nome;
    String? sobrenome;
    bool? ativo;
    int idade;
    double peso;
    String? nacionalidade;


    //inicializando as variáveis 
    //(a nacionalidade não foi inicializada com o objetivo de testar se o programa atende a segunda opção de retorno dele)
    nome = "Rafael";
    sobrenome = "Antunes";
    String nomeCompleto = "Nome completo: $nome $sobrenome";
    idade = 18;
    peso = 72.5;
    ativo = true;
    
    //impressão dos resultados
    print(nomeCompleto);
    print("Idade: $idade");
    print("Peso: $peso");

    //Verificador da situação ativo para realizar a correta impressão
    if(ativo == true){
        print("Situação: Ativo");
    } else {
        print("Situação: Inativo");
    }    
    
    //verificador da inicialização ou não da nacionalidade para a correta impressão
    if(nacionalidade != null && nacionalidade.isNotEmpty){ //Com o uso do isNotEmpty é possível verificar se a variável não foi apenas iniciada sem nenhum conteúdo dentro (como por exemplo aspas sem nenhum conteúdo dentro)
        print("Nacionalidade: $nacionalidade");
    } else{
        print("Nacionalidade não informada");
    }

}