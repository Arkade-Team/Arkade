#language: pt

Funcionalidade: Gráfico de Doenças Relacionadas
  COMO coordenador do HC
  PARA analisar as doenças investigadas em conjunto
  QUERO visualizar um gráfico de bolhas que mostre a quantidade de consultas que investigam cada par de doenças cadastradas

  Cenário: Duas doenças cadastradas com uma consulta em comum
    Dado apenas uma consulta histórica
    E nesta consulta foi investigado Osteoporose e Depressão
    Quando o cliente acessa a homepage
    E o cliente clica em "Doenças"
    Então ele deve visualizar uma tabela com id "related_diseases"
