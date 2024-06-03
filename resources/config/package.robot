*** Settings ***
Documentation    Este é o gerenciador de dependências da automação

Library      FakerLibrary
Library      RequestsLibrary
Library      Collections
Library      String

Resource     services.robot
Resource     ../data/produtos.robot
Resource     ../data/login.robot
Resource     utils.robot
Resource     ../auto/login.robot
Resource     ../auto/get_produtos.robot
Resource     ../auto/post_produtos.robot