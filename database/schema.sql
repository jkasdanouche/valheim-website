-- Create database with UTF-8 and Spanish collation
DROP DATABASE IF EXISTS valheim_website;
CREATE DATABASE IF NOT EXISTS valheim_website
  DEFAULT CHARACTER SET utf8mb4
  COLLATE utf8mb4_spanish_ci;

USE valheim_website;

-- Users
CREATE TABLE users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(50) NOT NULL UNIQUE,
  email VARCHAR(150) NOT NULL UNIQUE,
  password_hash VARCHAR(255) NOT NULL,
  role ENUM('user', 'admin', 'moderator') DEFAULT 'user',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- News
CREATE TABLE news (
  id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(150) NOT NULL,
  content TEXT NOT NULL,
  author_id INT NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_news_author FOREIGN KEY (author_id) REFERENCES users(id)
    ON DELETE CASCADE ON UPDATE CASCADE
);

-- News media (images/videos)
CREATE TABLE news_media (
  id INT AUTO_INCREMENT PRIMARY KEY,
  news_id INT NOT NULL,
  media_url TEXT NOT NULL,
  media_type ENUM('image', 'video') NOT NULL,
  CONSTRAINT fk_news_media_news FOREIGN KEY (news_id) REFERENCES news(id)
    ON DELETE CASCADE ON UPDATE CASCADE
);

-- Forum threads
CREATE TABLE forum_threads (
  id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(150) NOT NULL,
  author_id INT NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_thread_author FOREIGN KEY (author_id) REFERENCES users(id)
    ON DELETE CASCADE ON UPDATE CASCADE
);

-- Forum posts (replies)
CREATE TABLE forum_posts (
  id INT AUTO_INCREMENT PRIMARY KEY,
  thread_id INT NOT NULL,
  author_id INT NOT NULL,
  content TEXT NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_post_thread FOREIGN KEY (thread_id) REFERENCES forum_threads(id)
    ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT fk_post_author FOREIGN KEY (author_id) REFERENCES users(id)
    ON DELETE CASCADE ON UPDATE CASCADE
);

-- Wiki pages
CREATE TABLE wiki_pages (
  id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(150) NOT NULL,
  content TEXT NOT NULL,
  author_id INT NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  CONSTRAINT fk_wiki_author FOREIGN KEY (author_id) REFERENCES users(id)
    ON DELETE CASCADE ON UPDATE CASCADE
);

-- Wiki edits history
CREATE TABLE wiki_edits (
  id INT AUTO_INCREMENT PRIMARY KEY,
  page_id INT NOT NULL,
  editor_id INT NOT NULL,
  edit_summary VARCHAR(255),
  content TEXT NOT NULL,
  edited_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_wiki_edit_page FOREIGN KEY (page_id) REFERENCES wiki_pages(id)
    ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT fk_wiki_editor FOREIGN KEY (editor_id) REFERENCES users(id)
    ON DELETE CASCADE ON UPDATE CASCADE
);

-- Wiki media
CREATE TABLE wiki_media (
  id INT AUTO_INCREMENT PRIMARY KEY,
  page_id INT NOT NULL,
  media_url TEXT NOT NULL,
  media_type ENUM('image', 'video') NOT NULL,
  CONSTRAINT fk_wiki_media_page FOREIGN KEY (page_id) REFERENCES wiki_pages(id)
    ON DELETE CASCADE ON UPDATE CASCADE
);

-- Server status
CREATE TABLE server_status (
  id INT AUTO_INCREMENT PRIMARY KEY,
  current_players INT DEFAULT 0,
  max_players INT DEFAULT 0,
  is_online BOOLEAN DEFAULT FALSE,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
