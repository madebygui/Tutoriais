# Subindo uma imagem docker para o Google Cloud Run

> **⚠️ Importante**<br>
> Instalar o gcloud na máquina local<br>
> https://cloud.google.com/sdk/docs/install<br>

## Instalando o gcloud

-   Instalar python
-   Fazer download do pacote (para saber qual a versão da arquitetura basta roda `uname -m` no terminal)
-   Extrair os arquivos em qualquer lugar
-   Executar o comando `./install.sh` dentro da pasta

## Preparando o gcloud

### Rodar os seguintes comandos:

`gcloud auth login`<br>
`gcloud config configurations list` - Listar as configurações<br>
`gcloud config configurations create nome-qualquer`<br>
`gcloud config set project nome-projeto` - Nome do projeto no GCP<br>
`gcloud config set project nome-projeto` - Nome do projeto no GCP<br>
`gcloud config set account email` - Email do usuário da conta GCP com permissões<br>

## Arquivos no projeto

-   [Dockerfile](files/dockerfiles) - Configurações do Docker*
-   [docker-compose.yml](files/docker-compose.yml) - Configurações do build do docker*
-   [start.sh](files/start.sh) - Para iniciar o projeto dockerizado
-   [cmd.sh](files/cmd.sh) - Para abrir o projeto dockerizado no terminal
-   [deploy.sh](files/deploy.sh) - Para rodar o build no Cloud Run*
-   [cleanup.sh](files/cleanup.sh) - Para apagar o projeto do Cloud Run
-   [build.sh](files/build.sh) - Para rodar o build local
-   [nginx.conf](files/nginx.conf) - Utilizado em projetos React para criar um servidor*

**Arquivos necessários para subir para o Cloud Run*

> **⚠️ Importante**<br>
> Altere o arquivo deploy.sh adicionando as informações corretas do seu projeto

Transforme os arquivos sh em executáveis:

`chmod +x nome_arquivo`

## Deploy do projeto

Basta rodar o arquivo deploy.sh

`./deploy.sh`

Esse comando vai procurar o arquivo docker-compose.yml dentro do diretório e vai subir o container para o cloud run.

Após concluir esse processo será exibido o link gerado do site/sistema web.

## CI/CD

Para vincular o cloud run ao Github basta clicar em Configurar Implantação Contínua.

Em Build Type selecione Dockerfile

Vá em Cloud Build, clique no serviço criado e edite o gatilho. Edite o arquivo yaml inline conforme o arquivo [cloudbuild.yaml](files/cloudbuild.yaml).

> **⚠️ Importante**
> Não esqueça de adicionar as variáveis de ambiente

## Vincular o domínio à imagem docker

`Cloud Run > Gerenciar Domínios Personalizados > Adicionar Mapeamento`

## Instalando o docker na máquina local

Base: https://blog.rocketseat.com.br/introducao-ao-docker-criando-um-servidor-web-com-node-js-e-subindo-para-o-container/

-   Criar um projeto qualquer
-   Colocar todos os arquivos listados acima na raiz do projeto
-   Transformar os arquivos sh em executáveis
-   Rodar os seguintes comandos:

_Fazer o build do container_
`./build.sh`

_Executar o container_
`./start.sh`

## Usando o Banco de dados local no docker

Host: host.docker.internal
