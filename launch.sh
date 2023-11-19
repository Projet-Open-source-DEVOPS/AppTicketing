#!/bin/bash

# Stop and remove containers along with associated volumes
docker-compose down -v
echo "Arrêt et suppression des conteneurs et volumes Docker"

# Remove unused Docker networks
docker network prune
echo "Suppression des réseaux Docker non utilisés"

# Display a message in the console
echo "Construction des images Docker"

# Rebuild images (if necessary) and start services in the background
docker-compose up -d --build
echo "Démarrage des services Docker en arrière-plan avec construction des images si nécessaire"