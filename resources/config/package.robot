*** Settings ***
Documentation    Este é o gerenciador de dependências da automação

Library      FakerLibrary
Library      RequestsLibrary
Library      Collections
Library      String

Resource     services.robot
Resource     utils.robot
Resource    ../auto/login.robot
Resource    ../auto/get_produtos.robot