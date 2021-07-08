# Subindo uma imagem docker para o Google Cloud Run

> **⚠️ Importante**
> Instalar o gcloud na máquina local
> https://cloud.google.com/sdk/docs/install

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
`gcloud config configurations list` - Listar as configurações depois de criar<br>

## Arquivos no projeto

-   [Dockerfile](files/dockerfiles)
-   [docker-compose.yml](files/docker-compose.yml)
-   [start.sh](files/start.sh)
-   [cmd.sh](files/cmd.sh)
-   [deploy.sh](files/deploy.sh)
-   [build.sh](files/build.sh)

Transforme os arquivos sh em executáveis:

`chmod +x nome_arquivo`

## Deploy do projeto

Basta rodar o arquivo deploy.sh

`./deploy.sh`

Esse comando vai procurar o arquivo docker-compose.yml dentro do diretório e vai subir o container para o cloud run.

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
