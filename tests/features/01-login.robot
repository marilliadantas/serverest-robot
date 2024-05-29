*** Settings ***
Resource            ../../resources/config/package.robot
Suite Setup      Conectar a API    /login

*** Test Cases ***
Login
    Quando inserir email e senha válidos
    Então a API deve retornar o status code     200
    E exibir a mensagem                         Login realizado com sucesso