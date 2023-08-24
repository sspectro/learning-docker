# learning-docker
>Projeto ambientes profissionais completos com Docker
>>Projeto desenvolvido no curso de  `Leonardo Moura Leitao` - Udemy [Docker: Ferramenta essencial para Desenvolvedores](https://www.udemy.com/course/curso-docker/)

## Ambiente de Desenvolvimento
Linux, Docker
## Desenvolvimento:
1. <span style="color:383E42"><b>Preparando ambiente</b></span>
    <!-- <details><summary><span style="color:Chocolate">Detalhes</span></summary> -->
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

## Meta
><span style="color:383E42"><b>Cristiano Mendonça Gueivara</b> </span>
>
>>[<img src="readmeImages/githubIcon.png">](https://github.com/sspectro "Meu perfil no github")
>
>><a href="https://linkedin.com/in/cristiano-m-gueivara/"><img src="https://img.shields.io/badge/-LinkedIn-%230077B5?style=for-the-badge&logo=linkedin&logoColor=white"></a> 
>
>>[<img src="https://sspectro.github.io/images/cristiano.jpg" height="25" width="25"> - Minha Página Github](https://sspectro.github.io/#home "Minha Página no github")<br>



><span style="color:383E42"><b>Licença:</b> </span> Distribuído sobre a licença `Software Livre`. Veja Licença **[MIT](https://opensource.org/license/mit/)**. para mais informações.