# learning-docker
>Projeto ambientes profissionais completos com Docker
>>Projeto desenvolvido no curso de  `Leonardo Moura Leitao` - Udemy [Docker: Ferramenta essencial para Desenvolvedores](https://www.udemy.com/course/curso-docker/)

## Ambiente de Desenvolvimento
Linux, Docker
## Desenvolvimento:
1. <span style="color:383E42"><b>Preparando ambiente</b></span>
    <details><summary><span style="color:Chocolate">Detalhes</span></summary>
    <p>

    - Instalação Docker
        Documentação [Link](https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository)
        - Atualize o aptíndice do pacote e instale pacotes para permitir apto uso de um repositório via HTTPS:
        ```sh
        sudo apt-get update
        sudo apt-get install ca-certificates curl gnupg
        ```

        - Adicione a chave GPG oficial do Docker:
        ```sh
        sudo install -m 0755 -d /etc/apt/keyrings
        curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
        sudo chmod a+r /etc/apt/keyrings/docker.gpg
        ```

        - Use o seguinte comando para configurar o repositório: 
        ```sh
        echo \
        "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
        "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
        sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
        ```

        - Atualize o aptíndice do pacote:
        ```sh
        sudo apt-get update
        ```

        - Para instalar a versão mais recente, execute:
        ```sh
        sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
        ```

        - Verificar docker instalado
        ```sh
        docker
        docker --help
        ```

        - Testar execução de container hello-world - se der permissão negada, adicionar `sudo` início do comando ou crie um grupo(sudo) conforme link [stackoverflow](https://stackoverflow.com/questions/48957195/how-to-fix-docker-got-permission-denied-issue)
        ```sh
        docker container run hello-world
        ```

    - Criar repositório no github

    - Incluir README com estrutura básica

    - Incluir gitignore
        Defina - python, django, visualstudiocode em [gitignore io](https://www.toptal.com/developers/gitignore)
        Incluir os diretórios static e data ao gitignore
        ```
        /static
        /data
        ```

    - Criar `.dockerignore` para [python](https://gist.github.com/KernelA/04b4d7691f28e264f72e76cfd724d448)

    </p>

    </details> 

    ---

2. <span style="color:383E42"><b>Exemplos com comandos</b></span>
    <details><summary><span style="color:Chocolate">Detalhes</span></summary>
    <p>

    >Comando run sempre cria novos containers

    - Opções de comandos
        ```bash
        docker container run --help  
        ```
    - Lista containers ativos	
        ```bash
        docker container ps
        docker container ls
        ```

    - Parando container
        ```bash
        docker container stop nomecontainer
        ```

    - Lista containers que já foram executados, independentet do status atual
        ```bash
        docker container ps -a
        docker container ls -a
        ```
    - Executar container marcando para ser removido do histórico de containers executados	
        ```bash
        docker container run --rm debian bash --version
        ```

    - Verifica versão `bash`
        ```bash
        - bash --version
        ```

    - Executa uma imagem do `debian` com comando que verifica versão do `bash` da imagem
        ```bash
        docker container run debian bash --version
        ```

    - Acessar container no modo interativo -  `i` - acesso ao terminal `t`. Acesso ao terminal do container
        ```bash
        docker container run -it bash
        ```
        - Cria arquivo no container e verifica
            ```bash
            touch curso-docker.txt
            ls
            ```

        - Sair do container
            ```bash
            exit
            ```
    
    - Cria container nomeando
        ```bash
        docker container run --name mydeb -it debian bash
        ```
    
    - Iniciar container criado no modo interativo terminal
        ```bash
        docker container start -ai mydeb
        ```

    - Lista as imagens locais
        ```bash
        docker image ls
        ```

    - Lista as volumes locais
        ```bash
        docker volume ls
        ```

    - Remover imagem usando id ou nome da imagem
        ```bash
        docker image rm nomeimage
        ```

    </p>

    </details> 

    ---

3. <span style="color:383E42"><b>Mapeando portas dos containers - nginx</b></span>
    <details><summary><span style="color:Chocolate">Detalhes</span></summary>
    <p>

    - Difinindo porta que o container vai ser iniciado. Container vai ser exposta a partir da porta definida. Verfica se está ativo
        ```bash
        docker container run -p 8080:80 nginx
        docker container ps
        ```
        Testando no navegador
        [http://localhost:8080/](http://localhost:8080/)

        Testando terminal
        ```bash
        curl http://localhost:8080
        ```

        Parando container/processo. Estando no terminal do container pressione `ctrl + c`. Basta verfiicar novamente se o container está ativo.
        
        

    </p>

    </details> 

    ---

4. <span style="color:383E42"><b>Mapeando diretórios para o container</b></span>
    <details><summary><span style="color:Chocolate">Detalhes</span></summary>
    <p>

    - Criar diretórios e arquivo `ex-volume/html/index.html`

    - Estando na pasta criada `ex-volume`: `$(pwd)` pasta corrente do host `/html` subpasta - Mapear para `:/usr/share/nginx/html`
        Vai deixar de apontar para a pasta padrão do `nginx` para apontar para pasta do host.
        ```bash
        docker container run -p 8080:80 -v $(pwd)/html:/usr/share/nginx/html nginx
        ```

        Teste no navegador `localhost:8080`

    </p>

    </details> 

    ---

5. <span style="color:383E42"><b>Rodar um servidor/container web em background</b></span>
    <details><summary><span style="color:Chocolate">Detalhes</span></summary>
    <p>

    Estando na pasta correta
    ```bash
    docker container run -d --name ex-daemon-basic -p 8080:80 -v $(pwd)/html:/usr/share/nginx/html nginx
    docker container ps
    ```
    
    Verificar no navegador em `localhost:8080`

    Parando container
    ```bash
    docker container stop ex-daemon-basic
    ```

    - Executar container já criado e verificar
        ```bsh
        docker container start ex-daemon-basic
        docker container ps
        ```

    - Reiniciar um container e parar: Usar nome ou id do container
        ```bash
        docker container restart nomecontainerjacriado
        docker container stop nomecontainerjacriado
        ```

    - Mostrar logs do container
        ```bash
        docker container logs ex-daemon-basic
        ```
    
    - Listar informações do container - json
        ```bash
        docker container inspect ex-daemon-basic
        ```

    - Verficar tipo de container - sistema que está no container
        ```bash
        docker container exec ex-daemon-basic uname -or
        ```
    </p>

    </details> 

    ---

6. <span style="color:383E42"><b>Primeiro build</b></span>
    <details><summary><span style="color:Chocolate">Detalhes</span></summary>
    <p>

    >Observação: `Dockerfile` deve ser escrito exatamente assim, primeira letra maiúscula e demais em minúscula
    - Criar diretório e arquivo `primeiro-build/Dockerfile` - usa imagem `nginx` - Exibe mensagem no arquivo `index` do nginx
        ```
        FROM nginx:latest
        RUN echo '<h1>Hello World</h1>' > /usr/share/nginx/html/index.html
        ```

    - Criando imagem  `ex-simple-build` - Deve ficar posicionado no diretório que está o arquivo `Dockerfile`
        ```bash
        docker image build -t ex-simple-build .
        docker image ls
        ```

    - Rodando imagem - Verficar em `http://localhost/` ou `localhost:80`
        ```bash
        docker container run -p 80:80 ex-simple-build
        ```

    </p>

    </details> 

    ---

7. <span style="color:383E42"><b>Passando argumentos</b></span>
    <details><summary><span style="color:Chocolate">Detalhes</span></summary>
    <p>

    - Criar diretório e arquivo `build-com-arg/Dockerfile` - usa imagem `debian`
        ```
        FROM debian
        LABEL maintainer 'Aluno Cod3r <aluno at cod3r.com.br>'

        ARG S3_BUCKET=files
        ENV S3_BUCKET=${S3_BUCKET}
        ```

    - Criando imagem  `ex-build-arg`
        ```
        docker image build -t ex-build-arg .
        docker image ls
        ```

    - Executando container e Mostrando o valor padrão configurado para `S3_BUCKET` no `Docker`
        ```
        docker container run ex-build-arg bash -c 'echo $S3_BUCKET'
        ```

    - Criando imagem  `ex-build-arg` passando valor para `$S3_BUCKET'`
        ```
        docker image build --build-arg S3_BUCKET=myapp -t ex-build-arg .
        ```
    - Executar container novamente 
        ```
        docker container run ex-build-arg bash -c 'echo $S3_BUCKET'
        ```

    - Verificando informação que consta no Dockerfile com `inspect`
        ```
        docker image inspect --format="{{index .Config.Labels \"maintainer\"}}" ex-build-arg
        ```

    </p>

    </details> 

    ---

## Meta
><span style="color:383E42"><b>Cristiano Mendonça Gueivara</b> </span>
>
>>[<img src="readmeImages/githubIcon.png">](https://github.com/sspectro "Meu perfil no github")
>
>><a href="https://linkedin.com/in/cristiano-m-gueivara/"><img src="https://img.shields.io/badge/-LinkedIn-%230077B5?style=for-the-badge&logo=linkedin&logoColor=white"></a> 
>
>>[<img src="https://sspectro.github.io/images/cristiano.jpg" height="25" width="25"> - Minha Página Github](https://sspectro.github.io/#home "Minha Página no github")<br>



><span style="color:383E42"><b>Licença:</b> </span> Distribuído sobre a licença `Software Livre`. Veja Licença **[MIT](https://opensource.org/license/mit/)**. para mais informações.