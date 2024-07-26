*** Variables ***
${URL}    https://www.amazon.com.br/
${LOGO_ID}    nav-logo
${MENU_ELETRÔNICOS}    //a[@href='/Eletronicos-e-Tecnologia/b/?ie=UTF8&node=16209062011&ref_=nav_cs_electronics'][contains(.,'Eletrônicos')]
${MENU_TITLE_ELETRÔNICOS}    //h1[contains(.,'Eletrônicos e Tecnologia')]
${CATEGORIA_COMPUTADORES_E_INFORMATICA}    //h1[contains(.,'Eletrônicos e Tecnologia')]    
${BARRA_DE_PESQUISA}    twotabsearchtextbox
${BOTÃO_DE_BUSCA}    nav-search-submit-button
${RESULTADO_DE_PESQUISA}    //span[@data-component-type='s-result-info-bar'] 
${NOME_DO_PRODUTO}    //span[@class='a-size-base-plus a-color-base a-text-normal'][contains(.,'Console Xbox Series S')]
*** Settings ***
Library    SeleniumLibrary



*** Keywords ***

Abrir navegador
    Open Browser    browser=chrome
    Maximize Browser Window

Fechar o navegador
    Close Browser

Acessar a home page do site Amazon.com.br
    Go To    url=${URL}
    Wait Until Element Is Visible    id=${LOGO_ID}

Entrar no menu "${TEXTO}"
    Click Element    ${MENU_ELETRÔNICOS}

Verificar se o título da página fica "Eletrônicos e Tecnologia"
    Title Should Be     Eletrônicos e Tecnologia | Amazon.com.br
Verificar se aparece a frase "Eletrônicos e Tecnologia"
    Wait Until Element Contains    ${MENU_TITLE_ELETRÔNICOS}    Eletrônicos e Tecnologia
Verificar se aparece a categoria "Computadores e Informática"
    Wait Until Element Is Visible    ${CATEGORIA_COMPUTADORES_E_INFORMATICA}
Digitar o nome de produto "${TEXTO}" no campo de pesquisa
    Input Text    id=${BARRA_DE_PESQUISA}    ${TEXTO}
Clicar no botão de pesquisa
    Click Button    ${BOTÃO_DE_BUSCA}
Verificar o resultado da pesquisa se está listando o produto pesquisado
    Wait Until Element Contains    ${RESULTADO_DE_PESQUISA}    "Xbox Series S"

# GHERKING

Dado que estou na home page da Amazon.com.br
    Acessar a home page do site Amazon.com.br
Quando acessar o menu "Eletrônicos"
    Click Element    ${MENU_ELETRÔNICOS}
Então o título da página deve ficar "Amazon.com.br : Xbox Series S"
    Title Should Be    Amazon.com.br : Xbox Series S
Então o título da página deve ficar "Eletrônicos e Tecnologia | Amazon.com.br"
    Title Should Be    Eletrônicos e Tecnologia | Amazon.com.br
E o texto "Eletrônicos e Tecnologia" deve ser exibido na página
    Verificar se aparece a frase "Eletrônicos e Tecnologia"
E a categoria "Computadores e Informática" deve ser exibida na página
    Verificar se aparece a categoria "Computadores e Informática"
Quando pesquisar pelo produto "${TEXTO}"
    Input Text    id=${BARRA_DE_PESQUISA}    ${TEXTO}
    Clicar no botão de pesquisa
E um produto da linha "${TEXTO}" deve ser mostrado na página   
    Verificar o resultado da pesquisa se está listando o produto pesquisado
    Wait Until Element Contains    ${NOME_DO_PRODUTO}    ${TEXTO}
    