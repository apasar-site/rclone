#!/bin/bash

echo "==== Instalando rclone ===="
curl https://rclone.org/install.sh | sudo bash

echo "==== Verificando se o remote 'onedrive' já está configurado ===="
if grep -q "\[onedrive\]" ~/.config/rclone/rclone.conf 2>/dev/null; then
    echo "Remote 'onedrive' já configurado!"
else
    echo "Remote 'onedrive' NÃO encontrado."
    echo "Iniciando configuração do remote. Siga as instruções do rclone."
    rclone config
fi

echo "==== Copiando arquivo de configuração para /tmp ===="
if [ -f ~/.config/rclone/rclone.conf ]; then
    cp ~/.config/rclone/rclone.conf /tmp/rclone.conf
    chmod 666 /tmp/rclone.conf
    echo "Arquivo de configuração copiado para /tmp/rclone.conf com permissão 666."
else
    echo "Arquivo ~/.config/rclone/rclone.conf não encontrado! Configure o remote primeiro com: rclone config"
    exit 1
fi

echo "==== Pronto! Agora rode seu site normalmente. O PHP já poderá usar o rclone sem problemas de permissão."
