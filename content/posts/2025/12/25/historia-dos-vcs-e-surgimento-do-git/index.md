---
title: "História dos VCSs e o surgimento do Git"
date: 2025-12-25T19:53:20-0300
draft: false
description: "Descrição do post aqui"
tags: [vcs, git]
categories: [computation]

lightgallery: true

featuredImage: "/images/historia-dos-vcs-e-o-surgimento-do-git-cover.webp"

---

Olá, caro leitor(a). Meu nome é Paulo César e sou o criador deste blog. 

Neste post, quero falar sobre Sistemas de controle de versionamento (Version Control Systems). Recentemente, tenho estudado a respeito desse assunto e precisava organizá-lo na minha mente. Além disso, darei um foco especial ao Git, pois pretendo futuramente abordar assuntos relacionados.
 
Dito isso, vamos ao conteúdo.


## Introdução

Inicialmente, quero contextualizar o assunto trazendo um exemplo que, creio eu, quase todo desenvolvedor iniciante já passou. 

Você tem uma ideia de novo projeto e começa a codar, adicionando funcionalidade atrás de funcionalidade. Até que, por azar, você altera algumas linhas de código ou exclui um arquivo e, quando percebe, seu projeto simplesmente quebra. Depois disso, você pensa "Se eu pudesse retornar à versão anterior...". 

A partir desse dia, você pensa no seguinte: "Assim que eu salvar o arquivo, vou copiar o projeto para outro diretório. Caso o projeto quebre, ainda terei a versão anterior". 

Essa solução seria uma espécie de *Local Version Control System* (explicado posteriormente). No início pode funcionar, porém, se o projeto crescer, você terá um grande amontoado de arquivos duplicados, possivelmente mal organizados e ocupando muito espaço em disco. 

Se mesmo nos dias atuais, com terabytes de armazenamento disponível, essa solução é inviável, imagine há 45 anos, no início dos anos 80, quando computadores como o TK-90 dispunham de apenas 16 KB ou, no melhor dos casos, de 48 KB de armazenamento.

Além disso, desenvolvemos softwares em equipes. Pense no quão desastroso seria fazer isso em um sistema desses. 

Esses são apenas algumas das consequências que um mal gerenciamento de versões pode trazer. Creio que tenha ficado claro que o controle de versionamento é algo fundamental no desenvolvimento de software. Entretanto, fazer isso pode não ser uma tarefa fácil. Dessa forma, surgiram os *Version Control Systems* ou, em português, *Sistemas de Controle de versionamento*. 

Assim como o próprio nome sugere, os Version Control Systems (VCSs) são ferramentas desenvolvidas para ajudar no gerenciamento das alterações do projeto ao longo do tempo. 

## Uma breve história dos VCSs

Eu sempre gosto de iniciar meus estudos com a história das coisas. Saber como tudo começou e evoluiu até chegar aos nossos dias atuais. E talvez, daqui alguns anos, as ferramentas usadas hoje sejam apenas mais um fragmento da história dos VCS. 

Começamos nossa história no período em que os computadores eram programados por meio de cartões perfurados. O "controle de versão" era, em essência, um controle de configuração físico. Cada versão era uma pilha física com diferentes cartões (deck). Os repositórios daquela época muito provavelmente eram grandes armários, onde cada versão era armazenada em uma gaveta. 

{{< image caption="Margaret Hamilton" src="/images/margaret-hamilton-codigo-em-cartoes-perfurados.webp" >}}

Se hoje um merge mal feito pode gerar uma enorme dor de cabeça, imagine fazer algo similar nessa época. Não seria uma dor de cabeça, mas sim uma verdadeira catástrofe operacional.

Depois de um tempo, a programação por cartões perfurados foi sendo substituída por texto. Diante disso, em 1972, surgiu o **Source Code Control System** (SCCS), desenvolvido nos **Bell Labs** por **Marc Rochkind**.

O SCCS não guardava cópias completas de cada versão. Ao invés disso, guardava apenas as diferenças (deltas) entre versões e usava Forward Deltas (deltas progressivos) para montar o checkout. Isso realmente era algo revolucionário para a época, pois resolvia o problema da falta de espaço em disco.

Mais tarde, nos anos 80, surgiu o **Revision Control System** (RCS), desenvolvido por **Walter F. Tichy** como sucessor do SCCS. Diferentemente de seu antecessor, o RCS utilizava **Reverse Delta** em vez de Forward Deltas (utilizados pelo SCCS). Essa implementação tornava o checkout da cópia recente mais simples e rápido, facilitando também o processo de fazer commits.

O RCS organizava as revisões na chamada *ancestral tree* (árvore ancestral), onde a primeira revisão era a raiz da árvore.

Ele também contava com os sistemas de *branching* e *merge*. No entanto, como usava *forward deltas*, às vezes alcançar a "ponta" dos branches poderia ser penoso. 

A principal falha desses VCSs era que operavam apenas em arquivos únicos, sendo incapazes de lidar com projetos compostos por múltiplos arquivos.

Depois de um tempo, Dick Grune desenvolveu o **Concurrent Versions System** (CVS) usando shell scripts do Unix baseados no RCS para trabalhar colaborativamente com seus alunos no desenvolvimento de um compilador C chamado ACK. 

Uma vantagem do CVS era permitir que os usuários tratassem um conjunto completo de dados como um único arquivo, tornando os comandos mais simples para projetos com múltiplos arquivos. 

Além disso, o CVS introduziu o acesso remoto, fornecendo um modelo client/server que permitia a formação de equipes compostas por desenvolvedores em locais remotos. Por isso, classifica-se o CVS como **Centralized Version Control System** (CVCS), uma vez que o histórico de versões do projeto era armazenado em um **servidor central**, enquanto os usuários trabalhavam localmente em cópias locais. 

{{< image src="/images/CVCS.webp" caption="CVCS">}}

Todavia, isso tornou certas operações dependentes da disponibilidade da rede. Significa que, caso o servidor ficasse inativo, nenhum desenvolvedor seria capaz de trabalhar no versionamento do projeto até que o problema fosse resolvido.

O CVS marcou a década de 90, e com o passar do tempo surgiram outros VCSs baseados no CVS, como CVSNT, EVS, Open CVS e Subversion. Este último, em especial, ganhou força e se tornou popular no início dos anos 2000. O SVN (Subversion) foi desenvolvido pela CollabNet com o slogan "CVS melhorado" e realmente resolvia muitos dos problemas de seu predecessor.

Fugindo dos modelos CVCSs (Centralized Version Control Systems), começaram a surgir VCSs de modelo distribuído, chamados de **Distributed Version Control Systems** (DVCS). Diversos softwares surgiram como Darcs, BitKeeper, Mercurial, Bazaar, Monotone e, sobretudo, o Git (nosso principal assunto). 

Os DVCSs resolviam muitos dos problemas que assolavam os CVCSs. Nos DVCSs, o repositório inteiro estava no computador local do usuário, tornando-os mais adequados para grandes projetos com múltiplos desenvolvedores independentes e essenciais para a comunidade open source. Isso also tornava os DVCSs menos dependentes de rede. Enquanto nos CVCSs as alterações eram rastreadas apenas quando enviadas (committed) ao servidor, nos DVCSs elas podiam ser rastreadas localmente, permitindo o versionamento de "rascunhos" sem precisar publicá-los para outros.

{{< image src="/images/DVCS.webp"caption="DVCSs" >}}

## Uma breve história do Git

No tópico anterior, descrevi um panorama geral da história dos Sistemas de Controle de Versão. Neste tópico, descreverei os fatos que culminaram na criação do Git.

Antes de entrarmos na história do Git, devemos entender como funcionava o versionamento do desenvolvimento do Kernel do Linux. 

Durante os primeiros anos da manutenção do Kernel Linux (1991-2002), as alterações no software eram compartilhadas por meio de *patches* e *tarballs*. Esses dois conceitos são muito importantes para a computação, por isso farei uma breve tangente.
 
Como já foi falado, duplicar o arquivo antes de alterá-lo é ineficiente, não só por desperdiçar espaço em disco, mas também por desorganizar o diretório com arquivos desnecessários. Por isso, surgiram duas ferramentas de Unix que existem até hoje no Linux. 

A primeira ferramenta é o Diff e serve para retirar a diferença entre dois arquivos. O algoritmo por trás disso é muito interessante e vale um estudo à parte. 

Para ilustrar melhor, irei fazer uma pequena demonstração. Primeiramente, vou criar dois arquivos diferentes. 

```file1.txt
Limão
Batata
Banana
Melancia
Laranja
Ameixa
```

```file2.txt 
Goaiaba
Batata
Banana
Laranja
Morango
``` 

Usamos o comando diff e redirecionamos o output para o arquivo `patch.txt`.

```bash
 diff file1.md file2.md > patch.txt 
 ``` 

Lendo o patch com `cat patch.txt`, o output será esse:

```patch.txt
1c1
< Limão
---
> Goaiaba
4d3
< Melancia
6c5
< Ameixa
---
> Morango

```

O arquivo `patch.txt` guarda as alterações em relação ao conteúdo dos arquivos `file1.txt` e `file2.txt`. Para aplicar essas alterações, basta utilizar o comando `patch` seguido do arquivo que queremos alterar e do arquivo que guarda as alterações (o patch). 

```bash
patch file1.txt patch.txt
```

Agora, se você fizer um `cat` no arquivo `file1.txt`, perceberá que ele está idêntico ao arquivo `file2.txt`. 

E durante muito tempo (especialmente entre 1991 e 2002), o desenvolvimento do Kernel Linux acontecia de forma que hoje parece rudimentar. Os patches eram compactados e enviados por e-mail, e Linus Torvalds os aplicava manualmente.

Devido aos problemas dessa abordagem, em 2002, o projeto do Kernel Linux passou a usar o BitKeeper, um DVCS proprietário e fechado. 

Uma decisão controversa, pois o Linux se destacava por ser código aberto e usar uma ferramenta fechada parecia contraditório.

Mesmo assim, BitKeeper durante certo tempo entregava o que o Linux precisava: fluxo de trabalho distribuído e performance razoável para a escala do projeto.

Entretanto, houve discordâncias entre o BitKeeper e a comunidade Linux, o que levou o projeto a abandonar o BitKeeper.

Mas aqui entra o maior problema: naquela época, as opções livres existentes não satisfaziam as necessidades do projeto do kernel Linux.

Isso fez com que a comunidade que desenvolvia o Linux (e especialmente Linus Torvalds, o criador do Linux) desenvolvesse sua própria ferramenta de controle de versionamento. Algumas das metas eram:

- Boa performance
- Projeto simples
- Forte suporte para desenvolvimento não-linear (milhares de ramos paralelos)
- Completamente distribuído
- Ser escalável

E assim, em 2005, nasceu o Git que, com o tempo, evoluiu para ser fácil de usar e ainda reter as qualidades acima, tornando-se, nos dias atuais, parte essencial da maioria dos projetos de software no mundo.

Abaixo está uma Tech Talk no Google onde Linus Torvalds fala sobre o Git.

{{< youtube 4XpnKHJAok8 >}}

## Conclusão

A tecnologia é algo que está sempre em constante mudança, e a história dos Version Control Systems (VCSs) é um exemplo que apoia isso. De necessidades reais, surgiram ferramentas inovadoras para suas épocas que, sobretudo, visavam resolver os problemas enfrentados naquele momento. 

Dessa vez, o foco final ficou no Git, pois atualmente é o VCS mais utilizado.
