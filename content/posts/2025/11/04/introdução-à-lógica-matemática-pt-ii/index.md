---
title: "Introdução à lógica matemática Parte.II"
date: 2025-11-04T14:19:30-0300
draft: false
description: "Descrição do post aqui"
tags: [math]
categories: []
---

Nesse post, tratarei os conteúdos introdutórios da *teoria dos conjuntos*. Vale lembrar que este texto é uma continuação do post [Introdução à lógica matemática parte I](/posts/2025/11/03/introdução-a-lógica-matemática-01).

Para aqueles que querem uma abordagem mais rigorosa e completa, recomendo a leitura do capítulo II do livro *How to Prove It: A Structured Approach*, de Daniel J. Velleman.

---

## Definição de conjunto

Para definir rigorosamente o conceito de conjunto, seria necessária uma abordagem axiomática que foge do nível introdutório deste post. Portanto, para fins de introdução, usaremos a seguinte ideia intuitiva:

> Conjuntos são coleções de objetos. Os objetos que formam um conjunto são os seus elementos.

Usualmente, representa-se os conjuntos por letras maiúsculas e os elementos por letras minúsculas. Sendo assim, para indicar que o objeto **a** é um elemento do conjunto **A**, escreve-se:

> \[a \in A\]

Lê-se: "a ***pertence*** a A".

Caso o objeto **a** não seja elemento de **A**, escreve-se:

> \[a \notin A\]

Lê-se: "a ***não pertence*** a A".

### Como representar conjuntos

Uma das maneiras de representar um conjunto é escrever seus elementos entre chaves. Assim, um conjunto formado pelos números 9, 4, 5, 6 e 2 pode ser representado por:

> \[A = \{9, 4, 5, 6, 2\}\]

Outro modo de representar conjuntos é definindo um predicado (isto é, uma sentença aberta) que seus elementos devem satisfazer. Por exemplo, o conjunto dos números maiores que 10 pode ser representado por:

> \[C = \{ x \mid x > 10 \}\]

Lê-se: "C é o conjunto dos **x** tais que **x** é maior que 10".

---

## Igualdade de conjuntos

Sejam \(A\) e \(B\) conjuntos. A é igual a B ***se, e somente se, todo elemento de A pertence a B, e todo elemento de B pertence a A***. Representa-se a igualdade de A e B por:

> \[A = B\]

Em notação matemática:

> \[A = B \iff \forall x (x \in A \iff x \in B)\]

A igualdade entre conjuntos ***não depende da ordem dos elementos nem da repetição de elementos***. Assim, por exemplo, sejam os conjuntos \(A = \{2,2,3,4,5\}\) e \(B = \{5,4,3,2\}\):  

\[
A = B \quad \text{verdadeiro}
\]

---

## O conjunto vazio

Alguns conjuntos são vazios — isto é, não possuem elementos. Esses conjuntos são denominados conjuntos vazios. Pode-se representar um conjunto vazio pelo símbolo:

> \(\emptyset\)

Por exemplo, seja A um conjunto definido por:

> \[A = \{ x \in \mathbb{R} \mid x^2 < 0 \}\]

Sabe-se que qualquer número real ao quadrado é maior ou igual a 0 e, portanto:

\[
A = \emptyset
\]

---

## Diagramas de Venn

Um diagrama de Venn é uma representação visual que usa círculos sobrepostos para mostrar as semelhanças e diferenças entre dois ou mais conjuntos de elementos.

Os conjuntos são representados por regiões planas interiores a uma curva fechada não entrelaçada.

![Diagrama de Venn](/images/2025/11/04/introducao-a-logica-matematica-pt-ii/diagrama-de-venn.png)

---

## Diferença entre conjuntos

Sejam \(A\) e \(B\) conjuntos. A diferença entre A e B é todo elemento que pertence a A e que não pertence a B. Representa-se a diferença de A e B por:

> \[A - B\]

Definição em notação matemática:

> \[
A - B = \{ x \mid x \in A \land x \notin B \}
\]

Por exemplo, seja \(A = \{2,3,4,5,6\}\) e \(B = \{1,2,3\}\), então:  

\[
A - B = \{4,5,6\}
\]

---

## Intersecção de conjuntos

Sejam \(A\) e \(B\) conjuntos. A intersecção de A e B é o conjunto de todos os elementos que pertencem a A e que também pertencem a B. Representa-se a intersecção de A e B por:

> \[A \cap B\]

Definição em notação matemática:

> \[
A \cap B = \{ x \mid x \in A \land x \in B \}
\]

Por exemplo, seja \(C = \{2,3,4,5,6\}\) e \(D = \{6,5,5,2,3,1\}\), então:

\[
C \cap D = \{2,3,6\}
\]

---

## União de conjuntos

Sejam \(A\) e \(B\) conjuntos. A união de A e B é o conjunto dos elementos que pertencem a A **ou** que pertencem a B. Representa-se a união de A e B por:

> \[A \cup B\]

Definição em notação matemática:

> \[
A \cup B = \{ x \mid x \in A \lor x \in B \}
\]

Por exemplo, seja \(F = \{2,3,4,5\}\) e \(G = \{2,3,5,6,7,7\}\), então:

\[
F \cup G = \{2,3,4,5,6,7\}
\]

---

## Subconjuntos

Sejam \(A\) e \(B\). Dizemos que \(A\) é **subconjunto** de \(B\) se, e somente se, todos os elementos que pertencem a \(A\) também pertencem a \(B\).

> \[
A \subseteq B
\]

Para representar essa relação, temos dois símbolos diferentes:

1. \(\subseteq\) → "é subconjunto de" (isto é, \(A\) pode ser igual a \(B\))  
2. \(\subset\) → "subconjunto próprio" (isto é, \(A\) não é igual a \(B\))

Em notação matemática:

> \[
A \subset B \iff x \in A \to x \in B
\]

### O conjunto vazio está contido em todos os conjuntos

Pode parecer uma afirmação estranha, porém ela tem sentido lógico. Seja \(A\) um conjunto qualquer e \(\emptyset\) o conjunto vazio. Pode-se assumir que:

> \[
\emptyset \subset A
\]

Então:

> \[
\emptyset \subset A \iff x \in \emptyset \to x \in A
\]

Sabe-se que \(x \in \emptyset\) é falso e, portanto, a condicional é verdadeira (quando o antecedente é falso, a condicional é sempre verdadeira, como tratado [nesse post](/posts/2025/11/03/introdução-a-lógica-matemática-01)).

Portanto:

> O conjunto vazio \(\emptyset\) é subconjunto de todo e qualquer conjunto.

---

## Complementar

Seja \(A\) um conjunto e \(U\) o universo considerado. O **complemento** de \(A\) é o conjunto de todos os elementos do universo que **não pertencem a \(A\)**. Representa-se por:

> \[
A^c \quad \text{ou} \quad \overline{A}
\]

Definição em notação matemática:

> \[
A^c = \{ x \in U \mid x \notin A \}
\]

Exemplo: se \(U = \{1,2,3,4,5\}\) e \(A = \{2,3\}\), então:

\[
A^c = \{1,4,5\}
\]

Também se pode escrever:

> \[
\overline{A} = U - A
\]

---

## Conjuntos Numéricos

Na matemática, os **conjuntos numéricos** são coleções de números que compartilham certas propriedades. A seguir, apresentamos os principais conjuntos numéricos.

### Números Naturais (\(\mathbb{N}\))

O conjunto dos **números naturais** é formado pelos números usados para **contar**. Dependendo da convenção, o conjunto pode incluir ou não o zero.

\[
\mathbb{N} = \{0,1,2,3,4,5,\dots\} \quad \text{ou} \quad \mathbb{N}^* = \{1,2,3,4,5,\dots\}
\]

- **Uso**: contagem, enumeração de objetos.  
- **Exemplo**: 0, 7, 42 são números naturais.

### Números Inteiros (\(\mathbb{Z}\))

O conjunto dos **números inteiros** inclui os naturais, seus opostos (negativos) e o zero.

\[
\mathbb{Z} = \{\dots, -3, -2, -1, 0, 1, 2, 3, \dots\}
\]

- **Uso**: operações que envolvem ganhos e perdas, deslocamentos, temperatura.  
- **Exemplo**: -5, 0, 12 são inteiros.

### Números Racionais (\(\mathbb{Q}\))

O conjunto dos **números racionais** inclui todos os números que podem ser escritos como **fração de inteiros**, com denominador diferente de zero.

\[
\mathbb{Q} = \left\{ \frac{p}{q} \;\middle|\; p \in \mathbb{Z},\ q \in \mathbb{Z}^*,\ q \neq 0 \right\}
\]

- **Uso**: divisões exatas, proporções, percentuais.  
- **Exemplo**: \(\frac{1}{2}, -3, 0.75\) são números racionais.

### Números Irracionais (\(\mathbb{I}\))

Os **números irracionais** são aqueles **que não podem ser expressos como fração de inteiros**. Suas casas decimais são infinitas e não periódicas.

\[
\mathbb{I} = \{ \pi, \sqrt{2}, e, \dots \}
\]

- **Uso**: medições, cálculos que envolvem raízes não exatas e constantes matemáticas.  
- **Exemplo**: \(\pi \approx 3.14159\dots, \sqrt{3} \approx 1.732\dots\)

### Números Reais (\(\mathbb{R}\))

O conjunto dos **números reais** é a união dos racionais e irracionais. Ele inclui todos os números que podem ser representados na **reta numérica**.

\[
\mathbb{R} = \mathbb{Q} \cup \mathbb{I}
\]

- **Uso**: medições contínuas, funções, geometria.  
- **Exemplo**: -2, 0, 0.333..., \(\pi\)

### Números Complexos (\(\mathbb{C}\))

O conjunto dos **números complexos** inclui todos os números que podem ser escritos na forma:

\[
z = a + bi \quad \text{com } a, b \in \mathbb{R} \text{ e } i^2 = -1
\]

- **Uso**: engenharia, eletrônica, física, transformadas.  
- **Exemplo**: \(3 + 2i, -i, 4\) (note que todo número real também é um número complexo com \(b = 0\)).

---

## Intervalos de Números Reais

Em matemática, um **intervalo** é um subconjunto de \(\mathbb{R}\) em que todos os números entre dois limites pertencem ao conjunto. A tabela a seguir resume os principais tipos de intervalos.

| Notação de subconjunto | Nomeclatura | Notação de intervalo |
|-----------------------|------------|--------------------|
| \(\{x \in \mathbb{R} \mid a \le x \le b\}\) | Intervalo fechado | \([a, b]\) |
| \(\{x \in \mathbb{R} \mid a < x < b\}\) | Intervalo aberto | \((a, b)\) |
| \(\{x \in \mathbb{R} \mid a \le x < b\}\) | Intervalo fechado à esquerda e aberto à direita | \([a, b)\) |
| \(\{x \in \mathbb{R} \mid a < x \le b\}\) | Intervalo aberto à esquerda e fechado à direita | \((a, b]\) |
| \(\{x \in \mathbb{R} \mid x \le b\}\) | Intervalo ilimitado à esquerda (fechado) | \((-\infty, b]\) |
| \(\{x \in \mathbb{R} \mid x < b\}\) | Intervalo ilimitado à esquerda (aberto) | \((-\infty, b)\) |
| \(\{x \in \mathbb{R} \mid x \ge a\}\) | Intervalo ilimitado à direita (fechado) | \([a, +\infty)\) |
| \(\{x \in \mathbb{R} \mid x > a\}\) | Intervalo ilimitado à direita (aberto) | \((a, +\infty)\) |
| \(\{x \in \mathbb{R} \}\) | Intervalo total | \((-\infty, +\infty)\) |

---

## Diagramas de Intervalos Numéricos

Representações visuais dos intervalos de \(\mathbb{R}\) usando setas e colchetes para indicar limites abertos e fechados.

- ● → limite incluído (fechado)  
- ○ → limite não incluído (aberto)  
- \(\longleftarrow, \longrightarrow\) → infinitos

| Tipo de intervalo | Representação |
|------------------|---------------|
| Intervalo fechado \([a,b]\) | \(\bullet----\bullet\) |
| Intervalo aberto \((a,b)\) | \(\circ----\circ\) |
| Fechado à esquerda, aberto à direita \([a,b)\) | \(\bullet----\circ\) |
| Aberto à esquerda, fechado à direita \((a,b]\) | \(\circ----\bullet\) |
| Ilimitado à esquerda, fechado à direita \((-\infty,b]\) | \(\longleftarrow----\bullet\) |
| Ilimitado à esquerda, aberto à direita \((-\infty,b)\) | \(\longleftarrow----\circ\) |
| Ilimitado à direita, fechado à esquerda \([a,+\infty)\) | \(\bullet----\longrightarrow\) |
| Ilimitado à direita, aberto à esquerda \((a,+\infty)\) | \(\circ----\longrightarrow\) |
| Intervalo total \((-\infty,+\infty)\) | \(\longleftarrow----\longrightarrow\) |
