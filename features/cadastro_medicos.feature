#language: pt

Funcionalidade: Cadastro de Médicos
    COMO coordenador do HC
    PARA ter a relação dos médicos
    QUERO cadastrar os dados dos médicos (CRM, Nome e Especialidade)

Cenário: Cadastro de médico com sucesso
Dado que estou na página de cadastro de médico
Quando preencho o campo "CRM" com "0111222/SP"
Quando preencho o campo "Nome" com "Alécio Godoi"
Quando preencho o campo "Especialidade" com "Cardiologista"
Quando clico em salvar
Então ele deve ser salvo no banco de dados
Então verei o médico na página de dados de médico

Cenário: Cadastro de médico com erro - sem CRM
Dado que estou na página de cadastro de médico
Quando deixo o campo "CRM" vazio
Quando preencho o campo "Nome" com "Alécio Godoi"
Quando preencho o campo "Especialidade" com "Cardiologista"
Quando clico em salvar
Então verei uma mensagem de erro "can't be"

Cenário: Cadastro de médico com erro - sem Nome
Dado que estou na página de cadastro de médico
Quando preencho o campo "CRM" com "0111222/SP"
Quando deixo o campo "Nome" vazio 
Quando preencho o campo "Especialidade" com "Cardiologista"
Quando clico em salvar
Então verei uma mensagem de erro "can't be"

Cenário: Cadastro de médico com erro - sem Especialidade
Dado que estou na página de cadastro de médico
Quando preencho o campo "CRM" com "0111222/SP"
Quando preencho o campo "Nome" com "Alécio Godoi"
Quando deixo o campo "Especialidade" vazio
Quando clico em salvar
Então verei uma mensagem de erro "can't be"

