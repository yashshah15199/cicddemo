const express = require('express');
const app = express();

// Render overrides this value automatically
const PORT = process.env.PORT || 3000; 

app.get('/health', (req, res) => {
  res.status(200).json({ status: 'UP' });
});

// Bind to 0.0.0.0 so the containerized process can receive external traffic
app.listen(PORT, '0.0.0.0', () => {
  console.log(`Dockerized Express app running on port ${PORT}`);
});