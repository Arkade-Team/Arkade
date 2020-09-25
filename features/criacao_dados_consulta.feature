#language: pt

Funcionalidade: Criar dados de Consulta
  Como coordenador do HC-USP
  Quero ter acesso às informações de Consulta do MED CheckApp
  Para que o sistema possa agregar e fazer um tratamento dos dados

Cenário: Criar uma consulta com sucesso
    Quando o cliente requisita POST /appointments com idade "42" e sexo "male"
    Então a resposta deve conter um id
