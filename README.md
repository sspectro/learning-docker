# learning-docker
>Projeto ambientes profissionais completos com Docker
>>Projeto desenvolvido no curso de  `Leonardo Moura Leitao` - Udemy [Docker: Ferramenta essencial para Desenvolvedores](https://www.udemy.com/course/curso-docker/)

## Ambiente de Desenvolvimento
Linux, Docker

## Documentação - Links Úteis
[Comandos docker](https://gist.github.com/morvanabonin/862a973c330107540f28fab0f26181d8)
[Docke Postgres Image](https://hub.docker.com/_/postgres)
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

    >  Comando run sempre cria novos containers
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

    >  Observação: `Dockerfile` deve ser escrito exatamente assim, primeira letra maiúscula e demais em minúscula
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

8. <span style="color:383E42"><b>Instruções de povoamento - compiando/movendo arquivos</b></span>
    <details><summary><span style="color:Chocolate">Detalhes</span></summary>
    <p>

    - Criação de diretório e arquivo `build-com-copy/index.html`
        ```html
        <a href="conteudo.html">Conteudo do site</a>
        ```

    - Criar arquivo `build-com-copy/Dockerfile`
        ```
        FROM nginx:latest
        LABEL maintainer 'Aluno Cod3r <aluno at cod3r.com.br>'

        RUN echo '<h1>Sem conteudo</h1>' > /usr/share/nginx/html/conteudo.html
        # Qualquer arquivo .html que estiver na pasta que está esse arquivo(Dockerfile) será compiado para a pasta /usr/share/nginx/html/index.html
        COPY *.html /usr/share/nginx/html/
        ```

    - Criando imagem  `ex-build-copy` 
        ```
        docker image build -t ex-build-copy .
        ```

    - Executar container - testar em `localhost`
        ```
        docker container run -p 80:80 ex-build-copy
        ```

    </p>

    </details> 

    ---

9. <span style="color:383E42"><b>Instruções para execução `container` - Acesso volumes outro `container`</b></span>
    <details><summary><span style="color:Chocolate">Detalhes</span></summary>
    <p>

     - Criação de diretório e arquivo `build-dev/index.html`
        ```html
        <p>Hello rom python</p>
        ```

    - Criação de arquivo python `build-dev/run.py` - servidor python para resposta http
        ```python
        import logging
        import http.server
        import socketserver
        import getpass

        class MyHTTPHandler(http.server.SimpleHTTPRequestHandler):
            def log_message(self, format, *args):
                logging.info("%s - - [%s] %s\n"% (
                    self.client_address[0],
                    self.log_date_time_string(),
                    format%args
                ))

        logging.basicConfig(
            filename='/log/http-server.log',
            format='%(asctime)s - %(levelname)s - %(message)s',
            level=logging.INFO
        )
        logging.getLogger().addHandler(logging.StreamHandler())
        logging.info('inicializando...')
        PORT = 8000

        httpd = socketserver.TCPServer(("", PORT), MyHTTPHandler)
        logging.info('escutando a porta: %s', PORT)
        logging.info('usuário: %s', getpass.getuser())
        httpd.serve_forever()
        ```

    - Criar arquivo `build-dev/Dockerfile`
        ```python
        FROM python:3.6
        LABEL maintainer 'Aluno Cod3r <aluno at cod3r.com.br>'

        RUN useradd www && \
            mkdir /app && \
            mkdir /log && \
            chown www /log

        USER www
        VOLUME /log
        WORKDIR /app
        EXPOSE 8000

        ENTRYPOINT ["/usr/local/bin/python"]
        CMD ["run.py"]
        ```

    - Gerando imagem
        ```bash
        docker image build -t ex-build-dev .        
        ```
    
    - Executando container - Teste em `localhost`
        ```bash
        docker container run -it -v $(pwd):/app -p 80:8000 --name python-server ex-build-dev
        ```

    - Gerar novo container que acessa volume criado no container anterior
        ```bash
        docker container run -it --volumes-from=python-server debian cat /log/http-server.log
        ```

    </p>

    </details> 

    ---

10. <span style="color:383E42"><b>Enviar Imagens para o [Docker Hub](https://hub.docker.com/)</b></span>
    <details><summary><span style="color:Chocolate">Detalhes</span></summary>
    <p>

    - Gerando nova `tag` para imagem `ex-simple-build` - informa `nomeusuariodockerhub/nomerepositorio:tag`
        ```bash
        docker image tag ex-simple-build sspectrocris/simple-build:1.0

        docker image ls
        ```
    - Logar no docker 
        >Atenção a senha, caso precise usar  `sudo` ao executar comando `docker`, pois irá pedir primeiro a senha de usuário `sudo` da sua máquina local e em seguida a senha do `docker`
        ```bash
        docker login --username=sspectrocris
        ```
    
    - Efetuar push para dockerhub
        Confira no [Docker Hub](https://hub.docker.com/)
        ```bash
        sudo docker image push  sspectrocris/simple-build:1.0
        ```

    </p>

    </details> 

    ---

11. <span style="color:383E42"><b>Redes</b></span>
    <details><summary><span style="color:Chocolate">Detalhes</span></summary>
    <p>

    - Verificar modelos de rede
        ```bash
        docker network ls
        ```
        <!-- Saida -->
        NETWORK ID     NAME      DRIVER    SCOPE
        29...ae   bridge    bridge    local
        ba...fe   host      host      local
        a5...19   none      null      local
    
    - Inspecionar rede bridge
        ```bash
        docker network inspect bridge
        ```

    - Container com nerwork do tipo `none`
        >Container não tem acesso a outros containers, nem acesso ao mundo exterior. Não tem acesso via rede.

        - Exemplo Comando para criar um container 
        ```bash
        docker container run -d --net none debian
        ```

        - Comando para mostrar container com acesso a rede
            >Cria container marcando para ser removido após execução(`--rm`) - `ash`(tipo bash mais leve) - -c "ifconfig"(comando que será executado)
            ```bash
            docker container run --rm alpine ash -c "ifconfig"
            ```
        
        - Comando para criar container usando a rede none
            ```baseh
            docker container run --rm --net none alpine ash -c "ifconfig"
            ```

    - Interação entre conteiners
        Criar containe `container1`
        >Uso do `sleep` para deixar container rodando para executar o outro
        ```bash
        sudo docker container run -d --name container1 alpine sleep 1000
        ```

        Criar containe `container2`
        ```bash
        sudo docker container run -d --name container2 alpine sleep 1000
        ```

        Verificar ip container `container1` e `container2`
        ```bash
        docker container exec -it container1 ifconfig
        ```
        Verificar `container2` a partir do `container1`
        ```bash
        docker container exec -it container1 ping 172.17.0.3
        ```

        - Verficar acesso a site
            ```bash
            docker container exec -it container1 ping www.google.com
            ```
    - Rede tipo `bridge`
        Criando docker network
        ```bash
        docker network create --driver bridge rede_nova
        docker network ls
        ```
        Usando a rede criada
        ```bash
        ```
        usando rede criada
        ```bash
        docker container run -d --name container3 --net rede_nova alpine sleep 1000
        docker container exec -it container3 ifconfig
        ```
        verificar acesso `container3` para container1 que está em outra rede
        >Percebemos que não temos acesso a outra rede
            ```
            docker container exec -it container3 ping 172.17.0.2
            ```
        Configurar container para se conectar a rede bridge
            >Ficará duas interfaces de rede
            ```bash
            docker network connect bridge container3
            docker container exec -it container3 ifconfig
            docker container exec -it container3 ping 172.17.0.2
            ```
    - Rede tipo `host`
        ```bash
        docker container run -d --name container4 --net host alpine sleep 1000
        docker container exec -it container4 ifconfig
        ```
    

    </p>

    </details> 

    ---

## Projeto Envio de E-mails com Workers:
1. <span style="color:383E42"><b>Serviço Banco de Dados</b></span>
    <details><summary><span style="color:Chocolate">Detalhes</span></summary>
    <p>

    - Criar pasta e arquivo `email-worker-compose/docker-compose.yml`
        ```yml
        version: '3'

        services:
        db:
            image: postgres:9.6
            environment:
            - POSTGRES_HOST_AUTH_METHOD=trust

        ```

    - Rodar/subir serviço `db` e verificar - posicionar na pasta onde está o docker-compose.yml
        ```bash
        sudo docker-compose up -d
        sudo docker-compose ps
        ```

    - Executar comando no container do serviço `db` - Listar os banco de dados
        ```bash
        docker-compose exec db psql -U postgres -c '\l'
        ```

    - Parar o serviço
        ```bash
        sudo docker-compose down
        ```

    </p>

    </details> 

    ---

2. <span style="color:383E42"><b>Volumes</b></span>
    <details><summary><span style="color:Chocolate">Detalhes</span></summary>
    <p>

    - Criar pasta e arquivo `email-worker-compose/scripts/init.sql`
        ```sql
        create database email_sender;

        -- Acessar database

        -- Criar tabela
        create table emails(
            id serial not null,
            data timestamp not null default current_timestamp,
            assunto varchar(100) not null,
            mensagem varchar(200) not null
        );
        ```

    - Criar arquivo `email-worker-compose/scripts/check.sql`
        ```sql
        -- Lista databases
        \l

        -- Se conectar ao database
        \c email_sender

        -- Descrição da tabela de emails
        \d emails
        ```

    - Editar `email-worker-compose/docker-compose.yml`
        ```yaml
        version: '3'
        volumes:
        dados:
        services:
        db:
            image: postgres:9.6
            environment:
            - POSTGRES_HOST_AUTH_METHOD=trust
            volumes:
            # Volume dos dados
            - dados:/var/lib/postgresql/data
            # Scripts
            - ./scripts:/scripts
            - ./scripts/init.sql:/docker-entrypoint-initdb.d/init.sql
        ```

    - Executar arquivo
        `f` - file - `/scripts/cheq.sql` arquivo que será executado
        ```bash
        sudo docker-compose exec db psql -U postgres -f /scripts/check.sql
        ```

    - Em caso de erro ou resultado inesperado remova totalmente o volume criado e recrie
        Cuidado com o comando de remover/apagar volume no uso do dia a dia.
        ```bash
        sudo docker-compose down -v
        sudo docker-compose up -d

        sudo docker-compose exec db psql -U postgres -f /scripts/check.sql
        ```

    </p>

    </details> 

    ---

3. <span style="color:383E42"><b>Volumes</b></span>
    <details><summary><span style="color:Chocolate">Detalhes</span></summary>
    <p>

    - Teste

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