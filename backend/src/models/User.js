const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');

const User = sequelize.define('User', {
    id: {
        type: DataTypes.INTEGER,
        autoIncrement: true,
        primaryKey: true
    },
    username: {
        type: DataTypes.STRING(50),
        allowNull: false,
        unique:true
    },
    email: {
        type: DataTypes.STRING(150),
        allowNull: false,
        unique: true
    },
    password_hash: {
        type: DataTypes.STRING(255),
        allowNull: false
    },
    role: {
        type: DataTypes.ENUM('user', 'admin', 'moderator'),
        defaultValue: 'user'
    },
    created_at: {
        type: DataTypes.DATE,
        defaultValue: DataTypes.NOW
    }
}, 
{
    tableName: 'users',
    timestamps: false,
    charset: 'utf8mb4',
    collate: 'utf8mb4_spanish_ci'
});

module.exports = User;