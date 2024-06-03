*** Settings ***
Resource    ../../resources/config/package.robot
Resource    ../data/login.robot

*** Keywords ***
Quando inserir email e senha
    [Arguments]                        ${email}           ${password}
    ${bodyLogin}      Fazer login     email=${email}     password=${password}
    Log      ${bodyLogin}

    ${RESPOSTA}    Post in    /login        ${bodyLogin}
    Set Global Variable                     ${RESPOSTA}

Então a API deve retornar o status code
    [Arguments]                             ${statusCode}
    Should Be Equal As Strings              ${RESPOSTA.status_code}       ${statusCode}
    Log                                     ${RESPOSTA.status_code}

E exibir a mensagem
    [Arguments]                             ${mensagem}
    Should Be Equal                         ${RESPOSTA.json()}[message]    ${mensagem}
    Log                                     ${RESPOSTA.json()}[message]