*** Settings ***
Resource        ./package.robot

*** Variables ***
${FakeNome}
${FakeEmail}
${FakeSenha}
${FakerDescricao}
${FakerValor}
${palavra_randomica}

*** Keywords ***
Fakers

#FakerName
    ${FakeNome}=             FakerLibrary.Name
    Set Test Variable        ${FakeNome}

#FakerEmail
    ${FakeEmail}=            FakerLibrary.Email
    Set Test Variable        ${FakeEmail}

#FakerSenha
    ${compSenha}=            FakerLibrary.Numerify      text=##
    ${FakeSenha}=            Catenate     Seubarriga    ${compSenha}
    Set Test Variable        ${FakeSenha}

#FakerDescrição
    ${FakerDescricao}=       FakerLibrary.Sentence
    Set Test Variable        ${FakerDescricao}

#FakerValor
    ${FakerValor}=           FakerLibrary.Numerify    ###
    Set Test Variable        ${FakerValor}


Palavra randomica
    ${palavra_randomica}    Generate Random String    length=8    chars=[LETTERS]
    ${palavra_randomica}    Convert To Lower Case     ${palavra_randomica}
    Set Test Variable       ${palavra_randomica}           