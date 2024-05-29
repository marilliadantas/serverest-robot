*** Settings ***
Resource    ../../resources/config/package.robot

*** Keywords ***
Quando inserir email e senha válidos
    ${RESPOSTA}    Post in    /login        ${BODY_LOGIN}
    ${token}       Convert To String        ${RESPOSTA.json()}[authorization]
    Set Global Variable                     ${token}
    Set Global Variable                     ${RESPOSTA}

Então a API deve retornar o status code
    [Arguments]                             ${statusCode}
    Should Be Equal As Strings              ${RESPOSTA.status_code}       ${statusCode}

E exibir a mensagem
    [Arguments]                             ${mensagem}
    Should Be Equal                         ${RESPOSTA.json()}[message]    ${mensagem}