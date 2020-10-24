#language: pt

Funcionalidade: Consultas por período dos ultimos quize dias
COMO coordenador do HC
PARA visualizar a demanda por período
QUERO uma tabela que agregue os dados das consultas dos últimos 15 dias por período (manhã, tarde, noite e madrugada)

Cenário: Visualizar quantidade de consultas por período
    Quando o coordenador acessa a página de consultas por período
    Então ele vê uma tabela contendo a quantidade de consultas por período
