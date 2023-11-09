FROM debian

# Mise à jour et installation des packages
RUN apt update && \
    apt install -y vim && \
    apt install -y git && \
    git clone https://github.com/Projet-Open-source-DEVOPS/AppTicketing.git && \
    apt install -y nginx

# Copier un script de démarrage
COPY start.sh /start.sh

# Donner des droits d'exécution au script
RUN chmod +x /start.sh

# Exécution du script au démarrage du conteneur
CMD ["/start.sh"]