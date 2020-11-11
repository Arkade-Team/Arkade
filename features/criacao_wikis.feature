#language: pt

Funcionalidade: Cadastro de Wiki
  COMO coordenador do HC
  PARA acompanhar os acesso às Wikis no aplicativo 
  QUERO cadastrar Wikis e suas respectivas quantidades de leituras feitas no app

  Cenário: leitura de wiki
    Dado nenhum registro anterior de wiki
    Quando recebo uma requisição de leitura da Wiki "Calculadora FRAX"
    Então a resposta deve conter o registro da Wiki "Calculadora FRAX"

  Cenário: visualização de wiki
    Dado o usuário na página principal da aplicação
    Quando o cliente clica em "Wikis"
    Então ele visualiza uma tabela contendo os nomes das wikis registradas
