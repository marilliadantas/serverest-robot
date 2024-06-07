*** Settings ***
Resource            ../../resources/config/package.robot
Suite Setup         Conectar a API    /usuarios

*** Test Cases ***
CT01: Cadastrar usuário com sucesso
    Criar email                                 
    Quando inserir os dados do usuario         Fulano da Silva    ${EMAIL_TEST}   teste    true    
    Então a API retorna o status               201
    E a mensagem                               Cadastro realizado com sucesso

CT02: Cadastrar usuário - Campo nome vazio                           
    Quando inserir os dados do usuario         None   ${EMAIL_TEST}   teste    true    
    Então a API retorna o status               400
    E a mensagem no campo                      nome    nome é obrigatório

CT03: Cadastrar usuário - Campo email vazio                        
    Quando inserir os dados do usuario         Fulano da Silva    None    teste    true    
    Então a API retorna o status               400
    E a mensagem no campo                      email   email é obrigatório

CT04: Cadastrar usuário - Campo administrador vazio                              
    Quando inserir os dados do usuario         Fulano da Silva    ${EMAIL_TEST}     teste       None    
    Então a API retorna o status               400
    E a mensagem no campo                      administrador     administrador é obrigatório