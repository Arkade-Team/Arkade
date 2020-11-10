#language: pt

Funcionalidade: Cadastro de hospital
    COMO coordenador de saúde do estado de são paulo
    PARA analisar as consultas em um hospital
    QUERO visualizar detalhes das consultas realizadas em determinado hospital.

Cenário: Cadastrar hospital
    Quando o cliente requisita POST /hospitals com nome "Hcor"
    Então a resposta deve conter um id

Cenário: Consultar hospitais
    Quando o coordenador acessar a página de hospitais
    Então deverá ver uma lista de hospitais cadastrados

Cenário: Consultar agendamento por hospital
    Quando o coordenador acessar a página de hospitais
    E clicar no hospital "Hcor"
    Então deverá ver uma lista de agendamentos realizados
