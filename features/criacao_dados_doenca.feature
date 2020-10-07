#language: pt

Funcionalidade: Criar dados de Doenças Investigadas
  Como coordador do HC-USP
  Quero visualizar os nomes das doenças que foram investigadas
  Para analisar os dados de Doenças Investigadas

  Cenário: Visualizar doenças criadas
    Dado uma consulta que investigou "Osteoporose"
    Quando o cliente acessa a homepage
    E o cliente clica em "Doenças"
    Então ele vê uma tabela contendo "Osteoporose"

  Cenário: Criar uma doença com sucesso
    Dado uma consulta de "female" de "65" anos
    Quando o cliente investiga "Osteoporose"
    Então a resposta deve ser uma lista contendo um único id

  Cenário: Falha ao criar doença - consulta inválida
    Dado nenhuma consulta
    Quando o cliente investiga "Osteoporose"
    Então a resposta deve ser um erro
