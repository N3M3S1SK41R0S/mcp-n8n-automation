# Integration Bolt avec MCP+N8N

## Installation rapide

1. Cloner ce repo
2. 2. Lancer: docker-compose up -d
   3. 3. cd bolt-integration && npm install
      4. 4. node api-bridge.js
        
         5. ## API Endpoints
        
         6. - GET /health - Status
            - - GET /api/workflows - Liste workflows
              - - POST /api/workflows/:id/execute - Execute workflow
               
                - ## Configuration Bolt
               
                - ```javascript
                  const API = 'http://localhost:3001';
                  fetch(`${API}/api/workflows`).then(r => r.json());
                  ```

                  Repository: https://github.com/N3M3S1SK41R0S/mcp-n8n-automation
