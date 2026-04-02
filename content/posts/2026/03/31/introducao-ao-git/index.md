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

Então, de forma simplificada, é o seguinte: 

{{< image src="/images/working-tree-index-repository.webp" caption="Working tree, index and repository">}}

Se existir um snapshot no repositório(Repository) → você faz checkout → edita na diretório de trabalho(Working Directory) → adiciona ao staging(Index) → commit → novo snapshot salvo no repositório(Repository).

## Ciclo de vida dos arquivos

Cada arquivo no Working directory(diretório de trabalho) pode estar em um dos seguintes status: **tracked(rastreados)** e **untracked(não-rastreado)**.

Os arquivos **rastreados** são aqueles que foram incluídos no último *snapshot*; eles podem ser **unmodified(não-modificado)**, **modified(modificado)** ou **staged(preparados)**.

Em resumo, os arquivo rastreados(tracked) são aqueles que o git "conhece".

Enquanto isso, os arquivos **não-rastreados(untracked)** são todos os outros arquivos que estão no Working Directory, mas que **não foram incluídos no último snapshot**.

No primeiro momento, quando clonamos um repositório todos os arquivos são rastreados(tracked) e não modificados(unmodified).

Assim que editamos o arquivo, o Git os considera modificados, porque o editamos desde o último commit. Depois disso, você prepara os arquivos editados então faz commit das alterações, e esse ciclo se repete.

{{< image src="/images/file-status-lifecycle.webp" caption="Ciclo de vida dos arquivos no git">}}


## Criando o primeiro repositório

Para começar, logicamente é necessário ter o git instalado, para isso acesse o [site oficial do git](https://git-scm.com/install/) e veja as instruções de download. No momento, estou utilizando o WSL2 com a distro Ubuntu, nesse caso, basta executar:

```zsh
sudo apt update && sudo apt install git
```

Antes de criar um repositório vamos fazer umas configurações básicas, a primeira delas é adicionar um nome de usuário e um email. Para modificar as configurações do git usa-se o comando `git config`.

Para mudar o username e email basta executar o comando:

```zsh
git config --global user.name "Your username"
git config --global user.email "Your email"
```

Utilize a tag `--global`, porque assim o git salvará globalmente, mas se quiser utilizar uma configuração local basta rodar o comando sem a opção `--global` dentro do projeto.

Além disso, vou modificar o editor de texto padrão, no meu Ubuntu veio nano, porém o vim me agrada mais. Para mudar isso é simples, basta rodar

```zsh
git config --global core.editor vim
```

E por último, alterar o nome inicial padrão da branch. Por padrão o git nomea a branch inicial de **master**, contudo, o padrão atual é nomear a branch principal de **main**. Para isso execute:

```zsh
git config --global init.defaultBranch main
```

Basicamente, há duas formas de se obter um reposiório git: iniciar um repositório novo usando o comando `git init`, ou fazer um clone de um repositório já existente usando o comando `git clone`.

ps: Para fazer um clone use o comando `git clone` seguido de do "endereço" do repositório.

No nosso caso, vamos iniciar um novo repositório git, então vou criar um diretório qualquer e fazer `git init`

```zsh
mdkir learn-git && cd learn-git
git init
```

Após isso,  rodamos `ls -la`, ao ver o stdout vai perceber que foi criado um novo diretório nomeado como `.git`. Esse diretório, em resumo, é o "coração do git".

O diretório ainda está "vazio", então vamos criar um novo arquivo.


```bash
touch file1.txt
```

Depois disso, vamos usar o comando `git status`. O nome do comando é autoexplicativo, ele serve para mostrar o status dos arquivos. Executando o comando o output é este:

```stdout
On branch main

No commits yet

Untracked files:
  (use "git add <file>..." to include in what will be committed)
	first.txt

nothing added to commit but untracked files present (use "git add" to track)
```

Cada arquivo no diretório de trabalho pode estar em um de dois estados: tracked ou untracked. Os arquivos tracked(rastreados) são arquivos que foram incluídos no último snapshot.

O git classifica o arquivo `file1.txt` como `untracked`, isto é, não rastreado. Esse status é dado a arquivos que não estavam presentes no último snapshot e que não estão na área de staged.

Para colocar o arquivo no Index(staging area) e rastreá-lo(tracking) use o comando `git add`

```zsh
git add file1.txt
```

Se fizer git status novamente

```stdout
On branch main

No commits yet

Changes to be committed:
  (use "git rm --cached <file>..." to unstage)
	new file:   file1.txt
```

É possível saber que o arquivo está no Index porque ele aparece sob o título "Changes to be commited". Se você fizer um commit nesse momento, a versão do arquivo que existia no instante que foi executado o `git add` será armazenada no histórico de *snapshots*.

Ps: O comando git add pode receber tanto caminhos de arquivos, quanto de diretórios.

Mas agora, vamos fazer o commit desse arquivo, usando o comando `git commit`. 

Ao executar o comando o git vai abrir o editor de texto padrão definido. Assim, basta escrever a mensagem de commit na primeira linha e salvar o arquivo. Se tudo der certo você verá uma mensagem como esta:

```stdout
 git commit
[main (root-commit) 24f36d9] first commit
 1 file changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 file1.txt
```

Se fizer git status novamente:

```stdout
On branch main
nothing to commit, working tree clean
```

Vai receber a mensagem dizendo que não há nada para "commitar".

Agora vamos, fazer uma modificação qualquer no arquivo `file1.txt`

```zsh
echo "modification" >> file1.txt
```

Rodando `git status`

```stdout
On branch main
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
	modified:   file1.txt

no changes added to commit (use "git add" and/or "git commit -a")
```

Dessa vez, nosso arquivo está rastreado, porém exibe o status modified(modificado). Esse estado é dado a arquivos que estavam no último snapshot e que foram modificados posteriormente.

Para salvar essa modificação no repositório fazendo `git add` para mandar o arquivo alterado para o Index.  E depois fazer `git commit`.

```zsh
git add file1.txt
git commit -m "second commit"
``` 

Agora rodamos o comando `git log` para ver o histórico de commits

```stdout
commit 4f4b2cd1e7977cfc893849a6e1dd966186475ccf
Author: paulocesar-fg <pcfggama@gmail.com>
Date:   Wed Apr 1 21:03:48 2026 -0300

    second commit

commit dd2cde62a5bca4a43d8f454a4ffa375b6d116da9
Author: paulocesar-fg <pcfggama@gmail.com>
Date:   Wed Apr 1 20:32:10 2026 -0300

    first commit
```

Se quiser algo mais resumido(em uma linha) basta adicionar a opção `--oneline` ao git log.

## Ignorando arquivos

Muitas vezes em teremos uma série de arquivos que não queremos que sejam adicionados pelo git. Felizmente o git nos dá a opção de ignorá-los. Para isso basta criar um arquivo nomeado `.gitignore` e nesse arquivo escrever uma série de padrões de nomes de arquivos para serem ignorados.

Um exemplo de .gitignore seria

```.gitignore
*.env
node_modules/
*.map
*.[oa]
```

Algumas obserções:

1. As linhas em branco ou começando com `#` são ignoradas; 

2. Você pode negar  um padrão usando o ponto de exclamação `!` no início. 

3. Expressões regulares simples usadas em ambiente shell, como *, [], ? podem ser utilizadas.

## Ramificações
Praticamente todos os VCSs possuem alguma forma de suporte a ramificações(Branches). As Branches possibilitam trabalhar no projeto sem alterar a linha principal.

Alguns VCSs vaziam isso de formas terríveis, alguns exigem que façamos uma nova cópia do código-fonte , o que pode ser horrível em projetos grandes.

Por sorte, o modelo de ramificações do Git é um "recurso matador" e certamente diferencia o git em relação a seus concorrentes. 

Como dito anteriormente o Git salva suas alterações como uma série de deltas(diferenças), mas sim como uma série de  *snapshots*.

Quando fazemos `git commit` o Git armazena um objeto de commit que possui um ponteiro para o snapshot do conteúdo que estava no Index. Este objeto contém o nome do autor, e-maili, e a mensação de commit

## Repositório remoto e a diferença de Git e Github

## Comandos Básicos
