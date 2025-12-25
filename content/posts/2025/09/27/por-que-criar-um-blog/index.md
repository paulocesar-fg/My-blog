---
title: "Por que criar um blog ?"
date: 2025-09-27T14:51:20-0300
draft: false
description: "Minhas motivações para criar este blog."
tags: 
 - off-topic
---

Há muito tempo eu já vinha cogitando a ideia de criar um blog, porém, devido à rotina cotidiana, acabei adiando o projeto. No entanto, finalmente consegui realizar esse objetivo e quero documentar, neste artigo, as razões que me levaram a criar esse site, bem como um pouco do processo de desenvolvimento dele.

## Minhas motivações


Eu sempre tive uma grande necessidade de anotar minhas ideias, pois isso me ajuda a organizá-las. A escrita é a forma que encontrei para tentar evitar o **overthinking** (excesso de pensamentos) e, assim, não ficar perdido em minha própria mente. Sendo assim, eu diria que este blog é um “backup” da minha mente. Primariamente, penso em escrever algo que o Paulo César do futuro gostaria de ler, o que garante a longevidade do conteúdo, bem como a automotivação para continuar escrevendo.

Além disso, outro ponto crucial que me levou a criar esse projeto é a melhora da comunicação. Programadores costumam ser **péssimos** comunicadores. Nós falamos somente para nós mesmos e esperamos que os outros entendam. E pior: quando a outra pessoa não entende, atribuímos a falha ao receptor da mensagem e não ao mensageiro (nós). Eu sei que, à primeira vista, as coisas parecem complexas (e muitas vezes realmente são), mas um bom comunicador deve saber simplificar a ideia para que um leigo consiga entender, mesmo que não seja de maneira técnica. Afinal, nossos clientes normalmente não serão programadores — então como vamos explicar nossas decisões técnicas para eles?

Por fim, quero citar a pessoa que me inspirou quando tomei a decisão de começar este blog. Trata-se de **Fabio Akita**, programador, Co-fundador da Codeminer42, palestrante e criador do canal [Akitando](https://www.youtube.com/@Akitando) e do blog [AkitaOnRails](https://www.akitaonrails.com). Li e assisti a diversos conteúdos produzidos pelo Akita, mas, em especial, quero destacar aqueles que me influenciaram diretamente a criar este blog.

- [Meu Novo Blog -- como fiz](https://akitaonrails.com/2025/09/10/meu-novo-blog-como-eu-fiz/)  
- [[Akitando] #18 - Motivação: O Diário de Henry Jones](https://akitaonrails.com/2018/10/16/akitando-18-motivacao-o-diario-de-henry-jones/)
- [[Off-Topic] Programadores são péssimos Comunicadores (UDP vs TCP)](https://akitaonrails.com/2013/11/02/off-topic-programadores-sao-pessimos-comunicadores-udp-vs-tcp/)

## Apenas comece

Creio que meu maior erro tenha sido, inicialmente, tentar imaginar o **“blog perfeito”** . Um blog não precisa de nada muito sofisticado; basta que seja organizado. Ser simples é uma grande vantagem, porque posso focar no conteúdo, em vez de perder tempo fazendo manutenção em sistemas desnecessariamente complexos. Resumindo, ***Just do it***.


Qualquer ser humano normal possui medo de contrariar os outros, de ofender, de atrair críticas, de as pessoas não entenderem sua mensagem. Porém, é preciso cruzar essa linha. Por mais que suas opiniões sejam criticadas, ou que você não seja visto como “o cara bonzinho”. Portanto, supere esse medo, ou é melhor repensar seus planos.


## Desenvolvimento do blog

Como dito anteriormente, para um blog pessoal não é necessário um sistema complicado, como banco de dados ou coisas do tipo. Resolvi fazer um blog com páginas estáticas. Além disso, quis evitar a dor de cabeça de ter um engine do zero, até que, enquanto lia este [artigo do blog AkitaOnRails](https://akitaonrails.com/2025/09/10/meu-novo-blog-como-eu-fiz/), descobri o [Hugo](https://gohugo.io) — um blog engine escrito em **GO**.

#### Hugo & Hextra

Utilizar um blog engine como o Hugo é uma das formas mais convenientes para um programador criar um blog: basta criar um arquivo localmente, escrever o texto em markdown, rodar um script e subir um site estático, que não precisa de configurações complexas, como um banco de dados, por exemplo.

Um artigo para o Hugo se parece com isto( muito simples):

```yaml
---
title: "Por que criar um blog ?"
date: 2025-09-27T14:51:20-0300
draft: false
description: "Minhas motivações para criar este blog."
tags: []
categories: []
---

Escreva o conteúdo aqui...
```

Além disso, o Hugo conta com alguns temas prontos para uso — ou seja, não é necessário sofrer configurando o frontend. Eu buscava um layout simples e minimalista e, após ver vários desses temas, resolvi utilizar o [Hextra](https://themes.gohugo.io/themes/hextra/), pois parecia contar com tudo  que um blog de tecnologia precisava.

Não comecei o projeto Hugo/Hextra do zero, utilizei o [Hextra Starter Template](https://github.com/imfing/hextra-starter-template), foi bem mais prático do que começar com o Hugo do zero.


Não vou descrever todo o processo de desenvolvimento, pois seria muito maçante. Para isso basta ler [a documentação do Hugo](https://gohugo.io/documentation/).

## Conclusão

Esse é o primeiro post do meu blog, então nada melhor do que falar sobre o próprio blog. Sou novo nessa atividade, então creio que, com o tempo, esses artigos fiquem cada vez melhores.

Sinceramente, fiquei satisfeito com o resultado final, ainda mais considerando que foram necessárias poucas horas para desenvolver esse projeto.

O projeto ficou de fácil manutenção e, portanto, posso focar mais no conteúdo. Todavia, escrever um blog é completamente diferente de escrever a documentação de um projeto, por exemplo. O exercício de escrever o mínimo e comunicar o máximo possível, ou de contar histórias que engajem do início ao fim, vai além das formalidades técnicas.

No final, escrever algo que você goste de ler é mais importante do que qualquer tecnologia usada para criar o blog.
