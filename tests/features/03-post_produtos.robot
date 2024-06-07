*** Settings ***
Resource            ../../resources/config/package.robot
Suite Setup         Login

*** Test Cases ***
CT01: Cadastrar produto - Sucesso
    Palavra randomica
    Quando inserir os dados do produto               ${palavra_randomica}   1313    Test   100
    Então a API exibe o status                       201
    E mostrará a mensagem                            Cadastro realizado com sucesso

CT02: Cadastrar produto - Duplicado
    Quando inserir os dados do produto               Logitech MX Vertical   1313    Test   100
    Então a API exibe o status                       400
    E mostrará a mensagem                            Já existe produto com esse nome

CT03: Cadastrar produto - Campo preço com letras
    Quando inserir os dados do produto               nome   abc    Test   100
    Então a API exibe o status                       400
    E verificar a mensagem de validação do campo     preco   preco deve ser um número

CT04: Cadastrar produto - Campo quantidade com letras
    Quando inserir os dados do produto               nome   1000    Test   abc
    Então a API exibe o status                       400
    E verificar a mensagem de validação do campo     quantidade    quantidade deve ser um número

CT05: Cadastrar produto - Campo nome vazio
    Quando inserir os dados do produto               None   1313    Test   100
    Então a API retorna o status code                400
    E verificar a mensagem de validação do campo     nome    nome é obrigatório

CT06: Cadastrar produto - Campo descricao vazio
    Quando inserir os dados do produto               nome   preco   ${EMPTY}   quantidade
    Então a API exibe o status                       400
    E verificar a mensagem de validação do campo     descricao    descricao não pode ficar em branco

CT07: Cadastrar produto - Campo preço vazio
    Quando inserir os dados do produto               nome     None    descricao    quantidade 
    Então a API exibe o status                       400  
    E verificar a mensagem de validação do campo     preco    preco é obrigatório

CT08: Cadastrar produto - Campo quantidade vazio
    Quando inserir os dados do produto               nome     None    descricao    quantidade 
    Então a API exibe o status                       400  
    E verificar a mensagem de validação do campo     quantidade    quantidade deve ser um número