require('dotenv').config();
const express = require('express');
const http = require('http');
const cors = require('cors');
const { Server } = require('socket.io')

const app = express();
const server = http.createServer(app);
const io = new Server(server, {
    cors: { origin: '*' }
});
const { connectDb } = require('./models');
connectDb();

//Middleware
app.use(cors());
app.use(express.json());

//Routes
app.use('/api/hello', (_, res) => res.json({message: 'Backend Running.'}));

//Sockets
io.on('connection', (socket) => {
    console.log('🔌 New client connected:', socket.id);

    socket.on('disconnect', () => {
        console.log('❌ Client disconnected:', socket.id);
    });
});

//Start
const PORT = process.env.PORT || 3000;
server.listen(PORT, () => {
    console.log('🚀 Server listening on port ', `${PORT}`);
});