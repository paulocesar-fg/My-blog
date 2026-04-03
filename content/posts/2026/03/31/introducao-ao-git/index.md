---
title: "Entendendo o Git: conceitos básicos e ramificações"
date: 2026-03-31T07:11:48-0300
draft: false
description: "Entendendo o básico de git."
tags: [git]
categories: [Computation]

featuredImage: "/images/introducao-ao-git-cover.webp"
lightgallery: true


---

Olá, meu nome é Paulo César! Este é o primeiro post de uma série de artigos entendendo o funcionamento do git. Neste post, quero apresentar um pouco do funcionamento básico do Git e dar uma introdução às ramificações.

Basicamente, o Git é um sistema de controle de versionamento distribuído (DVCS) que, atualmente, é utilizado em larga escala no desenvolvimento de software.

## Fluxo de trabalho básico do Git

O fluxo do Git pode ser divido em três grandes áreas: 
- working directory (diretório de trabalho)
- staging area (área de preparação)
- repository (repositório)

O **working directory** (diretório de trabalho) contém os arquivos reais no seu computador. É aqui que criamos, editamos e removemos arquivos. Essas alterações ainda não fazem parte do histórico do Git.

A **staging area** (área de preparação), também chamada de Index, é uma estrutura intermediária onde definimos exatamente quais mudanças irão compor o próximo commit. Ela funciona como uma "prévia" do snapshot que será salvo.

Por exemplo, imagine que você alterou dois arquivos, mas deseja que apenas um deles seja incluído no próximo commit. Ao adicionar apenas esse arquivo ao Index (git add), você está selecionando explicitamente o que será versionado naquele momento. 

O **repository (repositório)** é onde o Git armazena os snapshots completos do projeto, ou seja, todo o histórico de commits. Cada snapshot é registrado como um commit, formando uma sequência (ou grafo) de versões ao longo do tempo.

Os dados armazenados no repositório são imutáveis: após um commit ser criado, seu conteúdo não é alterado. Novas mudanças geram novos commits, preservando o histórico anterior.

Então, de forma simplificada, é o seguinte: 

{{< image src="/images/working-tree-index-repository.webp" caption="Working tree, index and repository">}}

Se existir um snapshot no repository (repositório) → você faz checkout → edita no diretório de trabalho (working directory) → adiciona ao staging (Index) → commit → novo snapshot salvo no repository (repositório).

## Ciclo de vida dos arquivos

Cada arquivo no working directory (diretório de trabalho) pode estar em um dos seguintes status: **tracked (rastreados)** e **untracked (não-rastreado)**.

Os arquivos **rastreados** são aqueles que foram incluídos no último *snapshot*; eles podem ser **unmodified(não-modificado)**, **modified(modificado)** ou **staged(preparados)**.

Em resumo, os arquivos rastreados (tracked) são aqueles que o git "conhece".

Enquanto isso, os arquivos **não-rastreados (untracked)** são todos os outros arquivos que estão no working directory, mas que **não foram incluídos no último snapshot**.

No primeiro momento, quando clonamos um repositório todos os arquivos são rastreados(tracked) e não modificados(unmodified).

Assim que editamos o arquivo, o Git o considera modificado, porque o editamos desde o último commit. Depois disso, você prepara os arquivos editados então faz commit das alterações, e esse ciclo se repete.

{{< image src="/images/file-status-lifecycle.webp" caption="Ciclo de vida dos arquivos no git">}}


## Criando o primeiro repositório

Para começar, logicamente é necessário ter o git instalado, para isso acesse o [site oficial do git](https://git-scm.com/install/) e veja as instruções de download. No momento, estou utilizando o WSL2 com a distro Ubuntu, nesse caso, basta executar:

```zsh
sudo apt update && sudo apt install git
````

Antes de criar um repositório vamos fazer algumas configurações básicas, a primeira delas é adicionar um nome de usuário e um email. Para modificar as configurações do git usa-se o comando `git config`.

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

Basicamente, há duas formas de se obter um repositório git: iniciar um repositório novo usando o comando `git init`, ou fazer um clone de um repositório já existente usando o comando `git clone`.

ps: Para fazer um clone use o comando `git clone` seguido do "endereço" do repositório.

No nosso caso, vamos iniciar um novo repositório git, então vou criar um diretório qualquer e fazer `git init`

```zsh
mkdir learn-git && cd learn-git
git init
```

Após isso, rodamos `ls -la`, ao ver o stdout vai perceber que foi criado um novo diretório nomeado como `.git`. Esse diretório, em resumo, é o "coração do git".

O diretório ainda está "vazio", então vamos criar um novo arquivo.

```bash
touch file1.txt
```

Depois disso, vamos usar o comando `git status`. O nome do comando é autoexplicativo, ele serve para mostrar o status dos arquivos. Executando o comando o output é este:

```stdout
On branch main

No commits yet

Untracked files:
  (use "git add <file1>..." to include in what will be committed)
	first.txt

nothing added to commit but untracked files present (use "git add" to track)
```

Cada arquivo no diretório de trabalho pode estar em um de dois estados: tracked ou untracked. Os arquivos tracked(rastreados) são arquivos que foram incluídos no último snapshot.

O git classifica o arquivo `file1.txt` como `untracked`, isto é, não rastreado. Esse status é dado a arquivos que não estavam presentes no último snapshot e que não estão na área de staging.

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

É possível saber que o arquivo está no Index porque ele aparece sob o título "Changes to be committed". Se você fizer um commit nesse momento, a versão do arquivo que existia no instante que foi executado o `git add` será armazenada no histórico de *snapshots*.

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

Agora vamos fazer uma modificação qualquer no arquivo `file1.txt`

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

Para salvar essa modificação no repositório faça `git add` para mandar o arquivo alterado para o Index. E depois fazer `git commit`.

```zsh
git add file1.txt
git commit -m "second commit"
```

Agora rodamos o comando `git log` para ver o histórico de commits.

Se quiser algo mais resumido (em uma linha) basta adicionar a opção `--oneline` ao git log.

## Ignorando arquivos

Muitas vezes teremos uma série de arquivos que não queremos que sejam adicionados pelo git. Felizmente o git nos dá a opção de ignorá-los. Para isso basta criar um arquivo nomeado `.gitignore` e nesse arquivo escrever uma série de padrões de nomes de arquivos para serem ignorados.

Um exemplo de .gitignore seria

```.gitignore
*.env
node_modules/
*.map
*.[oa]
```

Algumas observações:

1. As linhas em branco ou começando com `#` são ignoradas
2. Você pode negar um padrão usando o ponto de exclamação `!` no início
3. Expressões regulares simples usadas em ambiente shell, como *, [], ? podem ser utilizadas

## Ramificações (Branches)

Praticamente todos os VCSs possuem alguma forma de suporte a ramificações(Branches). As Branches possibilitam trabalhar no projeto sem alterar a linha principal.

Alguns VCSs fazem isso de formas terríveis, alguns exigem que façamos uma nova cópia do código-fonte, o que pode ser horrível em projetos grandes.

Por sorte, o modelo de ramificações do Git é um "recurso matador" e certamente diferencia o git em relação a seus concorrentes.

Como dito anteriormente, o Git não armazena alterações como deltas (diferenças entre arquivos). Em vez disso, ele registra o estado completo do projeto em determinados momentos, por meio de snapshots.

Quando executamos um git commit, o Git cria um objeto de commit que contém um ponteiro para o snapshot para o conteúdo do Index. Além disso esse objeto guarda alguns metadados como nome do autor, e-mail, a mensagem de commit e ponteiros para o commit ou commits (seu pai ou pais) que vieram antes desse commit.

O primeiro commit feito não possui pai; commits normais possuem um pai; e commits mesclados de vários pais resultam de uma fusão de dois ou mais branches.

Em resumo, você pode pensar em um commit no Git como uma estrutura encadeada (como uma linked list), onde cada commit aponta para seu(s) pai(s), criando o histórico do projeto.

Esse modelo permite que o Git crie branches de forma eficiente, já que uma branch é basicamente um **ponteiro para um commit específico**, e não uma cópia completa dos arquivos.

Vamos ver isso na prática, imagine que criamos um repositório qualquer e que nele fizemos 3 commits, e possuímos inicialmente apenas a branch main.

{{< image src="/images/git-branch.webp" caption="Um branch e seu histórico de commits">}}

### Criando ramificações

Agora vamos criar um novo branch chamado testing, para isso basta executar

```zsh
git branch testing
```

Esse comando cria um novo branch no commit em que estamos atualmente.

Antes de prosseguir precisamos responder uma pergunta fundamental: como o Git sabe em qual branch estamos atualmente?

A resposta é simples, ele mantém um **ponteiro especial** chamado `HEAD`. No git, o `HEAD` é um ponteiro para o branch atual em que estamos. Neste caso ainda estamos na branch *main*, você pode confirmar isso facilmente executando o comando `git branch`.

Basicamente, o comando `git branch testing` apenas *criou* um novo branch -- ele não mudou para aquele branch.

### Alternando entre Branches

Para mudar para outra branch, isto é, fazer o `HEAD` apontar para ela, basta executar `git checkout nome-da-branch` ou `git switch nome-da-branch`

```zsh
git checkout testing
```

ou

```zsh
git switch testing
```

{{< image src="/images/git-branch-2.webp" caption="HEAD apontando para o branch Testing" >}}

**PS:** Se quiser criar uma branch e simultaneamente mudar para ela execute o comando `git checkout -b nome-da-branch`.

*PS:* É possível ver isso executando o comando `git log --decorate` que mostra onde os ponteiros do branch estão apontando.

Agora que estamos no branch testing vamos fazer um novo commit

```
vim test.txt
git commit -a -m "made a change"
```

{{< image src="/images/git-branch-3.webp" caption="O branch do HEAD avança quando um commit é feito ">}}

Algo interessante ocorre, perceba que enquanto o branch `testing` avançou, o branch `main` ainda aponta para o commit em que estávamos quando executamos `git checkout` para alternar entre os branches.

Vamos retornar ao branch `main`:

```zsh
git checkout main
```

{{< image src="/images/git-branch-4.webp" caption="HEAD se move ao fazer o checkout">}}

Esse comando moveu o ponteiro de HEAD de volta para apontar para o branch `main`, e reverteu os arquivos no working directory (diretório de trabalho) de volta ao snapshot para o qual `main` aponta.

Isso significa que as alterações feitas a partir deste ponto vão divergir.

Agora vamos fazer um novo commit em main

```zsh
vim file.txt
git commit -a -m "made a change"
```

Agora o histórico do projeto se divergiu, uma vez que criamos um branch novo (testing), fizemos mudanças nele, e depois voltamos para o branch principal e fizemos outras mudanças.

{{< image src="/images/git-branch-5.webp" caption="Histórico de commits">}}

Ambas as mudanças são isoladas em branches separados, contudo, sempre é possível alternar entre os branches e **mesclá-los** quando estiver pronto.

**PS**: Se você executar `git log --oneline --decorate --graph --all`, ele mostrará o histórico de seus commits, exibindo onde estão seus ponteiros de branch e como o seu histórico divergiu.

### Mesclando Branches (Merge)

Imagine que temos um projeto e que já haja alguns commits no branch `main`.

{{< image src="/images/git-merge.webp" caption="Um simples histórico de commits">}}

Agora vamos criar um novo branch com nome `branch1` e mudar para simultaneamente, executando

```zsh
git checkout -b branch1
```

E nessa branch vamos fazer um novo commit

{{< image src="/images/git-merge-1.webp" caption="Criando um novo branch e fazendo um commit">}}

Além dessa branch, vamos criar outra com o criativo nome `branch2`

```zsh
git checkout -b branch2
```

E nessa branch vamos fazer um commit

{{< image src="/images/git-merge-2.webp" caption="Histórico se divergiu entre as branchs, mas ambas se baseam em main">}}

Agora vamos mesclar a `branch2` a `main`, para fazer isso o processo é simples.

Primeiro, mude para branch principal, ou seja `main`

```zsh
git checkout main
```

E logo em seguida execute o comando `git merge nome-da-branch-para-mesclar`

```zsh
git merge branch2
```

**PS:** Talvez você note a expressão "fast-forward" nesse merge, já que o branch `branch2` que foi mesclado aponta para `C4` que está diretamente à frente do commit `C2` no qual main estava, então o Git simplesmente move o ponteiro para a frente.

Agora, a alteração está no snapshot do commit para o qual o branch main aponta.

{{< image src="/images/git-merge-3.webp" caption="Criando um novo branch e fazendo um commit">}}

Sendo assim, a branch `branch2` não é mais necessária e, portanto, podemos exclui-la executando

```zsh
git branch -d branch2
```

Vamos retornar a branch `branch1` e continuar o trabalho fazendo mais um commit.

{{< image src="/images/git-merge-4.webp" caption="Continuando o trabalho no branch1">}}

É importante esclarecer que as alterações feitas em `branch2` não estão contidas nos arquivos do `branch1`. Caso você precise dessas alterações, você pode fazer o merge do branch `main` no branch `branch1` executando git merge `main`, ou você pode esperar para integrar essas alterações até que você decida mesclar o branch `branch1` de volta para `main` mais tarde.

Primeiro mudamos para o branch `main` fazendo

```zsh
git checkout main
```

Assim como mesclamos a `branch2` e `main`, basta executar o comando `git merge`

```zsh
git merge branch1
```

Esse merge é diferente do merge anterior que fizemos com o branch `branch2`. Como o ancestral direto de `branch2` não é o commit atual em `main`, o Git precisa trabalhar um pouco mais.

Neste caso, o Git faz uma simples mesclagem de três vias *(three-way merge)*, usando os dois snapshots referenciados pela ponta de cada branch e o ancestral em comum dos dois.

{{< image src="/images/git-merge-5.webp" caption="Três snapshots usados em um merge típico" >}}

Ao invés de apenas fazer um "fast-forward" e mover o ponteiro para frente, o Git cria um novo snapshot que resulta do *three-way merge* e automaticamente cria um novo commit que aponta para este novo snapshot.

Esse commit é chamado de commit de merge, e é diferente dos commits habituais, pois tem mais de um commit pai.

{{< image src="/images/git-merge-6.webp" caption="Um commit de merge" >}}

Agora que o merge foi feito podemos deletar o branch `branch1`

```zsh
git branch -d branch1 
```
