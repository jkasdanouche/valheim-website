# 🛡️ Valheim Community Portal

**Bienvenido, vikingo.** Este es el portal oficial de la comunidad de tu servidor Valheim, donde se forjan historias, se comparten conocimientos y se une la hermandad vikinga.

Un sistema completo que incluye:
- 📰 Noticias del servidor (texto, imágenes y videos)
- 🧠 Wiki colaborativa
- 🛡️ Foro de discusión
- 🔥 Sistema de cuentas de usuario
- ⚔️ Integración en tiempo real con el servidor mediante **Socket.IO**
- 💰 Botones de donación discretos pero visibles (PayPal)
- 🌐 Página web desarrollada en **Angular 20** con backend en **Node.js**

> _"Levanta tu hacha, construye tu asentamiento y deja tu legado."_

---

## 🧭 Estructura del Proyecto

```
valheim-website/
├── frontend/     # Aplicación Angular 20 (interfaz web)
├── backend/      # Node.js + Socket.IO (servidor)
├── database/     # Scripts SQL y backups para MariaDB
├── README.md
├── .gitignore
└── LICENSE
```

---

## ⚙️ Requisitos

- **Node.js** 20+
- **Angular CLI** 20+
- **MariaDB** 10.6+
- Git, npm

---

## 🛠️ Instalación rápida

### 🔮 Clonar el repositorio

```bash
git clone https://github.com/TU-USUARIO/valheim-website.git
cd valheim-website
```

### 🚀 Levantar el frontend

```bash
cd frontend
npm install
ng serve
```

La página estará disponible en `http://localhost:4200`

### 🔧 Levantar el backend

```bash
cd ../backend
npm install
node server.js
```

El servidor escuchará en `http://localhost:3000` (o el puerto que definas)

### 🗄️ Base de datos

Importa el archivo SQL:

```bash
mysql -u root -p valheim_db < database/init.sql
```

> Asegúrate de tener creada la base de datos `valheim_db` antes de importar.

---

## 🔌 Tiempo real con Socket.IO

Usamos **Socket.IO** en el backend, y en el frontend se comunica a través de `ngx-socket-io` para notificaciones en tiempo real, actualizaciones de estado del servidor, y más.

---

## 🧠 Wiki, Foro y Noticias

El frontend incluye:
- Sistema de publicación (admins y mods)
- Wiki colaborativa con edición en tiempo real
- Foro estilo clásico con categorías, hilos, y respuestas

Todo gestionado desde el backend con API segura.

---

## 🧭 Donaciones

En cada sección hay botones para **donar vía PayPal** que se integran sin molestar al usuario, pero visibles para quien quiera apoyar el servidor.

---

## 🔐 Seguridad y despliegue

- JWT para autenticación
- Roles y permisos
- Preparado para despliegue con Docker (en desarrollo)
- Posible integración futura con Steam o Discord

---

## ⚔️ Contribuir

¡Se aceptan pull requests de todo vikingo valiente que quiera mejorar el proyecto!

1. Haz un fork
2. Crea tu rama: `git checkout -b feature/tu-mejora`
3. Commit: `git commit -m "Agrega runas mágicas"`
4. Push: `git push origin feature/tu-mejora`
5. Abre un Pull Request

---

## 📜 Licencia

Este proyecto está licenciado bajo [MIT](LICENSE).

---

## 🍻 Créditos

Desarrollado por la comunidad, para la comunidad.

Inspirado por el mundo brutal y hermoso de **Valheim**.

> _"Recuerda: si mueres sin subir tu código al GitHub de los dioses, no serás recordado en los salones de Valhalla."_
