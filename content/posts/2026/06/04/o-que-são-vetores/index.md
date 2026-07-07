---
title: "O que são vetores?"
date: 2026-06-04T14:50:15-0300
draft: false
description: "O conceito de vetor é fundamental para o estudo da computação. Entender o conceito intuitivamente e, sobretudo, formalmente, é essencial para o estudante de ciência da computação."
tags: [geometria-analitica]
categories: [mathematics]

featuredImage: "./images/vetores-cover.png"
lightgallery: true

---

Olá, prazer! Meu nome é Paulo César, estudante de computação e entusiasta de tecnologia. Neste texto, quero fazer um breve resumo sobre vetores, um dos conceitos matemáticos mais fundamentais para o estudo da computação.

## Desenvolvimento da ideia de vetor

Os vetores, da forma como os conhecemos hoje, são relativamente recentes na história da matemática.

Embora os gregos antigos, em especial Euclides, já estudassem propriedades geométricas e objetos matemáticos que hoje são associados aos vetores, eles não dispunham do conceito moderno de vetor, tampouco de ferramentas como a álgebra para manipulá-los.

Após o decorrer de séculos, René Descartes e Pierre de Fermat desenvolveram a geometria analítica. A grande inovação foi que agora era possível representar pontos por coordenadas numéricas.

Isso também permitia representar deslocamentos por pares e triplas ordenadas, ideia que será muito importante para nós.

Algo, de certo modo, simples, porém que trouxe grandes avanços à matemática.

Além dos matemáticos, os físicos também enfrentavam problemas relacionados, como, por exemplo, na mecânica clássica, onde era necessário representar grandezas vetoriais, como a velocidade, a aceleração e a força.

Em 1843, William Rowan Hamilton, enquanto buscava uma forma algébrica de representar rotações no espaço tridimensional, criou os quatérnios.

Embora os quatérnios sejam mais complexos do que os vetores atuais, deles surgiu a ideia de trabalhar com objetos direcionais usando álgebra.

Mas, no fim do século XIX, Josiah Willard Gibbs e Oliver Heaviside simplificaram os quatérnios de Hamilton e criaram a notação vetorial usada hoje, o que logo se mostrou muito útil à física e à engenharia.

## Segmentos orientados

Seja r uma reta; podemos tomar dois pontos A e B nessa reta, formando o segmento de reta \(\overline{AB}\).

{{< image src="./images/segmento-de-reta.webp" caption="Fig 1. Segmento de reta">}}

Ao adotar um segmento unitário \(\overline{OU}\), pode-se medir o comprimento do segmento \(\overline{AB}\) por \(\text{med.}\,\overline{AB}\).

{{< image src="./images/segmento-de-reta-comprimento.webp" caption="Fig 2. Medindo o comprimento do segmento de reta">}}

Lê-se: módulo do segmento \(\overline{AB}\), ou medida do segmento \(\overline{AB}\).

Podemos tomar um segmento de reta e adotar uma orientação, isto é, fixar um sentido e, assim, obter um segmento orientado.

Representaremos os segmentos orientados por um par ordenado \((A, B)\), sendo A a origem e B a extremidade do segmento orientado.

{{< image src="./images/segmento-de-reta-orientado.webp" caption="Fig 3. Segmentos de reta orientados">}}

Perceba que, na imagem acima, há dois segmentos que, apesar de possuírem os mesmos pontos A e B, possuem sentidos distintos.

Agora, já sabendo o que são segmentos de reta orientados, pode-se definir:

> **Definição 1.** Sejam os segmentos orientados \((A, B)\) e \((B, A)\), com \(A \neq B\). Então \((A, B) \neq (B, A)\).

> **Definição 2.** Sejam os segmentos orientados \((A, B)\) e \((C, D)\). Dizemos que seus comprimentos (módulos) são iguais se os comprimentos de seus segmentos geométricos \(AB\) e \(CD\) forem iguais. \[\text{compr.}(A, B) = \text{compr.}(C, D) \iff \text{med.}\,\overline{AB} = \text{med.}\,\overline{CD}\]

> **Definição 3.** Suponha o segmento \((A, A)\); ele é nulo, pois \(\text{compr.}(A, A) = 0\).

> **Definição 4.** Suponha que \((A, B)\) e \((C, D)\) possuam a mesma direção. Então \[\begin{cases}
\text{se } \overline{AC} \cap \overline{BD} = \varnothing, \text{ temos o mesmo sentido;} \\
\text{se } \overline{AC} \cap \overline{BD} \neq \varnothing, \text{ temos sentidos contrários.}
\end{cases}\] {{< image src="./images/igualdade-de-sentido.webp" caption="Fig 4. Sentidos dos segmentos de reta orientados">}}

## Equipolência

Equipolência é uma propriedade que se dá quando dois ou mais segmentos orientados são:
- ambos nulos;
- ou possuem mesmo sentido, direção e comprimento.

Indica-se a equipolência pelo sinal \(\sim\) (til). Assim, \((A, B) \sim (C, D)\) lê-se: o segmento orientado \((A, B)\) é equipolente ao segmento orientado \((C, D)\).

##### Propriedades de equipolência

- [Reflexiva] \((A, B) \sim (A, B)\)
- [Simétrica] Se \((A, B) \sim (C, D)\), então \((C, D) \sim (A, B)\)
- [Transitiva] Se \((A, B) \sim (C, D)\) e \((C, D) \sim (E, F)\), então \((A, B) \sim (E, F)\)

### Classe de equipolência

Uma classe de equipolência de um segmento \(AB\) é o conjunto de todos os segmentos equipolentes a \(AB\) (e, portanto, equipolentes entre si pela propriedade transitiva).

## Definição de vetor

Um vetor é uma classe de equipolência de segmentos de reta orientados equipolentes.

Se \((A, B)\) é um segmento orientado, o vetor correspondente será indicado por \(\overrightarrow{AB}\). É importante salientar que o segmento orientado \((A, B)\) não é o vetor \(\overrightarrow{AB}\), mas apenas um de seus representantes.

#### Vetor nulo

O vetor nulo é aquele cujo representante é um segmento nulo e será indicado por \(\overrightarrow{0}\).

**Obs.:** \(\overrightarrow{0}\) é paralelo a qualquer vetor.

#### Propriedades dos vetores

Os vetores possuem três propriedades principais: direção, sentido e módulo.

##### Direção

{{< image src="./images/direcao-dos-vetores.webp" caption="Fig 5. Vetores com diferentes direções">}}

##### Sentido

O sentido, a grosso modo, é o lado da direção para o qual os vetores apontam. Por exemplo, considere os vetores \(\overrightarrow{u} = (3, 0)\) e \(\overrightarrow{v} = (-3, 0)\). Apesar de possuírem o mesmo módulo e direção, eles possuem sentidos diferentes.

##### Módulo

O módulo de um vetor pode representar inúmeras coisas, dependendo de seu contexto. Intuitivamente, pode-se dizer que o módulo é o tamanho do vetor.

Para um vetor em \(n\) dimensões,
\[\overrightarrow{v} = (x_1, x_2, x_3, \dots, x_n)\]

O módulo é dado por:

\[\|\overrightarrow{v}\| = \sqrt{\sum_{i=1}^{n} x_i^2}\]

## Soma de vetores

Sejam os vetores \(\overrightarrow{v}\) e \(\overrightarrow{u}\):

Geometricamente, a partir desses dois vetores podemos formar um paralelogramo.

A soma dos vetores \(\overrightarrow{v}\) e \(\overrightarrow{u}\) é igual à diagonal do paralelogramo.

{{< image src="./images/regra-do-paralelogramo.webp" caption="Regra do paralelogramo">}}

A regra citada é chamada de regra do paralelogramo.

Agora, sejam os vetores \(\overrightarrow{a} = (a_1, a_2, a_3, \dots, a_n)\) e \(\overrightarrow{b} = (b_1, b_2, b_3, \dots, b_n)\). A soma desses vetores é igual à soma das coordenadas correspondentes de \(\overrightarrow{a}\) e \(\overrightarrow{b}\):

\[\overrightarrow{a} + \overrightarrow{b} = (a_1 + b_1,\, a_2 + b_2,\, a_3 + b_3,\, \dots,\, a_n + b_n)\]

## Vetor oposto

Seja \(\overrightarrow{v}\) um vetor; o vetor oposto de \(\overrightarrow{v}\) é o vetor de mesmo módulo e direção, porém com sentido contrário ao de \(\overrightarrow{v}\).

Indica-se o vetor oposto de \(\overrightarrow{v}\) por \(-\overrightarrow{v}\).

Vale ressaltar que \(\overrightarrow{v} + (-\overrightarrow{v}) = \overrightarrow{0}\).

## Subtração de vetores

Para subtrair dois vetores, basta somar o primeiro vetor com o vetor oposto do segundo:

\[\overrightarrow{v} - \overrightarrow{u} = \overrightarrow{v} + (-\overrightarrow{u})\]

## Produto escalar

Sejam os vetores \(\overrightarrow{v}\) e \(\overrightarrow{u}\). O produto escalar (ou produto interno) desses vetores é igual a:

\[\overrightarrow{v} \cdot \overrightarrow{u} = v_1u_1 + v_2u_2 + v_3u_3 + \dots + v_nu_n\]

Ou ainda:

\[\overrightarrow{v} \cdot \overrightarrow{u} = \sum_{i=1}^{n} v_i u_i\]

## A desigualdade de Cauchy-Schwarz

A desigualdade de Cauchy-Schwarz relaciona o produto escalar de dois vetores com seus comprimentos.

> Sejam \(\overrightarrow{v}\) e \(\overrightarrow{u}\) dois vetores em um espaço com produto interno. Então:
\[|\overrightarrow{v} \cdot \overrightarrow{u}| \leq \|\overrightarrow{v}\|\,\|\overrightarrow{u}\|\]

**Demonstração**

Sejam \(\overrightarrow{u}\) e \(\overrightarrow{v}\) vetores não nulos e seja \(\theta\) o ângulo entre eles.

Pela lei dos cossenos, aplicada ao triângulo formado pelos vetores \(\overrightarrow{v}\), \(\overrightarrow{u}\) e \(\overrightarrow{v} - \overrightarrow{u}\), temos
\[\|\overrightarrow{v} - \overrightarrow{u}\|^2 = \|\overrightarrow{v}\|^2 + \|\overrightarrow{u}\|^2 - 2\|\overrightarrow{v}\|\|\overrightarrow{u}\|\cos\theta.\]

Por outro lado, pelo produto interno,
\[\|\overrightarrow{v} - \overrightarrow{u}\|^2 = \|\overrightarrow{v}\|^2 + \|\overrightarrow{u}\|^2 - 2(\overrightarrow{v} \cdot \overrightarrow{u}).\]

Assim, pelas duas expressões, temos
\[
\begin{aligned}
\|\overrightarrow{v}\|^2 + \|\overrightarrow{u}\|^2 - 2(\overrightarrow{v} \cdot \overrightarrow{u})
&= \|\overrightarrow{v}\|^2 + \|\overrightarrow{u}\|^2 - 2\|\overrightarrow{v}\|\|\overrightarrow{u}\|\cos\theta, \\
\overrightarrow{v} \cdot \overrightarrow{u}
&= \|\overrightarrow{v}\|\|\overrightarrow{u}\|\cos\theta.
\end{aligned}
\]

Sabemos que
\[-1 \leq \cos\theta \leq 1.\]

Portanto,
\[|\overrightarrow{v} \cdot \overrightarrow{u}| \leq \|\overrightarrow{v}\|\|\overrightarrow{u}\|.\]
