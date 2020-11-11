#language: pt

Funcionalidade: COMO coordenador do HC
PARA um total de médicos por especilidade
QUERO um gráfico de barras com o total de médicos por especialidades

Cenário: Visualizar o total de médicos por especialidade
    Quando o cliente acessa a página de médicos
    Então ele vê um gráfico de barras com o total de médicos por especialidades
