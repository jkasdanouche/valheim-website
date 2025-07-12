const sequelize = require('../config/database');

async function connectDb() {
    try{
        await sequelize.authenticate();
        console.log('✅ MariaDB connection established successfully.');
    } catch (error) {
        console.error('❌ Unable to connect to the database:', error.message);
    }
}

module.exports = { sequelize, connectDb };