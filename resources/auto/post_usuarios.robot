*** Settings ***
Resource    ../../resources/config/package.robot

*** Keywords ***
Quando inserir os dados do usuario
    [Arguments]       ${nome}             ${email}          ${password}              ${administrador}
    ${bodyPostUser}   Criar usuario       nome=${nome}      email=${email}           password= ${password}       administrador=${administrador}  
    Log               ${bodyPostUser}

    HeadersAuth         ${token}
    ${RESPOSTA}         Post Cadastrar     /usuarios        ${headersAuth}           ${bodyPostUser}
    Set Test Variable                      ${RESPOSTA}
    Log                                    ${RESPOSTA.json()}    

Então a API retorna o status
    [Arguments]                       ${statusCode}
    Should Be Equal As Strings        ${RESPOSTA.status_code}        ${statusCode}
    Log                               ${RESPOSTA.status_code}

E a mensagem 
    [Arguments]     ${mensagem}
    Should Be Equal As Strings        ${RESPOSTA.json()}[message]             ${mensagem}
    Log                               ${RESPOSTA.json()}[message]

E a mensagem no campo
    [Arguments]                       ${campo}                                ${mensagem}
    Should Be Equal As Strings        ${RESPOSTA.json()}[${campo}]            ${mensagem}
    Log                               ${RESPOSTA.json()}[${campo}]