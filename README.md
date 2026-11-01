# 🚀 MCP + N8N Automation Infrastructure

Infrastructure complète d'automatisation combinant **Model Context Protocol (MCP)** et **N8N** avec Docker pour créer des workflows d'automatisation puissants accessibles via API.

## 📋 Table des Matières

- [Vue d'ensemble](#vue-densemble)
- - [Fonctionnalités](#fonctionnalités)
  - - [Prérequis](#prérequis)
    - - [Installation Rapide](#installation-rapide)
      - - [Configuration MCP](#configuration-mcp)
        - - [Utilisation de N8N](#utilisation-de-n8n)
          - - [Architecture](#architecture)
            - - [Exemples de Workflows](#exemples-de-workflows)
              - - [API Endpoints](#api-endpoints)
               
                - ## 🎯 Vue d'ensemble
               
                - Ce projet fournit une infrastructure prête à l'emploi pour:
                - - **Serveurs MCP** multiples (GitHub, Filesystem, Brave Search, PostgreSQL, Memory)
                  - - **N8N** pour l'automatisation de workflows
                    - - **Docker** pour un déploiement simple et isolé
                      - - **PostgreSQL** pour le stockage persistant
                       
                        - ## ✨ Fonctionnalités
                       
                        - - 🔌 **MCP Servers intégrés**
                          -   - GitHub: Interagir avec les repositories
                              -   - Filesystem: Accès aux fichiers locaux
                                  -   - Brave Search: Recherche web
                                      -   - PostgreSQL: Base de données
                                          -   - Memory: Stockage en mémoire
                                           
                                              - - 🔄 **N8N Automation**
                                                -   - Interface visuelle pour créer des workflows
                                                    -   - Webhooks pour déclencher des actions
                                                        -   - Intégration avec 300+ services
                                                            -   - API REST complète
                                                             
                                                                - - 🐳 **Docker Ready**
                                                                  -   - Configuration docker-compose incluse
                                                                      -   - Volumes persistants
                                                                          -   - Network isolé
                                                                           
                                                                              - ## 📦 Prérequis
                                                                           
                                                                              - - Docker & Docker Compose
                                                                                - - Node.js 18+ (pour MCP localement)
                                                                                  - - Git
                                                                                   
                                                                                    - ## 🚀 Installation Rapide
                                                                                   
                                                                                    - ```bash
                                                                                      # 1. Cloner le repository
                                                                                      git clone https://github.com/N3M3S1SK41R0S/mcp-n8n-automation.git
                                                                                      cd mcp-n8n-automation

                                                                                      # 1b. Secrets : les secrets ne se commitent pas : copier .env.example en .env
                                                                                      #     (fichier exemple actuellement nommé ".env.exampleé" dans le dépôt) puis renseigner les valeurs
                                                                                      cp ".env.exampleé" .env

                                                                                      # 2. Lancer les services
                                                                                      docker-compose up -d

                                                                                      # 3. Accéder à N8N
                                                                                      open http://localhost:5678
                                                                                      # Login: admin / (mot de passe : N8N_BASIC_AUTH_PASSWORD défini dans .env)
                                                                                      ```

                                                                                      ## ⚙️ Configuration MCP

                                                                                      ### Configuration Claude Desktop

                                                                                      Copiez la configuration dans `~/Library/Application Support/Claude/claude_desktop_config.json`:

                                                                                      ```json
                                                                                      {
                                                                                        "mcpServers": {
                                                                                          "github": {
                                                                                            "command": "npx",
                                                                                            "args": ["-y", "@modelcontextprotocol/server-github"],
                                                                                            "env": {
                                                                                              "GITHUB_PERSONAL_ACCESS_TOKEN": "ghp_votre_token"
                                                                                            }
                                                                                          },
                                                                                          "filesystem": {
                                                                                            "command": "npx",
                                                                                            "args": ["-y", "@modelcontextprotocol/server-filesystem", "/workspace"]
                                                                                          }
                                                                                        }
                                                                                      }
                                                                                      ```

                                                                                      ### Tokens et API Keys nécessaires

                                                                                      1. **GitHub Token**: https://github.com/settings/tokens
                                                                                      2. 2. **Brave API Key**: https://brave.com/search/api/
                                                                                        
                                                                                         3. ## 🎨 Utilisation de N8N
                                                                                        
                                                                                         4. ### Accès Web
                                                                                        
                                                                                         5. ```
                                                                                            URL: http://localhost:5678
                                                                                            Username: admin
                                                                                            Password: CHANGE_ME (défini dans .env : N8N_BASIC_AUTH_PASSWORD)
                                                                                            ```

                                                                                            ### Créer un Workflow Simple

                                                                                            1. Ouvrir N8N dans le navigateur
                                                                                            2. 2. Cliquer sur "New Workflow"
                                                                                               3. 3. Ajouter un nœud "Webhook"
                                                                                                  4. 4. Configurer l'URL du webhook
                                                                                                     5. 5. Ajouter des nœuds pour vos actions
                                                                                                        6. 6. Activer le workflow
                                                                                                          
                                                                                                           7. ### Exemple de Webhook
                                                                                                          
                                                                                                           8. ```bash
                                                                                                              curl -X POST http://localhost:5678/webhook/test \
                                                                                                                -H "Content-Type: application/json" \
                                                                                                                -d '{"message": "Hello from automation"}'
                                                                                                              ```
                                                                                                              
                                                                                                              ## 🏗️ Architecture
                                                                                                              
                                                                                                              ```
                                                                                                              mcp-n8n-automation/
                                                                                                              ├── docker-compose.yml          # Configuration Docker
                                                                                                              ├── mcp-servers/
                                                                                                              │   └── github-mcp.json        # Configuration MCP
                                                                                                              ├── workflows/                  # Workflows N8N sauvegardés
                                                                                                              ├── credentials/                # Credentials N8N
                                                                                                              └── README.md
                                                                                                              ```
                                                                                                              
                                                                                                              ### Services
                                                                                                              
                                                                                                              - **N8N**: Port 5678
                                                                                                              - - **PostgreSQL**: Port 5432 (interne)
                                                                                                               
                                                                                                                - ## 📝 Exemples de Workflows
                                                                                                               
                                                                                                                - ### 1. Automatisation GitHub
                                                                                                               
                                                                                                                - ```
                                                                                                                  Webhook → GitHub Create Issue → Slack Notification
                                                                                                                  ```
                                                                                                                  
                                                                                                                  ### 2. Surveillance de fichiers
                                                                                                                  
                                                                                                                  ```
                                                                                                                  File Trigger → Process Data → Save to Database
                                                                                                                  ```
                                                                                                                  
                                                                                                                  ### 3. Recherche et notification
                                                                                                                  
                                                                                                                  ```
                                                                                                                  Schedule → Brave Search → Filter Results → Email
                                                                                                                  ```
                                                                                                                  
                                                                                                                  ## 🔗 API Endpoints
                                                                                                                  
                                                                                                                  ### N8N API
                                                                                                                  
                                                                                                                  ```bash
                                                                                                                  # Obtenir tous les workflows
                                                                                                                  GET http://localhost:5678/api/v1/workflows

                                                                                                                  # Exécuter un workflow
                                                                                                                  POST http://localhost:5678/api/v1/workflows/:id/execute

                                                                                                                  # Créer un workflow
                                                                                                                  POST http://localhost:5678/api/v1/workflows
                                                                                                                  ```
                                                                                                                  
                                                                                                                  ### Webhooks
                                                                                                                  
                                                                                                                  ```bash
                                                                                                                  # Webhook personnalisé
                                                                                                                  POST http://localhost:5678/webhook/:path
                                                                                                                  ```
                                                                                                                  
                                                                                                                  ## 🔒 Sécurité
                                                                                                                  
                                                                                                                  ⚠️ **Important**: Changez les mots de passe par défaut!
                                                                                                                  
                                                                                                                  ```yaml
                                                                                                                  # Dans docker-compose.yml
                                                                                                                  environment:
                                                                                                                    - N8N_BASIC_AUTH_PASSWORD=VotreMotDePasseSecurise
                                                                                                                    - POSTGRES_PASSWORD=VotreMotDePasseDB
                                                                                                                  ```
                                                                                                                  
                                                                                                                  ## 🛠️ Commandes Utiles
                                                                                                                  
                                                                                                                  ```bash
                                                                                                                  # Démarrer les services
                                                                                                                  docker-compose up -d

                                                                                                                  # Voir les logs
                                                                                                                  docker-compose logs -f n8n

                                                                                                                  # Arrêter les services
                                                                                                                  docker-compose down

                                                                                                                  # Sauvegarder les données
                                                                                                                  docker-compose exec postgres pg_dump -U n8n > backup.sql

                                                                                                                  # Nettoyer et redémarrer
                                                                                                                  docker-compose down -v && docker-compose up -d
                                                                                                                  ```
                                                                                                                  
                                                                                                                  ## 📚 Ressources
                                                                                                                  
                                                                                                                  - [Documentation MCP](https://modelcontextprotocol.io)
                                                                                                                  - - [Documentation N8N](https://docs.n8n.io)
                                                                                                                    - - [Intégrations N8N](https://n8n.io/integrations)
                                                                                                                      - - [Docker Compose](https://docs.docker.com/compose/)
                                                                                                                       
                                                                                                                        - ## 🤝 Contribution
                                                                                                                        - 
                                                                                                                        Les contributions sont les bienvenues! N'hésitez pas à:
- Ouvrir des issues
- - Proposer des pull requests
- Partager vos workflows

- ## 📄 Licence

- MIT License - voir le fichier [LICENSE](LICENSE)

- ---

**Créé avec ❤️ pour automatiser tout ce qui peut l'être!**

## 🔐 Secrets

Les secrets ne se commitent pas : copier `.env.example` en `.env` (fichier exemple actuellement nommé `.env.exampleé` dans le dépôt), puis y renseigner les valeurs. Le fichier `.env` est ignoré par Git (voir `.gitignore`).
