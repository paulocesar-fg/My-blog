---
title: "Introdução à lógica matemática - Parte. I"
date: 2025-11-03T14:46:38-0300
draft: false
description: "Descrição do post aqui"
tags: [math]
categories: []
---



Quero, neste post, compilar de forma rápida e objetiva alguns conhecimentos que obtive ao ler o livro ["How to Prove It: A Structured Approach"](https://a.co/d/d0MN9Ji), de Daniel J. Velleman, que se trata de uma introdução prática e rigorosa ao processo de construir e entender demonstrações matemáticas. 

O livro é grande, então vou dividir o conteúdo por partes, sendo este post a primeira.

## O que a lógica matemática estuda?

A lógica matemática estuda os princípios formais do raciocínio e os sistemas usados para representar e analisar argumentos válidos.

A matemática é, acima de tudo, uma ciência *dedutiva*. Além disso, pode-se dizer que os matemáticos são céticos — ou seja, não basta afirmar que algo é verdadeiro; é preciso mostrar por que é verdadeiro, isto é, provar. Nesse processo, o estudo da lógica é crucial.

Também vale ressaltar que a lógica não considera diretamente o conteúdo das afirmações; ela examina a estrutura lógica para determinar quando uma conclusão segue corretamente das premissas.

## Proposições

*Proposições* — também chamadas de *sentenças* — são afirmações declarativas que podem ser classificadas como *verdadeiras* ou *falsas*, mas nunca ambas ao mesmo tempo.

Ao valor verdadeiro (V) e falso (F) damos o nome de *valor-lógico*.

**Exemplos:**
* Fernando é careca.
* O Brasil faz parte da América.
* \(10 < 50\).
* \(10 > 20\) (proposição falsa).

## Predicados

Os *predicados*, também chamados de *sentenças abertas*, são expressões que contêm variáveis e só é possível determinar seu valor-lógico após definir os valores dessas variáveis.

**Exemplos:**

* \(y \leq x\);
* \(x > 50\);
* \(ab^2 = 30\).

## Tabela-verdade

Ao longo deste post vamos utilizar tabelas-verdade, uma ferramenta da lógica matemática para exibir, de maneira organizada, todas as combinações possíveis de valores lógicos (verdadeiro ou falso) de uma expressão.

Como é montada uma tabela-verdade:

1. **Colunas:** cada coluna representa uma proposição ou combinação de proposições.
2. **Linhas:** cada linha representa uma possível combinação de valores-lógicos.
3. **Valores-lógicos:** representados por V (verdadeiro) e F (falso); em inglês, T (*true*) e F (*false*).

Exemplo ilustrativo:

| proposição 1   | proposição 2   | proposição 3 |
| --- | --- | --- |
| valor lógico 1 | valor lógico 1 | valor lógico 1 |
| valor lógico 2 | valor lógico 2 | valor lógico 2 |
| valor lógico 3 | valor lógico 3 | valor lógico 3 |
| valor lógico 4 | valor lógico 4 | valor lógico 4 |

> Ps: a tabela-verdade não possui limite máximo de proposições.

## Conectivos lógicos

Os *conectivos lógicos* são símbolos ou palavras usados para ligar proposições simples e formar proposições compostas, controlando a relação lógica entre elas.

---

#### Conectivo E (*and*)

O conectivo *E* representa a operação lógica de *conjunção*, e ele afirma que **duas proposições são verdadeiras ao mesmo tempo**.

Símbolo: \( \land \)

| P | Q | \(P \land Q\) |
|---|---|---|
| V | V | V |
| V | F | F |
| F | V | F |
| F | F | F |

> \(P \land Q\) — lê-se: *P e Q*.  
> Verdadeiro apenas quando ambas as proposições forem verdadeiras.

---

#### Conectivo Ou (*or*)

O conectivo *Ou* representa a operação lógica de *disjunção*, e afirma que **pelo menos uma das proposições é verdadeira**.

Símbolo: \( \lor \)

| P | Q | \(P \lor Q\) |
|---|---|---|
| V | V | V |
| V | F | V |
| F | V | V |
| F | F | F |

> \(P \lor Q\) — lê-se: *P ou Q*.  
> Falso apenas quando ambas as proposições forem falsas.

---

#### Não (*not*)

O conectivo *Não* representa a operação lógica de *negação*, e ele **inverte o valor-lógico de uma proposição**.

Símbolo: \( \neg \)

| \(P\) | \(\neg P\) |
|---|---|
| V | F |
| F | V |

> \(\neg P\) — lê-se: *não P*.

---

#### Condicional (*conditional*)

A condicional pode confundir no início. Ela expressa uma relação do tipo **"se... então"**.

Símbolo: \( \to \)

> *Se P é verdadeiro, então Q também é verdadeiro.*

P é a **hipótese** (ou *antecedente*), Q é a **conclusão** (ou *consequente*).

| P | Q | \(P \to Q\) |
|---|---|---|
| V | V | V |
| V | F | F |
| F | V | V |
| F | F | V |

> A condicional é falsa somente quando **P é verdadeiro e Q é falso**.  
> Se a hipótese é falsa, a condicional é considerada verdadeira.

Uma intuição formal:

> Uma condicional só *promete* algo quando a hipótese é verdadeira.  
> Se a hipótese nunca acontece, não há violação da promessa.  
> Portanto, se a hipótese é falsa, a condicional é verdadeira.

**Exemplificando**

Seja \(P\) = “Eu estudo para a prova” e \(Q\) = “Eu passo na prova”:

| Situação | Resultado |
|---|---|
| Estudo e passo |  Verdadeiro |
| Estudo e não passo |  Falso |
| Não estudo e passo | Verdadeiro |
| Não estudo e não passo |  Verdadeiro |

---

#### Bicondicional (*biconditional*)

Símbolo: \(P \iff Q\)

> Lê-se: *P se e somente se Q*.

| P | Q | \(P \iff Q\) |
|---|---|---|
| V | V | V |
| V | F | F |
| F | V | F |
| F | F | V |

A bicondicional afirma uma **equivalência lógica**:

> \(P \iff Q\) é verdadeiro quando P e Q têm o mesmo valor-lógico  
> (ambos verdadeiros ou ambos falsos).

Caso tenham valores diferentes, a bicondicional é falsa.

## Quantificadores

Os quantificadores são símbolos (ou palavras) da lógica que especificam a quantidade ou abrangência sobre elementos de um conjunto. Eles atuam sobre *predicados (sentenças abertas)* — isto é, proposições que dependem de variáveis.

#### Quantificador Universal — \(\forall\)

Declara que ***tudo dentro de um domínio*** satisfaz uma condição.

\[
\forall x,\, P(x)
\]

Lê-se:
> **Para todo** \(x\), \(P(x)\) é verdadeiro.

Uma observação importante é que, se existir um único contraexemplo, a afirmação universal é falsa.

#### Quantificador Existencial — \(\exists\)

Declara que ***existe pelo menos um elemento de um domínio*** que satisfaz uma condição.

\[
\exists x,\, P(x)
\]

Lê-se:
> Existe um \(x\) tal que \(P(x)\) é verdadeiro.

Diferentemente do quantificador universal, o quantificador existencial precisa de apenas *um exemplo* para tornar-se verdadeiro.
