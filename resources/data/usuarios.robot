*** Settings ***
Resource     ../config/package.robot

*** Keywords ***
Criar usuario
    [Arguments]    ${nome}    ${email}    ${password}    ${administrador}
        ${usuario}=    Create Dictionary
        Run Keyword If    "${nome}" != 'None'            Set To Dictionary    ${usuario}     nome                ${nome}
        Run Keyword If    "${email}" != "None"           Set To Dictionary    ${usuario}     email               ${email}
        Run Keyword If    "${password}" != "None"        Set To Dictionary    ${usuario}     password            ${password}
        Run Keyword If    "${administrador}" != "None"   Set To Dictionary    ${usuario}     administrador       ${administrador}
    RETURN        ${usuario}

Cadastrar usuario
    Criar email
    ${bodyPostUser}   Criar usuario       nome=Harry Potter      email=${EMAIL_TEST}           password=test       administrador=true 
    Log               ${bodyPostUser}

    HeadersAuth         ${token}
    ${RESPOSTA}         Post Cadastrar     /usuarios        ${headersAuth}           ${bodyPostUser}
    Set Test Variable                      ${RESPOSTA}
    Log                                    ${RESPOSTA.json()}

    Set Test Variable    ${ID_USUARIO}     ${RESPOSTA.json()["_id"]}
    Log                                    ${RESPOSTA.json()["_id"]}   

Excluir usuario
    Delete Id In      /usuarios     ${ID_USUARIO}