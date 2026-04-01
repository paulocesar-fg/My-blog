---
title: "Introdução ao Git"
date: 2026-03-31T07:11:48-0300
draft: false
description: "Entendendo o básico de git."
tags: [git]
categories: [Computation]

featuredImage: "/images/introducao-ao-git-cover.webp"
lightgallery: true


---

Olá, meu nome é Paulo César! Neste post, quero explicar o funcionamento básico do Git e mostrar alguns comandos essenciais. 

Basicamente, o Git é um sistema de controle de versionamento distribuído (DVCS) que, atualmente, é utilizado em larga escala no desenvolvimento de software.

Se quiser entender mais sobre a história dos VCSs e como o Git começou recomendo a leitura do seguinte artigo [link aqui].

## Fluxo de trabalho básico do Git

O fluxo do Git pode ser divido em três grandes áreas: 
- Working directory(diretório de trabalho);
- Staging Area(área de preparação);
- Repository(Repositório).

O **Working Directory** (diretório de trabalho) contém os arquivos reais no seu computador. É aqui que criamos, editamos e removemos arquivos. Essas alterações ainda não fazem parte do histórico do Git.

A **Staging Area** (área de preparação), também chamada de Index, é uma estrutura intermediária onde definimos exatamente quais mudanças irão compor o próximo commit. Ela funciona como uma “prévia” do snapshot que será salvo.

Por exemplo, imagine que você alterou dois arquivos, mas deseja que apenas um deles seja incluído no próximo commit. Ao adicionar apenas esse arquivo ao Index (git add), você está selecionando explicitamente o que será versionado naquele momento. 

O **Repository (repositório)** é onde o Git armazena os snapshots completos do projeto, ou seja, todo o histórico de commits. Cada snapshot é registrado como um commit, formando uma sequência (ou grafo) de versões ao longo do tempo.

Os dados armazenados no repositório são imutáveis: após um commit ser criado, seu conteúdo não é alterado. Novas mudanças geram novos commits, preservando o histórico anterior.

## Primeiros passos

Para começar, logicamente é necessário ter o git instalado, para isso acesse o [site oficial do git](https://git-scm.com/install/) e veja as instruções de download. No momento, estou utilizando o WSL2 com a distro Ubuntu, nesse caso, basta executar:

```zsh
sudo apt update && sudo apt install git
```

Agora que tem o git instalado, entre em um diretório(de preferência vazio) e execute o comando `git init`, esse comando inicializa um novo repositório git.

Após isso,  rodamos `ls -la`, ao ver o stdout vai perceber que foi criado um novo diretório nomeado como `.git`. Esse diretório, em resumo, é o "coração do git".

O diretório ainda está "vazio", então vamos criar um novo arquivo.


```bash
touch file1.txt
```

Depois disso, vamos usar o comando `git status`. O nome do comando é autoexplicativo, ele serve para mostrar o status dos arquivos. Executando o comando o output é este:

```stdout
On branch master

No commits yet

Untracked files:
  (use "git add <file>..." to include in what will be committed)
	first.txt

nothing added to commit but untracked files present (use "git add" to track)
```

Cada arquivo no diretório de trabalho pode estar em um de dois estados: tracked ou untracked. Os arquivos tracked(rastreados) são arquivos que foram incluídos no último snapshot.

O git classifica o arquivo `file1.txt` como `untracked`, isto é, não rastreado. Esse status é dado a arquivos que não estavam presentes no último snapshot e que não estão na área de staged.