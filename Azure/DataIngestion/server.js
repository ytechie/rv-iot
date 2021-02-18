const express = require('express');
const app = express();
const bodyParser = require('body-parser');

app.use(bodyParser.json());

let lastData = '';

app.get('/sensors', (req, res) => res.json(lastData));
app.put('/sensors', (req, res) => {
    console.log(req.body);
    lastData = req.body;
    res.send('data received');
});

app.listen(8000, () => console.log('Node.js web server is running..'));