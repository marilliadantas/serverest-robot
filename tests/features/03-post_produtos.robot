*** Settings ***
Resource            ../../resources/config/package.robot
Suite Setup         Login

*** Test Cases ***
Cadastrar produto - Sucesso
    Palavra randomica
    Quando inserir os dados do produto               ${token}   ${palavra_randomica}   1313    Test   100
    Então a API exibe o status                       201
    E mostrará a mensagem                            Cadastro realizado com sucesso

Cadastrar produto - Duplicado
    Quando inserir os dados do produto               ${token}   Logitech MX Vertical   1313    Test   100
    Então a API exibe o status                       400
    E mostrará a mensagem                            Já existe produto com esse nome

Cadastrar produto - Campo nome vazio
    Quando inserir os dados do produto               ${token}   ${EMPTY}   1313    Test   100
    Então a API retorna o status code                400
    E verificar a mensagem de validação do campo     nome    nome não pode ficar em branco

Cadastrar produto - Campo descricao vazio
    Quando inserir os dados do produto               ${token}   nome   preco    ${EMPTY}   quantidade
    Então a API exibe o status                       400
    E verificar a mensagem de validação do campo     descricao    descricao não pode ficar em branco