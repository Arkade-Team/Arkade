#language: pt

Funcionalidade: Distribuição das doenças investigadas
COMO coordenador do HC
PARA analisar a distribuição das doenças investigadas
QUERO uma tabela acessível a partir de doenças investigadas que mostre a distribuição da quantidade de consultas para cada doença investigada.

Cenario: Visualizar tabela quantidade de consultas por doença
    Quando o coordenador acessa a página de deonças investigadas
    Então ele vê uma tabela contendo <Doença> e <Qt. Consultas>