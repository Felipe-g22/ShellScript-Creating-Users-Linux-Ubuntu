#!/bin/bash

echo "Criando diretórios..."

mkdir /publico
mkdir /adm
mkdir /ven
mkdir /sec

echo "Criando grupo para usuários..."

groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC

echo "Criando usuários..."

useradd carlos -c "Carlos" -s /bin/bash -m -p $(openssl passwd 123) -G GRP_ADM
useradd maria -c "Maria" -s /bin/bash -m -p $(openssl passwd 123) -G GRP_VEN
useradd joao -c "João" -s /bin/bash -m -p $(openssl passwd 123) -G GRP_SEC

echo "Especificando as permissões dos diretórios..."

chown root:GRP_ADM /adm
chown root:GRP_VEN /ven
chown root:GRP_SEC /sec

chmod 770 /adm
chmod 770 /ven
chmod 770 /sec
chmod 777 /publico

echo "finalizado!"
