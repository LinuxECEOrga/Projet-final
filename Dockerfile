# Utiliser l'image officielle PHP avec Apache
FROM php:8.4-apache
# Copier les fichiers du site dans le répertoire racine du serveur Apache
COPY site/ /var/www/html/
# Documenter le port HTTP utilisé par Apache
EXPOSE 80
