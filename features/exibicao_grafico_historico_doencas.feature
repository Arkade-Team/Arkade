#language: pt

Funcionalidade: Exibição gráfico historico doenças consultadas 
COMO coordenador do HC
PARA visualizar as doenças investigadas das últimas quinze diárias
QUERO um gráfico acessível da homepage que mostre a quantidade de consultas realizadas por dia e doenças nos últimos 15 dias.

Cenário: Visualizar distribuição quantidade de consultas por doença das últimas quinze diárias em formato de gráfico
    Quando o cliente acessa a página de consultas para acessar o gráfico de quinze diárias por doença
    Então ele vê um gráfico carregando informações das últimas quinze diárias por doença

Cenário: Falha em exibição do gráfico do historico doenças consultadas
    Quando o cliente acessa a página de consultas para acessar o gráfico de quinze diárias por doença
    Então ele não deve ver uma mensagem "Sem historico consultas"