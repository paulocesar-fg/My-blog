---
title: "Version Control Systems(VCS) - Panorama geral"
date: 2025-12-25T19:53:20-0300
draft: false
description: "Descrição do post aqui"
tags: [computation, git]
categories: [computation]
---

Olá caro leitor(a), Meu nome é Paulo César e sou o criador deste blog. 


Neste post, quero falar sobre Sistemas de controle de versionamento. Recentemente tenho estudo o assunto e precisava dar um "dump". Além disso, quero ressaltar que vou fazer um panorama geral sobre os VCS, e que vou me aprofundar na história do Git, pois atualmente é ferramenta de versionamento que mais venho utilizando.

Dito isso, vamos ao conteúdo.


## Introdução

Inicialmente, quero contextualizar o assunto trazendo um exemplo que, creio eu, quase todo desenvolvedor iniciante já passou. 

Você tem uma ideia de projeto novo e começa a codar, adicionando funcionalidade atrás de funcionalidade. Até que, por muito azar, você altera algumas linhas de código, ou exclui um arquivo, e quando você menos percebe seu projeto simplesmente quebra. Depois disso, você pensa "Puts! Se eu pudesse retorna à versão anterior...". 

A partir desse dia, você pensa em uma possível solução "Ok. Assim que eu salvar o arquivo, vou copiar o projeto para outro diretório, então , caso o projeto quebre, ainda terei a versão anterior". 

Essa solução seria uma espécie de *Local Version Control System*( Conceito que será posteriormente explicado ). No início pode até funcionar, porém, se o projeto crescer, você terá um grande amontoado de arquivos duplicados, possivelmente mal organizados e ocupando um espaço desnecessário em disco. 

Se mesmo nos dias atuais, tendo a disponibilidade de terasbyte de armazenamento, essa solução é inviável. Agora, imagine há 45 anos atrás, no início do anos 80, quando os computadores como, por exemplo, o TK-90 dispunham de apenas 16kb, ou, no melhor dos casos, de 48kb.

Além disso, desenvolvemos softwares em equipes, pense no quão desastroso seria fazer isso em um sistema desses. 

Esses são apenas alguns dos muitos problemas que um mal gerenciamento de versões pode trazer. Então,  creio que tenha ficado claro que o controle de versionamento é algo fundamental no desenvolvimento de software. Entretando, fazer isso pode não ser  uma tarefa fácil. Dessa forma, surgiram os *Version Control Systems*, ou em português, *Sistemas de Controle de versionamento.* 

Assim como o próprio nome sugere, os Version Control Systems( VCSs ) são ferramentas desenvolvidas para ajudar no gerenciamento das alterações do projeto ao longo do tempo. 

## História e evolução dos VCSs



