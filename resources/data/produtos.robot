*** Settings ***
Resource     ../config/package.robot

*** Keywords ***
Criar produtos
    [Arguments]    ${nome}    ${preco}    ${descricao}    ${quantidade}
        ${produtos}=    Create Dictionary
        Run Keyword If    "${nome}" != 'None'         Set To Dictionary    ${produtos}     nome          ${nome}
        Run Keyword If    "${preco}" != "None"        Set To Dictionary    ${produtos}     preco         ${preco}
        Run Keyword If    "${descricao}" != "None"    Set To Dictionary    ${produtos}     descricao     ${descricao}
        Run Keyword If    "${quantidade}" != "None"   Set To Dictionary    ${produtos}     quantidade    ${quantidade}
    RETURN        ${produtos}