# Utiliser l'image Debian
FROM debian

# Mise à jour et installation des packages
RUN apt update && \
    apt install -y vim git nginx
    
# Copier le contenu du dépôt GitHub dans le répertoire /var/www/html
ADD https://github.com/Projet-Open-source-DEVOPS/AppTicketing/archive/main.tar.gz /var/www/html/

# Décompresser le fichier tar.gz
RUN tar -xzvf /var/www/html/main.tar.gz -C /var/www/html/ --strip-components=1 && \
    rm /var/www/html/main.tar.gz

# Copier un script de démarrage
COPY start.sh /start.sh

# Donner des droits d'exécution au script
RUN chmod +x /start.sh

# Exposition du port 80 pour Nginx
EXPOSE 80

# Commande par défaut pour démarrer le conteneur
CMD ["/start.sh"]