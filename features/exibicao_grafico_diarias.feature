#language: pt

Funcionalidade: Gráficos das diárias por período
COMO coordenador do HC
PARA visualizar as consultas de um determinado período
QUERO um gráfico acessível da homepage que mostre a quantidade de consultas realizadas por dia no período selecionado com divisão por sexos

Cenário: Visualizar distribuição por gênero de um determinado período em formato de gráfico
    Quando o cliente acessa a página de consultas para acessar o gráfico de um período por gênero
    Então ele vê um gráfico carregando informações do período selecionado por gênero