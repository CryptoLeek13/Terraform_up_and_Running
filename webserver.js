// Import the http module for basic webserver
const http = require("http");

// Create the actual webserver
const server = http.createServer((req, res) => {
    // Send the response
    res.write("Welcome to my test server!");
    res.end();
})

// Point sever to port 3000
server.listen((3000), () => {
    console.log("Server is Running");
})