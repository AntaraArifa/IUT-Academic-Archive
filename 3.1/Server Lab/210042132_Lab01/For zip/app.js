const express = require('express');
express.static ('D:\3.1\Server Lab\210042132_Lab01\image')
const path = require('path');
const app = express();

app.use(express.static('image'));

app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, 'index.html'));
});

app.get('/MangaList', (req, res) => {
    res.sendFile(path.join(__dirname, 'MangaList.html'));
});

app.get('/AnimeList', (req, res) => {
    res.sendFile(path.join(__dirname, 'AnimeList.html'));
});

const port = 3000;
app.listen(port, () => {
    console.log(`App is listening on port ${port}`);
});
