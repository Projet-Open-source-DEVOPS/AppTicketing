#!/bin/bash
docker-compose down -v
docker rm appticketing-web-1
docker rm my-phpmyadmin
docker rm my-mysql
echo "build du docker"
docker-compose up -d --build
