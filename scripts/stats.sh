#!/bin/bash

# Afficher les statistiques du conteneur Docker

CONTAINER="site-test"

if ! docker ps --format '{{.Names}}' | grep -q "^${CONTAINER}$"; then
    echo "Erreur : le conteneur $CONTAINER n'est pas actif."
    exit 1
fi

echo "Statistiques du conteneur : $CONTAINER"

docker stats "$CONTAINER" --no-stream
