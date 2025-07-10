# 🛡️ Valheim Website

Welcome to the official open-source project for your **Valheim server companion website**, designed to bring the Viking spirit online with a real-time, community-driven experience.

---

## ⚔️ What is this?

A custom web platform built using **Angular 20**, **Node.js (Express)**, **MariaDB**, and **Socket.IO**, styled and themed using **Valheim textures and Norse aesthetics**.

It includes:

- 🔐 Account system (register, login, roles)
- 🌐 Real-time server status (players online, uptime)
- 📰 News system with text, images, and videos
- 🧵 Full forum (threads, replies, moderation)
- 📖 Collaborative wiki for Valheim guides or lore
- 💰 Non-intrusive PayPal donation buttons across the site
- 🧠 Admin panel (future addition)

---

## 🏗️ Project Structure

```
valheim-website/
├── envValheimWebsite/      # nodeenv environment (not committed)
├── backend/                # Express + Socket.IO backend
│   └── src/
│       ├── config/
│       ├── controllers/
│       ├── middleware/
│       ├── models/
│       ├── routes/
│       ├── sockets/
│       ├── utils/
│       └── app.js
├── frontend/               # Angular 20 client
├── database/               # SQL schemas and seeds
└── README.md
```

---

## 🧪 Tech Stack

| Layer         | Technology                     |
|---------------|--------------------------------|
| Frontend      | Angular v20 + ngx-socket-io    |
| Backend       | Node.js + Express              |
| Realtime      | Socket.IO                      |
| Database      | MariaDB                        |
| Styling       | Custom + Valheim theme         |
| Environment   | nodeenv (Python virtual Node.js) |

---

## ⚙️ Getting Started

### 🧭 Requirements

- Node.js with `nodeenv` activated
- MariaDB running locally or remotely
- Git (of course)

### 🚀 Backend Setup

```bash
# Activate your virtual environment
source envValheimWebsite/bin/activate

cd backend/
npm install

# Add your environment variables
cp .env.example .env

# Run the backend
npm run dev
```

### 🎨 Frontend Setup

```bash
cd ../frontend/
npm install
ng serve
```

---

## 💡 Future Features

- 🧭 Admin dashboard with statistics
- 📊 Server history logs and graphs
- 📦 Plugin/addon management (if applicable)
- 🛠️ Panel for moderators

---

## 🧙‍♂️ Inspired by Valheim

This project is lovingly themed around Valheim. All UI elements aim to reflect the Norse-Viking ambiance while remaining accessible and performant.

---

## 🛡 License

This project is under the MIT License. You are free to fork, improve, or adapt as long as you keep the spirit of the project intact.

---

Made by a Viking. For Vikings. ⚔️
