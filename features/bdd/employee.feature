#language: pt

Funcionalidade: Pesquisar Funcionarios
    Para averiguar informacoes
    O usuario do sistema
    Deseja poder consultar informacoes dos Funcionarios

    Cenario: Buscar informacoes de Funcionario
        Dado que o usuario consulte informacoes de Funcionario
        Quando ele fizer a busca
        Entao uma lista com os funcionarios deve retornar

    @cenario_dois
    Cenario: Cadastrar funcionario
        Dado que o usuario cadastre um novo usuario
        Quando ele enviar as informacoes do funcionario
        Entao esse funcionario sera cadastrado

    @cenario_tres
    Cenario: Modificar informacoes de funcionario
        Dado que o usuario altere uma informacao de funcionario
        Quando ele enviar as alteracoes
        Entao as informacoes serao alteradas
