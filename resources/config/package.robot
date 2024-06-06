*** Settings ***
Documentation    Este é o gerenciador de dependências da automação

Library      FakerLibrary
Library      RequestsLibrary
Library      Collections
Library      String

Resource     services.robot
Resource     utils.robot
Resource     ../data/usuarios.robot
Resource     ../data/produtos.robot
Resource     ../data/login.robot
Resource     ../auto/login.robot
Resource     ../auto/get_produtos.robot
Resource     ../auto/post_produtos.robot
Resource     ../auto/post_usuarios.robot