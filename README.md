# Friendship Biodata Memories 📚💝

A full-stack web application for capturing nostalgic memories and friend feedback through digital biodata/autograph notes.

## 🎯 Project Vision

This application recreates the emotional experience of old school and college farewell biodata/autograph notes in a modern, digital format. Friends can write memories, opinions, and personal messages about each other, creating a timeless digital archive.

## 🛠️ Technology Stack

### Frontend
- HTML5
- CSS3 & Tailwind CSS
- Bootstrap 5
- Vanilla JavaScript (ES6+)

### Backend
- Java 11+
- Spring Boot 2.x
- Spring Data JPA
- Spring Security

### Database
- MySQL 8.0+
- JDBC

## 📋 Key Features

### Core Modules
1. **User Authentication** - Secure registration, login, password recovery
2. **User Profile** - Personal details, photos, bio, interests
3. **Friendship Biodata Form** - Detailed feedback from friends
4. **Friend Categories** - Organize by School/College/Office/Best Friends
5. **Dashboard** - View, search, and filter all entries
6. **Gallery** - Photo sharing and memories album

### Premium Features
- 🌙 Dark Mode
- 📥 Download Biodata as PDF
- 📱 Fully Responsive Mobile Design
- ✨ Animated Glassmorphism Cards
- 💯 Friendship Percentage Meter
- 🎂 Birthday Reminders
- 😊 Emoji Reactions
- 💬 Comment Section
- 🎨 Digital Autograph Wall
- 🎙️ Voice Message Upload
- ⏰ Time Capsule Messages
- 🏆 Best Friend Badge System
- 📊 Friendship Quiz

## 📊 Database Tables

```
- users
- friend_profiles
- biodata_entries
- memories
- gallery_photos
- comments
- friendship_ratings
```

## 🚀 Quick Start

### Prerequisites
- Java 11 or higher
- MySQL 8.0 or higher
- Maven 3.6+
- Node.js (optional, for frontend build tools)

### Installation Steps

1. **Clone Repository**
   ```bash
   git clone https://github.com/dharshini15201-sketch/friendship-biodata-memories.git
   cd friendship-biodata-memories
   ```

2. **Database Setup**
   ```bash
   mysql -u root -p
   CREATE DATABASE friendship_db;
   USE friendship_db;
   source database/schema.sql;
   source database/initial_data.sql;
   ```

3. **Backend Setup**
   ```bash
   cd backend
   mvn clean install
   mvn spring-boot:run
   ```
   Server runs on: `http://localhost:8080`

4. **Frontend Setup**
   ```bash
   cd frontend
   # Open pages in your browser or use a local server
   python -m http.server 3000
   ```
   Access on: `http://localhost:3000`

## 📁 Project Structure

```
friendship-biodata-memories/
├── database/              # SQL schemas and scripts
├── backend/              # Java Spring Boot application
├── frontend/             # HTML, CSS, JavaScript
└── documentation/        # Setup guides and API docs
```

## 🔑 Default Credentials (for testing)

```
Username: testuser
Password: Test@1234
```

## 📚 Documentation

- [Database Setup Guide](./documentation/DATABASE_GUIDE.md)
- [Backend Development](./documentation/BACKEND_GUIDE.md)
- [Frontend Development](./documentation/FRONTEND_GUIDE.md)
- [API Documentation](./documentation/API_DOCUMENTATION.md)
- [Deployment Guide](./documentation/DEPLOYMENT.md)

## 🤝 Contributing

Contributions are welcome! Please read our contributing guidelines and submit pull requests.

## 📄 License

MIT License - See LICENSE file for details

## 💬 Support

For issues, questions, or suggestions, please create an issue in the repository.

## 👨‍💻 Author

Created with ❤️ for preserving friendship memories digitally.

---

**Made with ❤️ | Version 1.0.0**
