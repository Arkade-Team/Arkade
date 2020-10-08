#language: pt

Funcionalidade: Gráfico de distribuição etária
    COMO coordenador do HC
    PARA visualizar a distribuição das faixas etárias
    QUERO um gráfico acessível a partir da homepage que mostre a distribuição da quantidade de consultas para cada faixa etária definida

Cenário: Visualizar distribuição de idade em formato de gráfico
    Quando o cliente acessa a homepage
    E o cliente clica em "Consultas"
    Então ele vê um gráfico carregando informações