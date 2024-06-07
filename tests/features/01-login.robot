*** Settings ***
Resource            ../../resources/config/package.robot
Suite Setup         Conectar a API    /login

*** Test Cases ***
Login - Sucesso                          
    Cadastrar usuario
    Quando inserir email e senha                ${EMAIL_TEST}    test
    Então a API deve retornar o status code     200
    E exibir a mensagem                         Login realizado com sucesso
    Excluir usuario
    
Login - E-mail inválido
    Quando inserir email e senha                teste1@qa.com    teste
    Então a API deve retornar o status code     401
    E exibir a mensagem                         Email e/ou senha inválidos

Login - Senha inválida
    Quando inserir email e senha                beltrano@qa.com.br    senhaInvalida
    Então a API deve retornar o status code     401
    E exibir a mensagem                         Email e/ou senha inválidos

Login - E-mail e senha inválidos    
    Quando inserir email e senha                teste1@qa.com    senhaInvalida
    Então a API deve retornar o status code     401
    E exibir a mensagem                         Email e/ou senha inválidos