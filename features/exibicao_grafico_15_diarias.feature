#language: pt

Funcionalidade: Gráficos das últimas quinze diárias
COMO coordenador do HC
PARA visualizar as consultas das últimas quinze diárias
QUERO um gráfico acessível da homepage que mostre a quantidade de consultas realizadas por dia nos últimos 15 dias com divisão por sexos

Cenário: Visualizar distribuição por gênero das últimas quinze diárias em formato de gráfico
    Quando o cliente acessa a página de consultas para acessar o gráfico de quinze diárias por gênero
    Então ele vê um gráfico carregando informações das últimas quinze diárias por gênero
