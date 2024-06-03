*** Settings ***
Resource     ../config/package.robot

*** Keywords ***
Fazer login
    [Arguments]    ${email}    ${password}
        ${login}=    Create Dictionary
        Run Keyword If    "${email}" != 'None'            Set To Dictionary    ${login}     email            ${email}
        Run Keyword If    "${password}" != "None"         Set To Dictionary    ${login}     password         ${password}
    RETURN        ${login}