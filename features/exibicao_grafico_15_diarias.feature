#language: pt

Funcionalidade: Gráficos das últimas 15 diárias
COMO coordenador do HC
PARA visualizar as consultas das últimas diárias
QUERO um gráfico acessível da homepage que mostre a quantidade de consultas realizadas por dia nos últimos 15 dias com divisão por sexos

Cenário: Visualizar distribuição por gênero das últimas 15 diárias em formato de gráfico
    Quando o usuário acessa a página de consultas
    Então ele vê um gráfico carregando informações das últimas 15 diárias por gênero
