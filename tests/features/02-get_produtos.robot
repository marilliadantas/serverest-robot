*** Settings ***
Resource            ../../resources/config/package.robot
Suite Setup         Conectar a API    /login

*** Test Cases ***
CT01: Buscar produtos com sucesso
    Quando realizar a requisição GET
    Então a API retorna o status code             200
    E exibir uma lista de produtos

CT01: Buscar produto por ID
    Quando realizar a requisição GET pelo id      BeeJh5lz3k6kSIzA
    Então a API retorna o status code             200
    E exibir as informações no body

CT03: Buscar produto por ID inválido
    Quando realizar a requisição GET pelo id      BeeJh5lz3k6kSIzB
    Então a API retorna o status code             400
    E exibir a mensagem                           Produto não encontrado