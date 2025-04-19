
- esquema principal => menu principal com as opções (fazer um loop while)
- 
- Os arquivos das leituras são obtidos e colocados em mapas => colocar tudo isso dentro de outro arquivo 
  - mapa Leitura mês (onde as keys são os meses e o conteúdo é outro mapa)
    - Mapa leitura dias (onde as keys são os dias e o conteúdo é um mapa );
        - mapa leitura horas (onde as keys são as horas e o conteúdo é uma lista com os dados de cada hora)

- sobre o arquivo de leitura:
  //função processarDados => recebe o diretório da pasta dos arquivos de determinado estado
  // pegar arquivos .csv da pasta daquele estado e colocar em uma lista

  //if que vê qual estado foi passado{
  // um for que processa CADA arquivo da pasta (processa cada mês){

      // ler arquivo e armazenar em uma lista

      // um while que processará cada dia{
        // um for que processará cada hora{
          // pega os dados de cada hora e coloca em um mapa de horas do dia processado
          // pega o mapa de horas e coloca dentro do mapa do dia
        //}

      // }

      // pega o mapa do dia e joga no mapa do mês
  // }
  //}



AS INFORMAÇÕES NECESSÁRIAS PARA O RELATÓRIO SÃO:
• TEMPERATURA:
    o MÉDIA POR ESTADO POR ANO
    o MÉDIA POR ESTADO POR MÊS
    o MÁXIMA POR ESTADO POR ANO
    o MÁXIMA POR ESTADO POR MÊS
    o MÍNIMA POR ESTADO POR ANO
    o MÍNIMA POR ESTADO POR MÊS
    o MÉDIA POR HORÁRIO POR ESTADO
• UMIDADE DO AR:
    o MÉDIA POR ESTADO POR ANO
    o MÉDIA POR ESTADO POR MÊS
    o MÁXIMA POR ESTADO POR ANO
    o MÁXIMA POR ESTADO POR MÊS
    o MÍNIMA POR ESTADO POR ANO
    o MÍNIMA POR ESTADO POR MÊS
• DIREÇÃO DO VENTO:
    o DIREÇÃO DO VENTO COM MAIOR FREQUÊNCIA POR ESTADO POR ANO
    o DIREÇÃO DO VENTO COM MAIOR FREQUÊNCIA POR ESTADO POR MÊS
