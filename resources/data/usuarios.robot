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