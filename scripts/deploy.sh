#!/bin/bash

# Se placer dans le dossier du dépôt
cd "$(dirname "$0")/.." || exit 1

# Vérifier que Docker est installé
if ! command -v docker >/dev/null 2>&1; then
    echo "Erreur : Docker n'est pas installé."
    exit 1
fi

# Vérifier que curl est installé
if ! command -v curl >/dev/null 2>&1; then
    echo "Erreur : curl n'est pas installé."
    exit 1
fi

# Vérifier que le moteur Docker fonctionne
if ! docker info >/dev/null 2>&1; then
    echo "Erreur : le moteur Docker ne fonctionne pas."
    exit 1
fi

# Récupérer les dernières modifications depuis GitHub
if ! git pull origin main; then
    echo "Erreur : impossible de récupérer les modifications."
    exit 1
fi

# Construire l'image Docker
if ! docker build -t projet-final .; then
    echo "Erreur : échec de la construction de l'image."
    exit 1
fi

# Supprimer l'ancien conteneur s'il existe
docker rm -f site 2>/dev/null || true

# Lancer le nouveau conteneur sur le port 8081
if ! docker run -d --name site -p 8081:80 projet-final; then
    echo "Erreur : impossible de lancer le conteneur."
    exit 1
fi

# Attendre que le site soit disponible
for i in {1..10}; do
    if curl -fsS http://127.0.0.1:8081/ > /dev/null; then
        echo "Déploiement réussi"
        exit 0
    fi

    sleep 2
done

echo "Erreur : le site ne répond pas après plusieurs tentatives."
exit 1
