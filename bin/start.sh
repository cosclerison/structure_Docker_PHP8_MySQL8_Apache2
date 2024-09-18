#!/bin/bash

echo "Iniciando o ambiente Docker..."

# Navega para o diretório onde está o docker-compose.yml
cd "$(dirname "$0")/.."

# Subir os serviços definidos no docker-compose.yml
docker-compose up --build -d

# Verifica se o Docker Compose foi bem-sucedido
if [ $? -eq 0 ]; then
    echo "Serviços Docker iniciados com sucesso!"
else
    echo "Falha ao iniciar os serviços Docker."
    exit 1
fi
