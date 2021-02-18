var http = require('http');

var server = http.createServer(function (req, res) {
    if (req.url == "/sensors/temp") {
        res.writeHead(200, { 'Content-Type': 'text/html' });
        res.write('data written');
        res.end();
    }
});

server.listen(8000);

console.log('Node.js web server is running..')