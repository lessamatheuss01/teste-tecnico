#!/bin/bash

# Verificando o Docker está instalado
if ! command -v docker &> /dev/null
then
    echo "Docker não está instalado."
    exit 1
fi

VOLUME_NAME="meu_volume"
BACKUP_FILE="backup_$(date +%F).tar.gz"
REMOTE_USER="backup"
REMOTE_HOST="192.168.0.100"
REMOTE_PATH="/home/backup"

# Criar backup do volume
docker run --rm -v ${VOLUME_NAME}:/volume -v $(pwd):/backup busybox \
    tar czf /backup/${BACKUP_FILE} -C /volume .

if [ $? -ne 0 ]; then
    echo "Erro ao criar backup."
    exit 1
fi

# Enviando o backup via scp
scp ${BACKUP_FILE} ${REMOTE_USER}@${REMOTE_HOST}:${REMOTE_PATH}

if [ $? -eq 0 ]; then
    echo "Backup enviado com sucesso."
    rm ${BACKUP_FILE}
else
    echo "Falha ao enviar backup."
fi
