const express = require('express');

const app = express();
const PORT = process.env.PORT || 3000;

app.use(express.json());

app.get('/', (req, res) => {
  res.json({ message: 'Hello from Node.js!', timestamp: new Date().toISOString() });
});

app.get('/health', (req, res) => {
  res.json({ status: 'ok' });
});

app.get('/mypage', (req, res) => {
	res.writeHead(200, { 'Content-Type': 'text/html' });
	res.end('<h1>Welcome to My Page!</h1>');
});

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
