Projet final : Déployer un site web avec GitHub, Linux et Docker

1. Présentation du projet

Ce projet consiste à déployer un site web en utilisant plusieurs outils et technologies : Git, GitHub, Linux et Docker.

L'objectif est de comprendre le processus de développement, de gestion du code source et de déploiement d'un site web dans un environnement conteneurisé.

2. Technologies utilisées

- Linux : environnement de travail.
- Git : gestion des versions du code.
- GitHub : hébergement du projet et collaboration.
- Docker : création et exécution du conteneur.
- PHP / Apache : serveur web utilisé pour héberger le site.

3. Structure du projet

projet-final/
├── scripts/
│   └── deploy.sh
├── site/
│   └── index.html
├── Dockerfile
├── .dockerignore
└── README.md

4. Construction de l'image Docker

docker build -t projet-final .

5. Lancement du conteneur

docker run -d --name site-test -p 8082:80 projet-final

6. Vérification du déploiement

Pour vérifier que le conteneur fonctionne :

docker ps

Ouvrir ensuite le navigateur à l'adresse :

http://localhost:8082

7. Conclusion

Ce projet permet de mettre en pratique les connaissances acquises en Linux, Git, GitHub et Docker, tout en découvrant les bases du déploiement d'un site web.
