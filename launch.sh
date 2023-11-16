#!/bin/bash
docker-compose down -v
docker rm appticketing-web
docker rm my-phpmyadmin
docker rm my-mysql
echo "build du docker"
docker-compose up -d --build
echo "migration des données de la db vers mysql.."

OUTPUT=$(cat hesk/dump/dump_hesk_inital.sql | docker exec -i my-mysql mysql -u admin --password=admin hesk 2>&1 )


echo $OUTPUT

while [[ $OUTPUT != "" ]]
do
echo "Tentative de migrations des données vers mysql.."
OUTPUT=$(cat hesk/dump/dump_hesk_inital.sql | docker exec -i -e "statement" my-mysql mysql -u admin --host=127.0.0.1 --password=admin hesk 2>&1 | grep -v "Warning" )
sleep 2
done
echo "Migrations terminées."