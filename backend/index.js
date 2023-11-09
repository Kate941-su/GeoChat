const express = require("express");
const { createServer } = require("http");
const { Server } = require("socket.io");

const app = express();
const  httpServer = createServer(app);
const io = new Server(httpServer);

app.route("/").get((req, res)=>{
    res.json("Hey thre welcome again on dev stack channel !!")
});

io.on("connection", (socket) => {
    // ...
});


httpServer.listen(3000)