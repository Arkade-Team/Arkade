#language: pt

Funcionalidade: Criar dados de Doenças Investigadas
  Como coordador do HC-USP
  Quero visualizar os nomes das doenças que foram investigadas
  Para analisar os dados de Doenças Investigadas

  Cenário: Criar uma doença com sucesso
    Dado uma consulta de "female" de "65" anos
    Quando o cliente investiga "Osteoporose"
    Então a resposta deve ser uma lista contendo um único id
