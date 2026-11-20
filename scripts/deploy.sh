#!/bin/bash

# Se placer dans le dossier du dépôt
cd "$(dirname "$0")/.." || exit 1

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

# Vérifier que le site répond avec curl
if curl -fsS http://localhost:8081 > /dev/null; then
    echo "Déploiement réussi"
else
    echo "Erreur : le site ne répond pas."
    exit 1
fi
# Vérifier la disponibilité de Docker
if ! command -v docker >/dev/null 2>&1; then
    echo "Erreur : Docker n'est pas installé."
    exit 1
fi

# Vérifier la disponibilité de curl
if ! command -v curl >/dev/null 2>&1; then
    echo "Erreur : curl n'est pas installé."
    exit 1
fi

# Vérifier que le moteur Docker fonctionne
if ! docker info >/dev/null 2>&1; then
    echo "Erreur : le moteur Docker ne fonctionne pas."
    exit 1
fi
