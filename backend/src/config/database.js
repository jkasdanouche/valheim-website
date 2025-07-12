require('dotenv').config();
const { Sequelize } = require('sequelize');

const sequelize = new Sequelize(
    process.env.DB_NAME,
    process.env.DB_USER,
    process.env.DB_PASS,
    {
        host: process.env.DB_HOST,
        post: process.env.DB_PORT,
        dialect: 'mariadb',
        logging: false,
        define: {
            charset: 'utf8mb4',
            collate: 'utf8mb4_spanish_ci',
            timestamp: false
        }
    }
);

module.exports = sequelize;