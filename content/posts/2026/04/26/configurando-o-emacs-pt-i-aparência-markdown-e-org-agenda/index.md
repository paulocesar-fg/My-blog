---
title: "Configurando o Emacs pt.I: aparência, markdown e org-agenda"
date: 2026-04-26T15:46:07-0300
draft: true
description: "Descrição do post aqui"
tags: []
categories: ["computer"]

featuredImage: ""
lightgallery: true
---

Olá leitor(a), meu nome é Paulo César. Neste post quero documentar a primeira parte da minha configuração do Emacs. 

Lembrando, isto não é um tutorial, é apenas a minha maneira de organizar a informação na minha mente.

## O que é Emacs

De forma simplista, o Emacs é um editor de texto extremamente poderoso, customizável e extensível, criado originalmente por **Richard Stallman** em 1976.

Como eu disse "de forma simplista", pois o Emacs não pode ser resumido como um Editor de texto. Na verdade, ele é um **ambiente operacional** construído em torno de um interpletador de Elisp(Emacs Lisp).

Tudo é feito em Elisp. Isso permite a criação de atalhos, novas funções, modificar a aparência entre muitas outras possibilidades.

Além disso, por ser um ambiente completo, você pode ter "vida dentro do Emacs". Ler emails(Gnus), navegar em diretórios(usando Dired, por exemplo), gerenciar agendas(Org-mode), depurar código(GDB), tocar músicas(EMMS), são exemplos do que é possível fazer com Emacs.

O Emacs conta com uma gama de packages(pacotes) onde é possível customizar e personalizar ainda mais o ambiente Emacs. Por exemplo, adicionando o pacote Magit é possível fazer controle de versão eficiente no Emacs.


## Emacs x GNU Emacs

Atualmente, quando se fala em "Emacs", na grande maioria das vezes, está se referindo ao GNU Emacs. Essa distinção existe porque o Emacs original evoluiu e foi incorporado ao GNU Project, projeto que buscava criar um ecossistema completo de software livre.

Foi dentro desse contexto que o GNU Emacs se consolidou como a principal, e praticamnete única, implementação relevante do Emacs nos dias atuais. 

Ao abrir o Emacs no seu sistema, você (geralmente) está usando o GNU Emacs , um editor que, ao longo das décadas, deixou de ser apenas uma ferramenta para tornar-se um verdadeiro ecossistema programável.

Por isso, neste post, quando eu utilizar o termo "Emacs", estou me referindo ao "GNU Emacs".

## Instalando o Emacs

Atualmente, possuo dois setups, no meu notebook uso windows 11 com WSL2 rodando Ubuntu, e no meu Desktop eu uso Debian.

Neste post, estou documentando a configuração feita  no meu Desktop. Sendo assim, vou instalar o emacs via apt, executando:

```zsh
sudo apt update
sudo apt install emacs
```

Depois de instalar você pode executar o Emacs, rodando o comando `emacs` no terminal.  Caso queira rodar direto no terminal, mesmo estando em uma interface gráfica, rode `emacs -nw`.

### Notações utilizados neste post

Antes de prosseguir entenda a seguinte notação:

**M** = Meta key(Alt na maioria dos teclados);
**C** = Ctrl
**RET** = Enter.

Agora que tem o Emacs o instalado, recomendo abrir o tutorial interativo e dar uma boa lida nele. Para abrir o tutorial execute o comando `C-h t` e leia, isso já vai te dar uma boa base dos principais comandos do Emacs.

## Adicionando o MELPA

Por padrão, o Emacs costuma vir somente com suporte a repositório ELPA, o repositório oficial mantido pelo time do Emacs.

Mas aqui vamos utilizar alguns pacotes que estão disponíveis no MELPA. O MELPA possui pacotes mais atualizados, e é mantido pela comunidade do Emacs;

Para adicionar o MELPA ao Emacs, deve-se abrir o aarquivo de configuração do Emacs, normalmente ele é nomeado como `init.el` ou `.emacs`. Caso ele não exista, entre no Emacs e faça `C-x C-f ~/.emacs.d/init.el RET`.

No arquivo `init.el` escrevemos:

```lisp 
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)
```
Agora no Emacs faça `M-x package-refresh-contents`, para atualizar o repositório de pacotes.

## Mudando o tema do Emacs

Eu também pretendo usar o Emacs no terminal, para isso é importante, previamente, saber se o emulador de terminal utilizado possui **True Colors**. Por sorte, a maioria dos emuladores de terminais modernos já suportam isso.

No meu caso como uso o Alacritty, eu abro o arquivo de configuração  `C-x C-f ~/.config/alacritty/alacritty.toml` 

```toml
[env]
TERM = "alacritty"
COLORTERM = "truecolor"
```

Para combinar com o tema do meu terminal, vou baixar o tema Tokyo Night disponível no MELPA.

Baixar um pacote é bem simples, no Emacs faça `M-x package-install RET nome-do-pacote RET`.  

Para baixar o tema Tokyo Night basta fazer `M-x package-install RET tokyo-night RET`.

Emacs vamos criar na pasta `~/.emacs.d/lisp/` o arquivo `themes.el`, e nele salvar o seguinte:

```lisp
;; Activation True Color
(unless (display-graphic-p)
  (setq term-file-prefer-24-bit t))

;;Loading Tokyo Night Theme
(load-theme 'tokyo-night t)

(provide 'themes)
```

E no arquivo `init.el` adicionar:
```lisp
(require 'themes)
```

Para carregar as mudanças sem sair do Emacs, basta executa o comando `M-x eval-buffer`.

Além de adicionar o tema, vou fazer mais algumas simples, para deixar meu Emacs mais "clean":

- Desativar a barra de menu;
- Desativar a barra de ferramentas;
- Desativar a barra de rolagem lateral;
- Desativar a tela inicial do Emacs;
- Remover a mensagem padrão do \*stratch\*;

Então adicionamos o seguinte ao `themes.el`

```lisp
(menu-bar-mode -1) ;;hide menu bar
(tool-bar-mode -1) ;; hide tool bar
(scroll-bar-mode -1) ;;hide tool bar
(setq inhibit-startup-screen t) ;; remove startup screeen
(setq initial-scratch-message "") ;; remove scratch inital message
```
Agora reiniciamos o Emacs e:

{{< image src="./images/tokyo-night.webp" caption="Emacs com Tokyo Night Aplicado" >}}

## Configurando o Doom-modeline

