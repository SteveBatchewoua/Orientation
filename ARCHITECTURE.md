---
### 2. Diagramme d'Architecture (Conceptuel)

Voici une représentation visuelle de ton flux de données:

1.  **Client (Navigateur)**: L'utilisateur interagit avec l'UI Angular sur le port **4200**.
2.  **API Gateway (Docker)**: Les requêtes HTTP sont envoyées au conteneur `estm-api` sur le port **5000**.
3.  **Data Layer**: L'API interroge le conteneur `estm-postgres` (port **5432**) via le réseau interne Docker.
4.  **Initialisation**: Au premier démarrage, le volume Docker injecte `init.sql` pour charger les 15 métiers de l'ESTM.
---

### 3. Fichier de Configuration Architecture (`architecture.drawio` ou `.txt`)

Il est souvent utile de garder un fichier `ARCHITECTURE.md` pour les futurs développeurs :

```markdown
# Spécifications de l'Architecture

## Modèle de Données (PostgreSQL)

La table `DiscoveryItems` utilise une architecture de "Données Discriminées" :

- `Type = 0` : Représente un **Métier**.
- `Type = 1` : Représente une **Formation**.

## Stratégie de Communication

- L'API utilise `System.Text.Json` pour la sérialisation.
- Le Frontend utilise les **Angular Signals** (`computed`) pour filtrer les données en mémoire après le premier chargement, offrant une latence de 0ms à l'utilisateur.

## Sécurité & CORS

Le backend est configuré pour accepter les requêtes du domaine `localhost:4200` uniquement en production, et `*` en développement.
```
