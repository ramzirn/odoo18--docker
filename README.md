# Odoo 18 Docker

Projet de conteneurisation d'Odoo 18 avec Docker, dans le but de mettre en place progressivement un environnement reproductible et une architecture multi-conteneurs.

## 1. État actuel du projet

Le projet contient actuellement :

- Une image Docker personnalisée d'Odoo 18.
- Python 3.12 comme environnement d'exécution.
- Les dépendances système nécessaires à la compilation de certains packages Python.
- Les dépendances Python d'Odoo installées depuis `requirements.txt`.
- Le code source d'Odoo 18 et ses addons.

**PostgreSQL n'est pas encore intégré à l'architecture Docker.**

## 2. Technologies utilisées

- Docker
- Python 3.12
- Odoo 18
- Linux
- Git et GitHub

## 3. Structure du projet

```text
odoo18-docker/
├── Dockerfile
├── .dockerignore
├── .gitignore
├── requirements.txt
├── setup.py
├── odoo-bin
├── odoo/
└── addons/
```

## 4. Construire l'image Docker

Depuis la racine du projet :

```bash
docker build -t odoo18-custom:1.0 .
```

Cette commande construit une image Docker personnalisée à partir du Dockerfile.

## 5. Lancer un conteneur Odoo

```bash
docker run -d \
  --name odoo18-test \
  -p 8070:8069 \
  odoo18-custom:1.0
```

L'application utilise le port 8069 à l'intérieur du conteneur, exposé sur le port 8070 de la machine hôte.

Accès local :

```text
http://localhost:8070
```

Cette étape valide le lancement du conteneur. Une base PostgreSQL accessible et correctement configurée reste nécessaire pour disposer d'une instance Odoo pleinement fonctionnelle.

## 6. Gestion du conteneur

Consulter les conteneurs actifs :

```bash
docker ps
```

Consulter les logs :

```bash
docker logs -f odoo18-test
```

Arrêter Odoo :

```bash
docker stop odoo18-test
```

Redémarrer Odoo :

```bash
docker start odoo18-test
```

## 7. Perspectives d'évolution

### Étape 1 — Intégration de PostgreSQL
- Télécharger l'image officielle PostgreSQL.
- Tester son fonctionnement dans un conteneur indépendant.
- Configurer les identifiants et la base de données.

### Étape 2 — Docker Compose
- Ajouter un fichier `compose.yaml`.
- Orchestrer les services Odoo et PostgreSQL.
- Configurer leur réseau interne.
- Ajouter un volume Docker pour la persistance des données.

### Étape 3 — Amélioration de l'environnement
- Externaliser la configuration.
- Utiliser des variables d'environnement.
- Ajouter des healthchecks.
- Organiser les addons personnalisés.
- Améliorer la gestion des logs.

### Étape 4 — CI/CD
- Mettre en place une pipeline avec GitHub Actions.
- Automatiser la construction de l'image.
- Ajouter des vérifications et tests.
- Publier l'image dans un registre Docker.

### Étape 5 — Déploiement
- Préparer un environnement de déploiement.
- Automatiser le déploiement chez un client.
- Étudier la sauvegarde et la restauration des bases de données.

---

## Objectif final

Disposer d'un environnement Odoo 18 conteneurisé, reproductible, documenté et facilement déployable, avec une architecture séparant l'application et sa base de données.