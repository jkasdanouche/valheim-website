-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS valheim_website CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE valheim_website;

-- Tabla de usuarios
CREATE TABLE users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(32) NOT NULL UNIQUE,
  email VARCHAR(128) NOT NULL UNIQUE,
  password_hash VARCHAR(255) NOT NULL,
  role ENUM('user', 'admin', 'moderator') DEFAULT 'user',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Noticias
CREATE TABLE news (
  id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  content TEXT NOT NULL,
  author_id INT NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (author_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Multimedia de noticias (imágenes, videos)
CREATE TABLE news_media (
  id INT AUTO_INCREMENT PRIMARY KEY,
  news_id INT NOT NULL,
  media_url TEXT NOT NULL,
  media_type ENUM('image', 'video') NOT NULL,
  FOREIGN KEY (news_id) REFERENCES news(id) ON DELETE CASCADE
);

-- Foros: hilos
CREATE TABLE forum_threads (
  id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  category VARCHAR(64),
  creator_id INT NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (creator_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Foros: respuestas
CREATE TABLE forum_posts (
  id INT AUTO_INCREMENT PRIMARY KEY,
  thread_id INT NOT NULL,
  author_id INT NOT NULL,
  content TEXT NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (thread_id) REFERENCES forum_threads(id) ON DELETE CASCADE,
  FOREIGN KEY (author_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Wiki: páginas
CREATE TABLE wiki_pages (
  id INT AUTO_INCREMENT PRIMARY KEY,
  slug VARCHAR(128) NOT NULL UNIQUE,
  title VARCHAR(255) NOT NULL,
  content TEXT NOT NULL,
  creator_id INT NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (creator_id) REFERENCES users(id) ON DELETE SET NULL
);

-- Multimedia para páginas wiki (imágenes o videos)
CREATE TABLE wiki_media (
  id INT AUTO_INCREMENT PRIMARY KEY,
  page_id INT NOT NULL,
  media_url TEXT NOT NULL,
  media_type ENUM('image', 'video') NOT NULL,
  FOREIGN KEY (page_id) REFERENCES wiki_pages(id) ON DELETE CASCADE
);

-- Wiki: historial de ediciones
CREATE TABLE wiki_edits (
  id INT AUTO_INCREMENT PRIMARY KEY,
  page_id INT NOT NULL,
  editor_id INT NOT NULL,
  old_content TEXT,
  new_content TEXT,
  edited_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (page_id) REFERENCES wiki_pages(id) ON DELETE CASCADE,
  FOREIGN KEY (editor_id) REFERENCES users(id) ON DELETE SET NULL
);

-- Estado del servidor (último registro)
CREATE TABLE server_status (
  id INT AUTO_INCREMENT PRIMARY KEY,
  online BOOLEAN DEFAULT FALSE,
  player_count INT DEFAULT 0,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);