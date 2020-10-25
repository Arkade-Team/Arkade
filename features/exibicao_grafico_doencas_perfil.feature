#language: pt

Funcionalidade: Visualização de doença por perfil dos pacientes
COMO coordenador do HC
PARA identificar os perfis de pacientes com doenças investigadas através das consultas
QUERO gráficos de barras ou tabelas para a analise dos dados dos pacientes por perfil (gênero e/ou idade) e de doenças investigadas

Cenário: Visualizar os dados das consultas dos clientes por gênero e doenças através de um gráfico de barras
    Quando o cliente acessa a página de consultas para acessar o gráfico por gênero e doenças
    Então ele vê um gráfico carregando informações das consultas por gênero e doenças

Cenário: Visualizar os dados das consultas dos clientes por idades e doenças através de um gráfico de barras empilhadas
    Quando o cliente acessa a página de consultas para acessar o gráfico por idades e doenças
    Então ele vê um gráfico carregando informações das consultas por idades e doenças
    


