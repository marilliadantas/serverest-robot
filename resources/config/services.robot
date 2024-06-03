*** Settings ***
Resource            ./package.robot

*** Variables ***
${token}
${BASE_URL}         https://serverest.dev
&{HEADERS_LOGIN}    accept=application/json
...                 Content-Type=application/json

*** Keywords ***
Conectar a API
    [Arguments]                       ${endpoint}
    Create Session    apiServeRest    ${BASE_URL}    ${HEADERS_LOGIN}

Post in
    [Arguments]         ${endpoint}   ${body}
    ${response}         POST          ${BASE_URL}${endpoint} 
    ...                 json=${body}    
    ...                 headers=${HEADERS_LOGIN}
    ...                 expected_status=any
    
    RETURN              ${response}

Get in
    [Arguments]         ${endpoint}
    ${response}         GET            ${BASE_URL}${endpoint}   
    ...                 headers=${HEADERS_LOGIN}
    
    RETURN              ${response}

Get Id In
    [Arguments]         ${endpoint}    ${id}
    ${response}         GET            ${BASE_URL}${endpoint}/${id}
    ...                 headers=${HEADERS_LOGIN}
    ...                 expected_status=any
    
    RETURN              ${response}

Post Cadastrar
    [Arguments]         ${endpoint}   ${headers}    ${body}
    ${response}         POST          ${BASE_URL}${endpoint} 
    ...                 json=${body}   
    ...                 headers=${headers}
    ...                 expected_status=any
    
    RETURN             ${response}

Login
    Conectar a API    /login
    Quando inserir email e senha    beltrano@qa.com.br    teste
    ${token}            Convert To String        ${RESPOSTA.json()}[authorization]
    Set Global Variable                          ${token}

HeadersAuth
    [Arguments]             ${token} 
    ${headersAuth}          Create Dictionary    Authorization=${token}
    Set Test Variable       ${headersAuth}