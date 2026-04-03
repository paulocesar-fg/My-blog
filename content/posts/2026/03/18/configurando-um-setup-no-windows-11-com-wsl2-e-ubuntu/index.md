---
title: "Configurando um  setup no Windows 11 com WSL2 e Ubuntu"
date: 2026-03-18T21:12:00-0300
draft: false
description: "Descrição do post aqui"
tags: 
    - linux
    - wsl2
    - ubuntu
    - windows

categories: 
    - computation


featuredImage: "images/wsl2-ubuntu-windows11-cover.webp"

lightgallery: true


---

Olá, meu nome é Paulo César. Neste post quero documentar como configurei meu primeiro ambiente Windows integrado com Linux por meio do WSL2.

## Contexto inicial

Recentemente eu comprei um notebook, pois até então eu possuía apenas um desktop. No entanto, atualmente a necessidade de ter um computador portátil tornou-se essencial na minha rotina. Diante disso, comprei um notebook.

Tempos atrás eu tive meu primeiro contato com Linux utilizando Ubuntu, e adorei o sistema. Tanto que depois testei várias outras distros, passando pelo Mint, Arch e, atualmente, utilizo Debian no meu desktop.

Entretanto, há alguns softwares que necessito e que infelizmente não estão disponíveis para Linux, e que são inviáveis de rodar no Wine ou em máquinas virtuais do Windows.

Uma das opções era usar dual boot, como eu já fazia no meu antigo desktop. Contudo, eu não queria ter que particionar meu SSD e gerenciar dois sistemas operacionais ao mesmo tempo.

Então, pesquisando um pouco mais a fundo, encontrei o WSL (Windows Subsystem for Linux), que me permitiria integrar o Linux ao meu Windows 11, assim resolvendo meu problema sem ter que recorrer a VMs (Virtual Machines) ou ao dual boot.

## WSL1 x WSL2

Como dito anteriormente, o Subsistema do Windows para Linux (WSL) é uma ferramenta do Windows que possibilita a execução de um ambiente Linux em um computador Windows, sem que haja necessidade de uma Virtual Machine ou de dual boot.

O WSL1 foi anunciado pela Microsoft em 2016, na conferência Build 2016, e sua beta foi lançada no Windows 10 Anniversary Update v160. O WSL1 foi um sucesso, tanto que em maio de 2019, na conferência Build 2019, a Microsoft anunciou o WSL2, sendo lançado oficialmente junto com o Windows 10 versão 2004.

Diferentemente do WSL1, que implementava uma camada de tradução dentro do próprio Windows, isto é, possuía compatibilidade parcial, o WSL2 passou a utilizar um kernel Linux real dentro de uma máquina virtual gerenciada, oferecendo compatibilidade completa com chamadas de sistema (system calls).

Em resumo, o WSL2 apresenta diversas melhorias em relação ao WSL1, especialmente em compatibilidade e desempenho geral. A principal exceção é o acesso a arquivos entre Windows e Linux, que pode ser mais lento — um problema que pode ser evitado mantendo os arquivos do projeto no mesmo ambiente em que as ferramentas estão sendo executadas.

## Instalando e configurando o WSL2 

No seu Windows, execute o CMD com permissões de administrador e rode o seguinte comando:

```bat
wsl --install
```

Depois disso, vá tomar um café enquanto aguarda a instalação de todos os pacotes necessários.

Após isso, você deve criar uma conta Unix, informando um nome e criando uma senha de root.

Por padrão, o WSL vem com o Ubuntu instalado. Você pode verificar a versão do WSL e a distro atual executando:

```bat
wsl -l -v
```

### Instalando o Windows Terminal

No mundo Linux um bom emulador de terminal é essencial, e para mim o Windows Terminal está muito bem feito, batendo de frente com o meu queridinho Alacritty.

No meu Windows 11, o Windows Terminal já veio pré-instalado. Caso contrário, basta acessar a Microsoft Store e instalá-lo.

Após a instalação, estando com o WSL aberto no terminal, pressione `CTRL + ,` para abrir as configurações e na opção `Default Terminal Application` selecione o Windows Terminal, depois vá em `save`, e, como sempre, reinicie o Windows.

Antes de começar a usar o WSL, resolvi deixar meu Windows Terminal mais bonito, pois, como ex-usuário de Arch, ainda possuo uma vontade insaciável de customizar tudo.

No browser acessei o site [Windows Terminal Themes](https://windowsterminalthemes.dev/), e após dar uma boa olhada nos temas disponíveis, escolhi o tema **tokyonight**. 

{{< image caption="Windows Terminal Themes" src="images/windows-terminal-theme.webp">}}

Depois de escolher o tema basta clicar no botão `Get Theme` que copiará um JSON. Voltando ao terminal do wsl, pressione novamente `CTRL + ,` para entrar nas configurações e, no canto esquerdo da tela, clique em `Open JSON File`. Pode abrir no Notepad mesmo.

Desça até encontrar "schemes" e, dentro dos colchetes, cole o JSON copiado.

{{< image caption="Colando o JSON" src="images/wt-json-theme.webp">}}

Depois volte ao terminal WSL e abra as configurações novamente. Selecione `Ubuntu`, depois vá em `Appearance` e em `color scheme` selecione o seu tema. No meu caso, selecionei `tokyo night`.

{{< image caption="Selecionando o tema" src="images/change-scheme.webp" >}}

### Instalando um editor de código

Agora o próximo passo é instalar um bom editor de código. Se quiser algo rápido e simples de configurar, eu recomendo instalar o Visual Studio Code.

Vá na Microsoft Store e instale o VSCODE. Depois entre no VSCODE e na aba de extensões instale a extensão WSL.


No meu caso, gosto de ficar constantemente no terminal, por isso irei usar o **Neovim**. Para instalar o Neovim execute:

```bash
sudo apt update && sudo apt install neovim
```

Não vou configurar o Neovim agora, pois retiraria o foco do post do WSL para o Neovim. Todavia, pretendo, em breve, escrever um post inteiro sobre como configurar o Neovim.

### Instalando e configurando o ZSH

O zsh (Z Shell) é um interpretador de comandos Unix/Linux, semelhante ao Bash, mas com funcionalidades avançadas e é altamente customizável.

Instalar o ZSH não é obrigatório. Utilizar apenas o Bash está longe de ser um problema. Utilizar o Z shell é mais um gosto pessoal meu mesmo.

Para instalar o zsh, execute:

```bash
sudo apt install zsh
```

Antes de fazer a mudança de shell, vou instalar um tema para o Zsh. Existem vários deles: entre os mais famosos estão *Oh My Zsh*, *Prezto*, *Spaceship* entre outros. Eu optei por utilizar o Powerlevel10k, pois já o utilizava no meu desktop e evitar dores de cabeça.

Para instalar o Powerlevel10k é bem simples, mas primeiro garanta que você tem o git instalado. Estando no Ubuntu ou Debian, execute:

```bash 
sudo apt install git
```

Você pode encontrar as informações para instalação do powerlevel10k no [repositório do github do projeto](https://github.com/romkatv/powerlevel10k).

Como estou utilizando Ubuntu, vou fazer a instalação manual. Basta executar o seguinte:

```bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
```

Agora que instalamos o Powerlevel10k, vamos fazer a mudança de shell executando:

```bash
chsh -s /usr/bin/zsh
```

Depois disso, feche o terminal wsl e reabra-o novamente que o Zsh estará sendo executado ao invés do bash.

Quando reabrir o terminal, nos deparamos com um wizard de configuração do Powerlevel10k.

Primeiro ele pergunta se estamos vendo um diamante. Isso serve para descobrir se nossa fonte possui gráficos.

Os terminais modernos são capazes de executar as chamadas Nerd Fonts, coleções de fontes que incluem ícones e símbolos extras utilizados em terminais, IDEs e prompts de shell como o Powerlevel10k.

Sendo assim, voltando ao [repositório do Powerlevel10k](https://github.com/romkatv/powerlevel10k), vou instalar a fonte MesloLGS NF, recomendada por eles.

Os links de download das fontes estão logo abaixo.
**Ps:** Os links podem ter "quebrado" após a data de publicação deste post.

- [MesloLGS NF Regular.ttf](https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf)
- [MesloLGS NF Bold.ttf](https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf)
- [MesloLGS Italic.ttf](https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf)
- [MesloLGS Bold Italic.ttf](https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf)

Após baixar os arquivos de fonte, vá no Explorer, selecione as fontes e clique com o botão direito. Em seguida, selecione a opção `install` para instalar as fontes no sistema.

Voltando ao Windows Terminal, faça `CTRL + ,` para abrir as configurações. Na aba à esquerda selecione `Ubuntu`, depois em `Appearance` e finalmente podemos trocar a fonte para **MesloLGS NF**.

Volte ao Powerlevel10k e veja se os ícones aparecem corretamente. Faça sua configuração como achar melhor. Caso queira reconfigurar, basta executar o comando:

```zsh
p10k configure
```

#### Plugin Zsh auto-suggestions

O Zsh Autosuggestions é um plugin para o Zsh que sugere automaticamente comandos enquanto você digita no terminal, baseado no histórico de comandos anteriores ou em comando populares.

As instruções para instalar o Zsh-autosuggestions estão documentadas no [repositório do projeto](https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md).

Se assim como eu, você estiver usando Ubuntu, primeiro faça um git clone do repositório para o diretório `~/zsh/zsh-autosuggestions`.

```zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
```

Depois adicione o seguinte no seu arquivo `.zshrc`:

```zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
```

Agora feche  e abra o terminal novamente.

### Instalando o ASDF

O ASDF é uma ferramenta de gerenciamento de versões. Antes do ASDF, cada linguagem de programação possuía seu próprio gerenciamento de versões, por exemplo o Node com o nvm, Python com o pyenv, Go com o goenv etc.

Isso gerava confusão, pois cada CLI tinha API, arquivos de configuração e mecanismos diferentes. Assim, muitas vezes, o *$PATH* precisava ser alterado manualmente ou os *shims* não funcionavam corretamente.

Com o ASDF é possível definir um arquivo nomeado `.tool-versions`. Ele é usado pelo **asdf** para definir quais versões cada ferramenta ou linguagem de um projeto deve usar.

No futuro, pretendo escrever um artigo sobre essa ferramenta.

Há várias formas de instalar o **asdf**, você pode vê-las no [site oficial da ferramenta](https://asdf-vm.com/).

No meu caso vou fazer a instalação pelo binário pré-compilado. Primeiro, faça o download do arquivo pré compilado, ele virá em .tar.gz. Vamos descompactá-lo e movê-lo para o diretório `/usr/local/bin`, executando:

```zsh
tar -C /usr/local/bin -xzf asdf-v0.18.1-linux-amd64.tar.gz
```

Abra o `~/.zshrc` com seu editor de código e adicione na última linha:

```.zshrc
export PATH=$PATH:/usr/local/bin
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
```

Salve e reinicie seu terminal. Para confirmar a instalação do asdf execute:

```zsh
asdf version
```

### Instalando o Docker 

Para instalar o Docker no WSL é bem simples, mas primeiro é necessário instalar o Docker Desktop no Windows. 

Primeiro acesse o [site oficial do docker](https://www.docker.com/) e faça download do executável e em seguida o execute. Instale o Docker desktop normalmente, ao fim da instalação sua máquina vai reiniciar. 

Espere o Docker desktop iniciar e faça seu login. 

Agora no WSL vamos fazer a instalação do Docker.

Antes de instalar o Docker pela primeira vez, precisamos configurar o repositório APT do Docker. 

Para fazer isso o comando é um tanto grande:

```zsh
sudo apt update
sudo apt install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

sudo tee /etc/apt/sources.list.d/docker.sources <<EOF
Types: deb
URIs: https://download.docker.com/linux/ubuntu
Suites: $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}")
Components: stable
Signed-By: /etc/apt/keyrings/docker.asc
EOF

sudo apt update
```

Após isso, instale os pacotes do Docker executando:

```zsh
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

Agora que o Docker está instalado, abra o Docker Desktop no Windows e vá em `Settings > Resources > WSL Integration`, e habilite a integração com o Ubuntu.

{{< image src="images/docker-desktop-wsl-integration.webp" caption="Integrando o Docker Desktop com WSL">}}

Mas antes de usar docker vamos configurar as permissões, para que assim não precisemos passar `sudo` junto com os comandos do docker. 

Por sorte fazer isso é simples, e está tudo documentado na documentação oficial.

```zsh
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
```

Para verificar se a instalação foi bem sucedida execute `docker ps`.

### Conclusão 

Depois de umas boas horas configurando esse setup, creio que cheguei em um ponto onde configurei uma distro linux utilizável. É claro que posteriormente irei fazer novas configurações, mas a base desse setup foi montada.