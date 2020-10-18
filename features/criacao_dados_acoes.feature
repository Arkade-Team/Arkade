#language: pt

Funcionalidade: Criar dados de ações tomadas nas consultas realizadas
    COMO coordenador do HC
    PARA analisar os dados das ações tomadas para cada doença
    QUERO inserir o nome da ação, o tipo (questionário ou calculadora de risco) e o resultado final

    Cenário: Criar ações tomadas nas consultas
        Dado uma consulta existente de Osteoporose
        Quando a ação tomada é "Exercícios físicos"
        Então a resposta deve ser uma lista contendo o nome da ação "Exercícios físicos"

    Cenário: Falha ao criar ações - consulta inválida
        Dado nenhuma consulta
        Quando o cliente procurar a ação de "Exercícios físicos"
        Então a resposta deve ser um erro
