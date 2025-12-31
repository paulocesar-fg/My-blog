---
title: "Introdução a Version Control System(VCS)"
date: 2025-12-25T19:53:20-0300
draft: false
description: "Descrição do post aqui"
tags: [computation, git]
categories: [computation]
---

Olá caro leitor(a), Meu nome é Paulo César e sou o criador deste blog. 

Neste post, quero falar sobre Sistemas de controle de versionamento(Version Control Systems). Recentemente, tenho estudado a respeito desse assunto, e precisava dar um "Dump".Além disso, vale ressaltar que darei um foco especial ao Git, pois pretendo no futuro abordar assuntos relacionados.
 
Dito isso, vamos ao conteúdo.


## Introdução

Inicialmente, quero contextualizar o assunto trazendo um exemplo que, creio eu, quase todo desenvolvedor iniciante já passou. 

Você tem uma ideia de projeto novo e começa a codar, adicionando funcionalidade atrás de funcionalidade. Até que, por muito azar, você altera algumas linhas de código, ou exclui um arquivo, e quando você percebe seu projeto simplesmente quebra. Depois disso, você pensa "Puts! Se eu pudesse retornar à versão anterior...". 

A partir desse dia, você pensa no seguinte "Ok. Assim que eu salvar o arquivo, vou copiar o projeto para outro diretório,e, caso o projeto quebre, ainda terei a versão anterior". 

Essa solução seria uma espécie de *Local Version Control System*( Conceito que será posteriormente explicado ). No início pode até funcionar, porém, se o projeto crescer, você terá um grande amontoado de arquivos duplicados, possivelmente mal organizados e ocupando muito espaço em disco. 

Se mesmo nos dias atuais, tendo a disponibilidade de terasbytes de armazenamento, essa solução é inviável. Agora, imagine há 45 anos atrás, no início do anos 80, quando os computadores como, por exemplo, o TK-90 dispunham de apenas 16kb, ou, no melhor dos casos, de 48kb de armazenamento.

Além disso, desenvolvemos softwares em equipes, pense no quão desastroso seria fazer isso em um sistema desses. 

Esses são apenas algumas das consequências que um mal gerenciamento de versões pode trazer. Então,  creio que tenha ficado claro que o controle de versionamento é algo fundamental no desenvolvimento de software. Entretando, fazer isso pode não ser uma tarefa fácil. Dessa forma, surgiram os *Version Control Systems*, ou em português, *Sistemas de Controle de versionamento.* 

Assim como o próprio nome sugere, os Version Control Systems( VCSs ) são ferramentas desenvolvidas para ajudar no gerenciamento das alterações do projeto ao longo do tempo. 

## Uma Breve história dos VCSs

Eu sempre gosto de iniciar meus estudos com a história das coisas. Saber como tudo começou e  evoluiu, até finalmente chegar nos nossos dias atuais. E talvez, daqui alguns anos, as ferramentas usadas hoje sejam apenas mais um fragmento da história dos VCS. 

Nesse tópico, você verá alguns conceitos como Forward Deltas, Reverse Deltas, Snapshot, entre outros. A explicação de todos esses conceitos está no último tópico.

Começamos nossa história no período em que os computadores eram programados por meio de cartões perfurados. O " controle de versão" era, em essência, um controle de configuração físico. Cada versão seria uma pilha física com diferentes cartões(deck). Os repositórios daquela epóca muito provalvelmente eram grandes armários, onde cada versão seria armazenada em uma gaveta. 

Se hoje, um merge mal feito pode gerar uma enorme dor de cabeça, imagine pensar em fazer algo similar nessa epóca. Não seria uma dor de cabeça, mas sim uma verdadeira catástrofe operacional.

Depois de um tempo, a programação por cartões perfurados foi sendo substituída por texto. Diante disso, em 1972, surgiu o ***Source Code Control System***(SCCS),desenvolvido nos **Bell Labs** por **Marc Rochkind**.

O SCCS não guardava cópias completas de cada versão, ao invés disso ele guardava apenas as diferenças(deltas) entre versões, e depois usava Foward Deltas( deltas progressiovos ) para montar o checkout. Isso realmente era algo revolucionário para a época, uma vez que resolvia o problema do falta de espaço em disco.

Mais tarde, nos anos 80, surgiu o **Revision Control System(RCS)**, desenvolvido por **Walter F. Tichy** como o sucessor do SCCS. Diferentemente de seu antecessor, o RCS utilizava **Reverse Delta** ao invés de Forward Deltas( utilizados pelo SCCS). Essa implentação tornava o checkout da cópia recente mais simples e rápido, como também simplificava o processo de fazer commits.

O RCS organizava as revisões na chamada *ancestral tree*( árvore ancestral ), onde a primeira revisão era a raiz da árvore.

Ele também contava com os sistemas de *branching* e de *merge*. No entanto, como ele usava *forward deltas* ,às vezes  alcançar a "ponta" dos branches poderia ser penoso. 

A principal falha desses VCSs citados, era que eles operavam apenas em arquivos únicos, sendo incapazes de lidar com projetos compostos por múltiplos arquivos.

Depois de um tempo, Dick Grune desenvolveu o **Concurrent Versions System(CVS)**, como shell scripts do Unix baseados no RCS. Grune desenvolveu o sistema para trabalhar colaborativamente com seus alunos no desenvolvimento de um compilador C chamado ACK. 

Uma das vantagens do CVS era o fato de permitir que os usuários tratassem um conjunto completo de dados como se fossem um único arquivo, tornando os comandos do sistema mais simples para projetos com multíplos arquivos. 

Além disso, o CVS introduziu o uso remoto, fornecendo um modelo client/server que permitia a formação de equipes compostas por desenvolvedores em locais remotos. Por isso, classica-se o CVS de  **Centralized Version Control System(CVCS)**, uma vez que o histórico de versões do projeto era armazenado em um **servidor central**, enquanto os usuários trabalhavam localmente em cópias locais. 

Todavia, isso tornou certas operações dependentes da disponibilidade da rede. Signinifica então que, caso o servidor ficasse inativo por certo tempo, até que o problema fosse revolvido, nenhum desenvolvedor seria capaz de trabalhar no versionamento do projeto.

O CVS marcou a década de 90, e com o passar do tempo foram surgindo outros VCSs baseados no CVS, como o CVSNT, EVS, Open CVS e Subversion. Esse último , em especial, ganhou força e tornou-se popular no início dos anos 2000. O SVN( Subversion ) foi desenvolvido pela CollabNet com o fabuloso slogan "CVS melhorado". E realmente ele era menos pior, facilitou alguns processos e lidou com muitos dos problemas de seu precessor.

Fugindo dos modelos CVCSs(Centered Version Control Systems), começaram a surgir VCS de modelo distribuídos, chamados de **Distribued Version Control Systems***(DVCS). Diversos softwares surgiram como o Darcs, BitKeeper, Mercurial, Bazaar, Monotone e ,sobretudo, o Git(nosso principal assunto). 

Os DVCSs resolviam muitos dos problemas que assolavam os CVCSs. Nos DVCSs  o repositório inteiro no computador local do usuário, tornando-os mais adequados oara grandes projetos com mais desenvoldores independentes, sendo essencial para a comunidade Open-Souce. Isso também tornava os DVCSs menos dependentes de rede. Enquanto nos CVCSs as alterções eram rastreadas em versão somente quando são enviadas( committed ) ao servidor, nos DVCSs eles podem ser rastreadas localmente, permitindo o versionamento de "rascunhos" sem precisar serem publicados para outros.

## Uma breve história do Git

No tópico anterior, descrevi um panorama geral da história dos Sistemas de Controle de Versão. Neste tópico, descreverei de forma resumida os fatos que culminaram na criação do Git.

Antes de entrarmos na história do Git, devemos primeiro entender como funcionava o versionamento do desenvolvimento do Kernel do Linux. 

Durantes os primeiros anos da manutenção do Kernel Linux(1991-2002), as alterações no software eram compartilhadas por meio de *patches* e *tarballs*. Esses dois conceitos são muito importantes para a computação, por isso farei uma breve tangente.
 
Como já foi falado anteriormente, duplicar o arquivo antes de alterá-lo é super ineficiente, não só porque vai desperdiçar seu espaço em disco, mas também porque vai sujar o seu diretório com arquivos desnecessários. Por isso, surgiu até hoje duas ferramentas de Unix, que existem até hoje nos Linux. 

A primeira ferramenta é o Diff, e serve para retirar a diferença entre dois arquivos. O algoritmo por trás disso é muito interessante e vale um estudo a parte. 

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
1d0
< Limão
4d2
< Melancia
6d3
< Ameixa
```


