const express = require('express');
const app = express();
const PORT = 3000;

app.use(express.json());

const users = {};
const players = {};

app.post('/api/auth/register', (req, res) => {
    const { username, password } = req.body;
    if (users[username]) {
        return res.status(400).json({ error: 'User already exists' });
    }
    users[username] = { password, id: Object.keys(users).length + 1 };
    res.json({ success: true, userId: users[username].id });
});

app.post('/api/auth/login', (req, res) => {
    const { username, password } = req.body;
    const user = users[username];
    if (!user || user.password !== password) {
        return res.status(401).json({ error: 'Invalid credentials' });
    }
    res.json({ success: true, userId: user.id, username });
});

app.post('/api/players/update-position', (req, res) => {
    const { userId, x, y, z } = req.body;
    players[userId] = { x, y, z, timestamp: Date.now() };
    res.json({ success: true });
});

app.get('/api/players/all', (req, res) => {
    res.json({ players });
});

app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
});
