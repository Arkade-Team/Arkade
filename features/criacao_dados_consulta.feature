#language: pt

Funcionalidade: Criar dados de Consulta
  Como coordenador do HC-USP
  Quero ter acesso às informações de Consulta do MED CheckApp
  Para que o sistema possa agregar e fazer um tratamento dos dados

Cenário: Criar uma consulta com sucesso
    Quando o cliente requisita POST /appointments com idade "42" e sexo "male"
    Então a resposta deve conter um id

Cenário: Falhar ao criar consulta - falta sexo
    Quando o cliente requisita POST /appointments somente com idade "42"
    Então a resposta deve conter uma lista de erros

Cenário: Falhar ao criar consulta - falta idade
    Quando o cliente requisita POST /appointments somente com sexo "male"
    Então a resposta deve conter uma lista de erros

Cenário: Falhar ao criar consulta - sexo inválido
    Quando o cliente requisita POST /appointments com idade "42" e sexo "foo"
    Então a resposta deve conter uma lista de erros

Cenário: Falhar ao criar consulta - idade inválida
    Quando o cliente requisita POST /appointments com idade "131" e sexo "male"
    Então a resposta deve conter uma lista de erros
