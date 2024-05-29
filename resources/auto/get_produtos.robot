*** Settings ***
Resource    ../../resources/config/package.robot

*** Keywords ***
Quando realizar a requisição GET
    ${RESPOSTA}    Get in     /produtos
    Set Global Variable       ${RESPOSTA}
    Log                       ${RESPOSTA.json()}

Quando realizar a requisição GET pelo id
    # Set Test Variable                ${id}                        ${RESPOSTA.json()}[produtos][0][_id]
    # Log                              ${id}
    ${RESPOSTA}       Get Id In     /produtos                       BeeJh5lz3k6kSIzA
    Log                             ${RESPOSTA}
    Set Test Variable               ${RESPOSTA}

Quando realizar a requisição GET pelo id inválido
    ${RESPOSTA}       Get Id In     /produtos                       BeeJh5lz3k6kSIzB
    Log                             ${RESPOSTA}
    Set Test Variable               ${RESPOSTA}

E exibir as informações no body
    Should Be Equal As Strings    ${RESPOSTA.json()["nome"]}        Logitech MX Vertical
    Should Be Equal As Strings    ${RESPOSTA.json()["preco"]}       470
    Should Be Equal As Strings    ${RESPOSTA.json()["descricao"]}   Mouse
    Should Be Equal As Strings    ${RESPOSTA.json()["_id"]}         BeeJh5lz3k6kSIzA
    Should Not Be Empty           ${RESPOSTA.json()}

Então a API retorna o status code
    [Arguments]    ${statusCode}
    Should Be Equal As Strings       ${RESPOSTA.status_code}        ${statusCode}

E exibir uma lista de produtos  
    Should Not Be Empty      ${RESPOSTA.json()}