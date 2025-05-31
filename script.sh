#!/bin/bash"
echo "Criando as imagens....."

docker build -t danilojstecnologia/projeto-backend:1.0 backend/.
docker build -t danilojstecnologia/projeto-database:1.0 database/.

echo "Realizando push das imagens...."

docker push danilojstecnologia/projeto-backend:1.0
docker push danilojstecnologia/projeto-database:1.0 

echo "Criano serviços no cluster kubernets..."

kubectl apply -f ./services.yml

echo "Criando os deployments..."

kubectl apply -f ./deployment.yml