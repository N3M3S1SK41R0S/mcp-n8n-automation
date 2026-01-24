const express = require('express');
const cors = require('cors');
const axios = require('axios');

const app = express();
const PORT = process.env.BRIDGE_PORT || 3001;
const N8N_URL = process.env.N8N_URL || 'http://localhost:5678';

app.use(cors());
app.use(express.json());

app.get('/health', (req, res) => {
    res.json({ status: 'ok', service: 'MCP-N8N Bridge' });
});

app.get('/api/workflows', async (req, res) => {
    try {
          const response = await axios.get(`${N8N_URL}/api/v1/workflows`);
          res.json(response.data);
    } catch (error) {
          res.status(500).json({ error: error.message });
    }
});

app.post('/api/workflows/:id/execute', async (req, res) => {
    try {
          const response = await axios.post(
                  `${N8N_URL}/api/v1/workflows/${req.params.id}/execute`,
                  req.body
                );
          res.json(response.data);
    } catch (error) {
          res.status(500).json({ error: error.message });
    }
});

app.listen(PORT, () => console.log(`Bridge running on ${PORT}`));
