# Utiliser l'image officielle PHP avec Apache
FROM php:8.4-apache
# Copier uniquement le site dans le dossier public d'Apache
COPY site/ /var/www/html/
