*** Settings ***
Resource    ../../resources/config/package.robot

*** Keywords ***
Quando inserir os dados do produto
    [Arguments]       ${nomeProduto}         ${precoProduto}           ${descricaoProduto}               ${quantidadeProduto}
    ${bodyPostProd}   Criar produtos         nome=${nomeProduto}       preco=${precoProduto}             descricao=${descricaoProduto}     quantidade=${quantidadeProduto}
    Log               ${bodyPostProd}

    HeadersAuth                        ${token}
    ${RESPOSTA}                        Post Cadastrar       /produtos        ${headersAuth}    ${bodyPostProd}
    Set Test Variable                  ${RESPOSTA}
    Log                                ${RESPOSTA.json()}

Então a API exibe o status
    [Arguments]                       ${statusCode}
    Should Be Equal As Strings        ${RESPOSTA.status_code}        ${statusCode}
    Log                               ${RESPOSTA.status_code}

E mostrará a mensagem
    [Arguments]     ${mensagem}
    Should Be Equal As Strings        ${RESPOSTA.json()}[message]             ${mensagem}
    Log                               ${RESPOSTA.json()}[message]

E verificar a mensagem de validação do campo
    [Arguments]                       ${campo}                                ${mensagem}
    Should Be Equal As Strings        ${RESPOSTA.json()}[${campo}]            ${mensagem}
    Log                               ${RESPOSTA.json()}[${campo}]