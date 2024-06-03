<p align="center">
  <img src="image-1.png" alt="Alt Text">
</p>
<div align="center">

  <h1>Projeto - Teste de API com Robot Framework</h1>
</div>

Este projeto tem como objetivo realizar testes de API utilizando o Serve Rest como servidor de testes. Serve Rest é uma plataforma online para práticas de testes de API, que fornece endpoints para simulação de requisições HTTP.

## Ferramentas utilizadas:
- [Robot Framework](https://robotframework.org/robotframework/ "Robot Framework")

## Bibliotecas utilizadas:
- [Requests Library](https://marketsquare.github.io/robotframework-requests/doc/RequestsLibrary.html "Requests Library")
- [String Library](https://robotframework.org/robotframework/latest/libraries/String.html "String Library")
- [Collections Library](https://robotframework.org/robotframework/latest/libraries/Collections.html "Collections Library")

## Pré-Requisitos
- Certifique-se de ter o Python instalado em sua máquina. Você pode baixá-lo [aqui](https://www.python.org/downloads/ "Python Download").
- Tenha uma IDE instalada (por exemplo, VS Code).

## Instalando o Robot Framework e Bibliotecas Relacionadas
Você pode instalar o Robot Framework e as bibliotecas necessárias executando os seguintes comandos no terminal ou prompt de comando:

```bash
pip install -r requirements.txt
```

## Executando os Testes
Execute os testes com o seguinte comando, substituindo `nome_do_arquivo.robot` pelo nome do arquivo que contém seus casos de teste:

```bash
robot -d logs tests/features
```

## Executando os Testes com Allure Report
```bash
robot -d logs --listener allure_robotframework tests/features
```

## Gerando o report
```bash
allure serve output/allure
```

## Arquitetura
```
.
├── readme.md
├── resources
│   ├── auto
│   │   ├── get_produtos.robot
│   │   └── login.robot
│   └── config
│       ├── package.robot
│       ├── services.robot
│       └── utils.robot
├── logs
│   ├── log.html
│   ├── output.xml
│   └── report.xml
└── testes
    ├── features
    │   ├── 01-login.robot
    │   └── 02-get_produtos.robot
    ├── delete_serverest_test.robot
    ├── get_serverest_test.robot
    ├── post_serverest_test.robot
    └── put_serverest_test.robot
└── .github
    └── workflows
        └── ci.yml

```

## ✨ Contribuições

Contribuições são bem-vindas! Sinta-se à vontade relatar problemas encontrados ou sugerir melhorias. Bons estudos!! 🚀