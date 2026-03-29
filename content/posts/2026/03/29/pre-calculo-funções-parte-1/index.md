---
title: "Pré-cálculo: Funções parte 1"
date: 2026-03-29T20:17:02-0300
draft: true
description: "Entendendo as definições e propriedades  básicas das funções"
tags: []
categories: ["mathematics"]

featuredImage: ""
lightgallery: true

---

Olá, meu nome é Paulo César, e neste post compilei, de forma rápida e resumida, as principais definições e propriedades das funções, visando posteriormente o estudo de cálculo diferencial e integral.

## Produto cartesiano e Relações

Para o estudo das funções é altamente recomendável conhecer os conceitos básicos da teoria dos conjuntos. Aliás, já escrevi um artigo sobre isso: [Pré-cálculo: Introdução a teoria dos conjuntos](https://paulogamma.netlify.app/posts/2025/11/04/pre-calculo-introducao-a-teoria-dos-conjuntos/).

#### Definição de produto cartesiano

> Seja A e B dois conjuntos ( de preferência não vazios), o **produto cartesiano de A por B** é o conjunto de todos os pares ordenados (x,y), onde x é elemento de A e y elemento de B. Simbolicamente escreve-se \(A x B \)

Assim

> \[A x B = \{ (x,y) | x \in A \land x \in B \}\]

Por exemplo, seja o conjunto C = {1,2} e o conjunto D = {a, b}. O produto cartesiano \(C x D = \{ (1, a), (1,b), (2, a), (2,b) \}\) 

#### Definição de Relação

A partir da definição de produto cartesiano, pode-se definir o conceito de Relação e suas principais propriedades: 

> Seja A e B dois conjuntos, **uma relação R de A em B** é qualquer subconjunto do produto cartesiano de A por B, isto é, \(R \subset AxB\).

> O conjunto \(D_{R}\) contituído por todos os  elementos  \(x, x \in A\) para os quais existe \(y, y \in B \) tal que \((x;y) \in R\) denomina-se **Domínio de R**.

> O conjunto \(I_{R}\) constituído por todos os elementos \(y, y \in B\) para os quais existe \(x, x \in A\) tal que \(x;y) \in R\) denomina-se **Imagem de R**

Por exemplo,seja \(A = ]5, 10[ \) e \(B = \{2, 3\}\) e a Relação R de a em b: \(R = \{(x,y) \in A xB | xy < 15\}\).

Onde:
- \(A = D_{R} = \{x \in A | \exists y \text { tal que } (x,y) \in R \}\)
- \(I_{R} = \{y \in B | \exists x \in A \text { tal que } xy < 15 \}\) 

**PS**: Note que a sentença xy < 15 que define a Imagem.

## Definição de Função

Agora que definimos as relações é possível definir o conceito básico de função. Contudo, vou dividir em duas definições: uma intuitiva e outra formal.

### Definição intuitiva de função

Imagine uma loja, onde há uma forma muito peculiar de vendas, o cliente não compra diretamente o objeto, mas sim uma ficha única.

Essas fichas ficam armazenadas em uma caixa assinalada com a letra "A", seguida de uma pequeno título escrito "Domínio".

Essa caixa, que chamaremos de "caixa A" contém um conjunto de fichas diferentes entre si, cada uma contendo uma informação única. Essas fichas guardadas dentro de A são códigos que, por sua vez, permitem  ao cliente comprar objetos específicos. 

 Esses objetos estão armazenados em outra caixa que ,semelhantemente a Caixa A, está assinalada com a letra "B" e possui um pequno título escrito "Contradomínio". A caixa B, como a chamaremos, possui em seu interior um conjunto de vários objetos diferentes entre si. 

 Mas há algumas regras operacionais muito importantes:
 - **Cada ficha da Caixa A só pode ser código de um, e apenas um**, objeto guardado na Caixa B. Contudo, vale ressaltar que 
 
- **Para todas as fichas guardadas em A deve-se ter armazenado na caixa B um objeto correspondente a ficha**

 - **Duas fichas diferentes na Caixa A podem ser códigos para o mesmo objeto na Caixa B**.

 - **Podem existir objetos na Caixa B dos quais na há ficha correspondente em A.**

 Tudo certo até então, mas como garantir que quando um cliente pegue o objeto da Caixa B correspondente a sua ficha escolhida na Caixa A ? 

 Para isso, a administração da loja instalou uma máquina, onde em sua carcaça está inscrito um grandioso **"F"** , seguido do título **"Função"**. 

 Essa poderosa máquina, é a responsável por determinar qual o objeto da Caixa B o cliente irá levar de acordo com sua ficha da Caixa A. É essencial ressaltar que a "Função" (isto é, a máquina) segue todas as regras definidas anteriormente.

 Além disso, uma das regras nos diz que podem existir objetos em B dos quais não há fichas correspondentes na caixa  A. Imagine que a gerente dessa loja retirou da caixa B todos os objetos que possuiam ficha correspondente na caixa A, e as colocou em uma terceira caixa assinalada pela letra "I" seguida pelo título "Imagem".

 Resumindo, na caixa I estão todos os objetos da caixa B que correspondem a pelo menos uma ficha da caixa A.

 Um outro fator interessante, é que a máquina F pode ser configurada de maneiras diferentes, apontando para objetos diferentes. Além disso, a caixa A pode ser trocada por outras caixas, desde que todas elas possuam uma, e apenas uma, correspondência na caixa B. 

 ### Definição formal de função

 Se você leu a definição intuitiva de função, então vai notar conceitos e propriedades analógas nesta seção. 

 > Seja A e B dois conjuntos (de preferência não vazios), e \(f\) uma relação \(R \in AxB\) tal que para todo \( x \in A \), **existe no máximo um**  \(y \in B \) tal que (\(x,y) \in f\).

 Assim 

 > \[\forall x \in A, \exists !y \in B \text{ tal que } (x,y) \in f \]

 **PS:** O símbolo \(\exists !\) significa: existe um único.

 #### Domínio, Contradomínio e Imagem.
 
 Seja f uma função de A em B.

 > O conjunto \(D_{f}\) é conjunto de todos os valores de x (valores de entrada), e **para todo** \(x \in A \) que \(\exists ! y \in B\) tal que \((x,y) \in f\); então \(x \in D_{f}\) e \(D_{f} = A\), ao conjunto de \(D_{f}\) se dá o nome de **Domínio de f**.

 Assim,

 > \[D_{f} = \{x \in A \mid \exists ! y \in B \text{ tal que } (x,y) \in f \}\]

 Ainda utilizando a função f de A em B como exemplo, temos:

 > O conjunto \(CD_{f}\) é o conjunto de todos os valores de \(y \in B\) que podem estar ou não estar associados a algum \(x \in A\); denomina-se esse conjunto de **Contradomínio de f**.

 Logo,

 >  \[CD_{f} = B \]

E por último,

> O conjunto \(I_{f}\) é o conjunto de todos os valores de \(y \in B\) para os quais existem pelo menos um \(x \in A \), isto é, no domínio de f (\(D_{f}\)), tal que \((x,y) \in f \); denomina-se esse conjunto de **Imagem de f**.

> \[I_{f} = \{y \in B \mid  \exists x \in A \text{ tal que } (x,y)  \in f \}\]

Vale ressaltar que,

> \[ I_{f} \subset CD_{f}\]

### Notação de funções

Sendo f uma função da qual o conjunto A é seu domínio, e o conjunto B seu contradomínio. Pode-se representar essa função pela seguinte notação:

> \[f:A  \to B\]

Além disso, podemos também definir uma expressão que defina a imagem y da função em x . Por exemplo:

 \[f(x) = 2x + b\]

Ou se quisermos explicitar o domínio e contradomínio bem como a expressão, por exemplo,

 \[f: ] -\infty, 120] \to \{1,2\}, 
\quad 
f(x) = \begin{cases}
1 & \text{se} & x \geq 1 \\
2 & \text{se} & x < 1\\
\end{cases}
 \] 

 Ps: Quando uma função for definida sem necessariamente explicitar seu domínio e contradomínio, assumimos que essa função é de \(\mathbb{R}\) em \(\mathbb{R}\); em notação: \(f: \mathbb{R} \to \mathbb{R}\)

Além dessa notação, é comum vermos a seguinte notação:

\[y = \text{expressão em função de x}\]

Por exemplo,

\[y = ax² + bx + c \]

## Gráfico das funções

É muito comum ao estudar funções, representá-las em gráficos, assim torna-se mais fácil visualmente analisar seu comportamento. 
