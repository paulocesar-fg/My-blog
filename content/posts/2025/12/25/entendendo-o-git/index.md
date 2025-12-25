---
title: "Entendendo o Git"
date: 2025-12-25T19:53:20-0300
draft: false
description: "Descrição do post aqui"
tags: [computation, git]
categories: [computation]
---

Olá caro leitor(a), Meu nome é Paulo César e sou o criador deste blog. 

Neste post, quero falar sobre controle de versionamento, mais especificamente sobre Git. Recentemente, tenho estudado sobre o assunto e precisava dar um "dump",sendo esse é justamente o objetivo deste post.

Além disso, desde o início, quero deixar claro que este texto NÃO É UM TUTORIAL. A internet está cheia de conteúdo sobre Git, inclusive você pode ler a [documentação oficial ](https://git-scm.com/docs/git), ou ler o livro [ProGit](https://git-scm.com/book/en/v2) disponível gratuitamente no site oficial do Git.

Dito isso, vamos ao conteúdo.


## Introdução

Inicialmente, quero contextualizar o assunto trazendo um exemplo que, creio eu, quase todo desenvolvedor iniciante já passou. 

Você tem uma ideia de projeto novo e começa a codar, adicionando funcionalidade atrás de funcionalidade. Até que, por muito azar, você altera algumas linhas de código, ou exclui um arquivo, e quando você percebe seu projeto simplesmente quebra. Depois disso, você pensa "Puts! Se eu pudesse retorna à versão anterior...". 

A partir desse dia, você pensa "Ok. Assim que eu salvar o arquivo, vou copiar o projeto para outro diretório,e, portanto, caso o projeto quebre, ainda terei a versão anterior". 

Essa solução seria uma espécie de *Local Version Control System*( Conceito que será posteriormente explicado ). No início pode até funcionar, porém, se o projeto crescer, você terá um grande amontoado de arquivos duplicados, possivelmente mal organizado e ocupando muito espaço em disco. 

Os problemas desse tipo de abordagem claramente não acabam aqui, se mesmo nos dias atuais, tendo a disponibilidade de terasbyte de armazenamento, essa solução é inviável.

Agora, imagine há 45 anos atrás, no início do anos 80, quando os computadores como, por exemplo, o TK-90 dispunham de apenas 16kb, ou, no melhor dos casos, de 48kb.

Além disso, desenvolvemos softwares em equipes, pense no quão desastroso seria fazer isso em um sistema desses. 

Após listar todos esses problemas, creio que tenho ficado claro que o controle de versionamento é algo fundamental no desenvolvimento de software. Entretando, fazer isso não é uma tarefa fácil. Dessa forma, surgiram os *Version Control Systems*, ou em português, *Sistemas de Controle de versionamento.* 

Como o próprio nome sugere, os Version Control Systems( VCSs ) são sistemas desenvolvidos para coordenar e facilitar o controle de versionamento. 



