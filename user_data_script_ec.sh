#!/bin/bash

# Atualização do sistema
echo "Atualizando o sistema..."
sudo yum update -y 

# Instalação do Nginx
echo "Instalando o Nginx"
sudo yum install nginx -y

# Instalação do Git
echo "Instalando o Git"
sudo yum install git -y

# Iniciando o Serviço do nginx e Habilitando
echo "Iniciando o Nginx"
sudo systemctl start nginx.service
echo "Habilitando o Nginx"
sudo systemctl enable nginx.service

# Clonando o repositório
echo "Clonando repositorio do Git"
git clone https://github.com/Neto6391/so_linux_ada_mod01.git

# removendo arquivos padrões
echo "Removendo arquivos padrões do nginx"
sudo rm -rf /usr/share/nginx/html/*

# Criando pasta se não existir
echo "Verificando e criando pasta se necessário"
sudo mkdir -p /usr/share/nginx/html

# Copiando arquivos de um diretório para outro
sudo cp -r so_linux_ada_mod01/html/* /usr/share/nginx/html/

# reeniciando o serviço do nginx
echo "reeniciando o serviço do Nginx"
sudo systemctl restart nginx.service

# mensagem de finalização do script
echo "Nginx configurado!"
