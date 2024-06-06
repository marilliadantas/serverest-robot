*** Settings ***
Resource     ../config/package.robot

*** Keywords ***
# Fazer login
#     [Arguments]    ${email}    ${password}
#         ${login}=    Create Dictionary
#         Run Keyword If    "${email}" != 'None'            Set To Dictionary    ${login}     email            ${email}
#         Run Keyword If    "${password}" != "None"         Set To Dictionary    ${login}     password         ${password}
#     RETURN        ${login}

# Fazer login
#     [Arguments]    ${email}    ${password}
#     ${login}=    Create Dictionary
#     IF    "${email}" != 'None'
#         Set To Dictionary    ${login}    email    ${email}
#     END
#     IF    "${password}" != "None"
#         Set To Dictionary    ${login}    password    ${password}
#     END
#     RETURN    ${login}

Fazer login
    [Arguments]    ${email}    ${password}
    ${login}=    Create Dictionary
    IF        "${email}" != 'None'      Set To Dictionary    ${login}    email       ${email}  
    IF        "${password}" != "None"   Set To Dictionary    ${login}    password    ${password}   
    RETURN     ${login}