# Projeto Docker
## Sempre manter atualizado para novos estudos

    Projeto web em PHP8 MySQL8 com APACHE2

## Iniciar
    Para iniciar o projeto é necessário ter instalado Docker-compose
    o arquivo de inicialização esta dentro da pasta /bin
    para uma execução mais rápida de permissão de admin para o arquivo
        $ sudo chmod 777 -R start.sh
            ou 
        $ sudo ./start.sh
    O próprio start.sh executa o Docker em segundo plano para não travar o terminal em execução
    Toda estrutura do sistema será copiado para dentro dos containers

## Estrutura do sistema Pasta raiz
    Estrutura do site fica dentro da pasta /src
        $ cd /src

## Comandos Docker 
    Acessando o container
        $ docker exec -it <container> bash

## Comandos Mysql
    OBS: Foi necessário acessar o container do banco para restaurar o banco de dados
    acesse o container
    acesse o banco
        $ mysql -u root -p (será pedido a senha)
    verifique os bancos presentes, caso não tenha efetue a criação do mesmo
        $ show databases;
    selecione o banco 
        $ use nome_do_banco ;
        $ quit;

    pasta de backup do banco base
        $ cd /mnt/backup
    
    digite o comando para restauração do banco base
        $ mysql -u root -p 'banco' < backup.sql


# <=> <=> <=> <=> <=> <=>

# Docker Suicídio kkkkkk

docker stop $(docker ps -aq)
docker rm $(docker ps -aq)
docker rmi $(docker images -q)
docker volume rm $(docker volume ls -q)
docker network rm $(docker network ls -q)
docker builder prune    

docker ps -a        # Verifica containers
docker images       # Verifica imagens
docker volume ls    # Verifica volumes
docker network ls   # Verifica redes

# Estrutura de pastar e arquivos

/Project
│
├── docker-compose.yml
├── Dockerfile
├── apache/
│   ├── web.conf        # Config Servidor
├── bin/
│   ├── start.sh        # Inicia DOCKER
├── database/
│   ├── backup.sql      # Estrutura básica de dados
├── php/
│   ├── php.ini         # Não é necessário
└── src/
    ├── index.php       # Projeto WEB
    └── ...