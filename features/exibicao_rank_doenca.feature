#language: pt

Funcionalidade: Rank doença
    COMO coordenador do HC
    PARA ter o rank das doenças pelo periodo informado
    QUERO listar o rank ordenado com a maior e menor quantidade de consultas por doença

Cenário: Listagem da tabela com sucesso
Quando o coordenador acessa a página de consultas por período
Então ele deve listar a tabela dos ranks em ordem crescente.
E listar a tabela de doenças raras.

Cenário: Listagem da tabela sem dados
Quando o coordenador acessa a página de consultas por período
Então ele deve listar a tabela dos ranks com a mensagem de sem consultas.