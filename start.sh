#!/bin/bash

# 🚀 Script de démarrage rapide pour MCP + N8N Automation
# Ce script configure et lance l'infrastructure complète

set -e

echo "🚀 Démarrage de l'infrastructure MCP + N8N..."
echo ""

# Vérifier que Docker est installé
if ! command -v docker &> /dev/null; then
    echo "❌ Docker n'est pas installé. Veuillez l'installer d'abord."
        echo "   👉 https://docs.docker.com/get-docker/"
            exit 1
            fi

            if ! command -v docker-compose &> /dev/null; then
                echo "❌ Docker Compose n'est pas installé."
                    exit 1
                    fi

                    echo "✅ Docker et Docker Compose détectés"
                    echo ""

                    # Créer les dossiers nécessaires
                    echo "📁 Création des dossiers..."
                    mkdir -p workflows credentials

                    # Lancer les services
                    echo "🐳 Lancement des conteneurs Docker..."
                    docker-compose up -d

                    echo ""
                    echo "⏳ Attente du démarrage de N8N..."
                    sleep 10

                    # Vérifier que N8N est accessible
                    if curl -s http://localhost:5678 > /dev/null; then
                        echo "✅ N8N est prêt!"
                            echo ""
                                echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
                                    echo "🎉 Installation terminée avec succès!"
                                        echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
                                            echo ""
                                                echo "📊 Accès N8N:"
                                                    echo "   URL: http://localhost:5678"
                                                        echo "   👤 Username: admin"
                                                            echo "   🔑 Password: changeme123"
                                                                echo ""
                                                                    echo "📚 Commandes utiles:"
                                                                        echo "   • Voir les logs: docker-compose logs -f"
                                                                            echo "   • Arrêter: docker-compose down"
                                                                                echo "   • Redémarrer: docker-compose restart"
                                                                                    echo ""
                                                                                        echo "🔗 Repository: https://github.com/N3M3S1SK41R0S/mcp-n8n-automation"
                                                                                            echo ""
                                                                                            else
                                                                                                echo "⚠️  N8N n'est pas encore accessible."
                                                                                                    echo "   Vérifiez les logs: docker-compose logs n8n"
                                                                                                    fi
