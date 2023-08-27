

![Logo](https://i.imgur.com/vzwxorW.png)

(LFG) Sistema de concessão de crédito MVP
___

## Modo de uso da aplicação
### Personalização dos campos da proposta
Tipos de campos aceitos na versão inicial: number, decimal, text

Formato: {'valor': 'decimal', 'valor2': 'number', 'valor3': 'text'}

https://github.com/MarceloJDCB/loansforgood/assets/91851259/ec893bce-cfeb-4bbb-a3cb-31cb50680ba5


### Administração das propostas pendentes de análise humana

https://github.com/MarceloJDCB/loansforgood/assets/91851259/4c4e7c64-a9e6-4b28-9b86-a6c1f4cca08a


## Instalação, desenvolvimento e manutenção da aplicação

* DISCLAIMER: Os serviços do Docker devem englobar a instalação de todas as dependências para facilitar o uso no desenvolvimento e implantação em produção. Assim, eles devem ser mantidos atualizados e não podem ser substituídos pela documentação. As documentações devem ser atualizadas conforme necessário, refletindo as mudanças no ambiente e arquitetura. Portanto, as informações sobre pacotes, versões, dependências, etc., presentes neste documento ajudam nas explicações, porém as informações mais precisas, estarão sempre no código, seja no docker-compose.yml, Dockerfile, Pipfile/Pipfile.lock, package.json/yarn.lock. Automatize o que for possível automatizar e documente o que foi automatizado.

* DISCLAIMER[2]: A pool gevent foi definida como padrão para o único worker celery pois o requisito do uso do celery foi definido para fazer apenas chamadas HTTP, caso tivessemos mais tasks poderiamos instanciar novos workers em diferentes pools para operações cpu bound, io bound, etc...
### Dependências

- Docker >=20
- docker-compose >=1.21

### Setup ambiente
#### Ubuntu ou WSL
`$ sudo apt install make -y`
#### Backend
`cd backend`

`$ sudo apt update -y`

`$ sudo apt install software-properties-common -y`

`$ sudo apt install -y build-essential git curl python3 python3-pip python`

`$ make init`

Usuário de testes: N: DigitalSys P: 123

#### Frontend
`cd frontend`

`$ make init`

### Comandos Makefile
#### Backend
Apresenta os logs do container selecionado, web, db, celery, redis...

`$ make logs {ARGS}`
___
Inicia todos os serviços:

`$ make up`
___
Para todos os serviços:

`$ make stopall`
___
Cria o super user DigitalSys:


`$ make createsu`
___
Roda o comando flake8 para verificar a PEP8 do código:

`$ make flake8`
___

Para executar qualquer comando do Django (Django management commmands):

`$ make dj "<comando> e opções entre aspas"`
___

Para instalar um novo pacote python:

`$ make install "<pacote> [pacote]"`

* Isso instala o pacote no container e atualiza os arquivos Pipfile
* Caso o pacote instalado seja usado apenas para o desenvolvimento, user a flag `--dev`

___

Para iniciar, parar ou reiniciar um serviço/container, respectivamente, use:

`$ make start [nome do servico]`

`$ make stop [nome do servico]`

`$ make restart [nome do servico]`

Os serviços disponíveis são:

- db: postgres
- celery: worker do celery
- web: a aplicação django
- redis: redis sendo usado como fila consumida pelo Celery
___

Para usar um shell dentro de um container (para depuração, por exemplo):

`$ make sh <nome do servico>`
___

Para executar os tests:

`$ make test`

___
Para reiniciar o worker do celery:

`$ make restart_celery`
___
Mais comandos make:
- `up_debug`: inicia o container django em modo debug
- `recreate_db`: dropa o banco de dados, cria um novo e realiza as migrações do django
- `restore_database`: restaura um dump de banco de dados e aplica as migrações
- `restore_dblocal`: restaura um dump e cria o super usuário DigitalSys
- `migrate`: aplica as migrações do django no container
- `makemigrations`: cria as migrações do django
- `makemigrations_merge`: realiza o merge das migrations do django
- `docker_prune`: para e remove todos os containers/imagens
- `_rebuild`: rebuilda todos os containers sem cache

___
#### Frontend
Para iniciar o serviço:

`$ make up`
___
Parar o serviço:

`$ make stop`
___
Buildar o container:

`$ make build`
___
Buildar o container sem cache:

`$ make build-no-cache`
___
Parar e remover os containers:

`$ make down`
