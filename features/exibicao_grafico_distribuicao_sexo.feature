#language: pt

Funcionalidade: Gráfico de distribuição sexo
    COMO coordenador do HC
    PARA visualizar a distribuição dos sexos nas consultas
    QUERO um gráfico acessível da homepage que mostre as diferenças nas contagens históricas de sexo masculino e feminino
    
Cenário: Visualizar distribuição de sexo em formato de gráfico
    Quando o cliente acessa a página de consultas para acessar o gráfico de distribuicão por sexo
    Então ele vê um gráfico carregando informações sobre o sexo dos pacientes