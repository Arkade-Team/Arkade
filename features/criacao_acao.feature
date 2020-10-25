#language: pt

Funcionalidade: Cadastro de ações por doença
  COMO coordenador do HC
  PARA analisar os dados das ações tomadas para cada doença
  QUERO inserir o nome da ação, o tipo (questionário ou calculadora de risco) e o resultado final

Cenário: Acessar ações
    Quando o coordenador acessar a página de ações
    Então deverá ver um formulário contendo as ações cadastradas