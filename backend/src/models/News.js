const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');
const User = require('./User');


const News = sequelize.define('News', {
    id: {
        type: DataTypes.INTEGER,
        autoIncrement: true,
        primaryKey: true
    },
    title: {
        type: DataTypes.STRING(150),
        allowNull: false
    },
    content: {
        type: DataTypes.TEXT,
        allowNull: false
    },
    author_id: {
        type: DataTypes.INTEGER,
        allowNull: false,
        references: {
            model: User,
            key: 'id'
        },
        onUpdate: 'CASCADE',
        onDelete: 'CASCADE'
    },
    created_at: {
        type: DataTypes.DATE,
        defaultValue: DataTypes.NOW
    }
}, 
{
    tableName: 'news',
    timestamps: false,
    charset: 'utf8mb4',
    collate: 'utf8mb4_spanish_ci'                                                              
});

module.exports = News;