# Project Setup Guide - Friendship Biodata Memories

## 🎓 Beginner-Friendly Step-by-Step Setup

### What You'll Learn
This guide explains how to set up the entire project from scratch, even if you're new to web development.

## Part 1: Prerequisites (What You Need)

### 1. Install Java
**Why?** Java is the programming language for our backend.

- Download: https://www.oracle.com/java/technologies/downloads/
- Choose Java 11 or 17 LTS
- After installation, verify:
  ```bash
  java -version
  ```

### 2. Install MySQL
**Why?** MySQL stores all our friendship data.

- Download: https://dev.mysql.com/downloads/mysql/
- Install with default settings
- After installation, verify:
  ```bash
  mysql --version
  ```

### 3. Install Maven
**Why?** Maven helps us manage Java project dependencies.

- Download: https://maven.apache.org/download.cgi
- Add to PATH environment variable
- Verify:
  ```bash
  mvn --version
  ```

### 4. Install Git
**Why?** Git helps us manage our code.

- Download: https://git-scm.com/
- Verify:
  ```bash
  git --version
  ```

### 5. Code Editor
**Why?** We need a tool to write and edit code.

**Options:**
- VS Code (free) - https://code.visualstudio.com/
- IntelliJ IDEA Community (free) - https://www.jetbrains.com/idea/
- Eclipse (free) - https://www.eclipse.org/

**Recommended for beginners:** VS Code

## Part 2: Database Setup

### Step 1: Create Database

```bash
# Open MySQL command line
mysql -u root -p
# Enter your MySQL password

# Create new database
CREATE DATABASE friendship_db;

# Select the database
USE friendship_db;

# Run the schema file
source database/schema.sql;

# (Optional) Load sample data
source database/initial_data.sql;

# Exit MySQL
exit;
```

### Step 2: Verify Tables Created

```bash
mysql -u root -p -e "USE friendship_db; SHOW TABLES;"
```

You should see 7 tables:
- users
- friend_profiles
- biodata_entries
- memories
- gallery_photos
- comments
- friendship_ratings

## Part 3: Backend Setup

### Step 1: Navigate to Backend Directory

```bash
cd backend
```

### Step 2: Configure Database Connection

Open: `backend/src/main/resources/application.properties`

Update with your MySQL credentials:

```properties
# MySQL Configuration
spring.datasource.url=jdbc:mysql://localhost:3306/friendship_db
spring.datasource.username=root
spring.datasource.password=your_mysql_password
spring.datasource.driver-class-name=com.mysql.cj.jdbc.Driver

# JPA Configuration
spring.jpa.database-platform=org.hibernate.dialect.MySQL8Dialect
spring.jpa.hibernate.ddl-auto=update
spring.jpa.show-sql=false

# Server Configuration
server.port=8080
server.servlet.context-path=/api

# JWT Configuration
jwt.secret=your_secret_key_here_minimum_32_characters_long
jwt.expiration=86400000

# File Upload Configuration
file.upload-dir=uploads/
file.max-size=5242880
```

### Step 3: Build and Run Backend

```bash
# Download all dependencies (first time takes longer)
mvn clean install

# Start the application
mvn spring-boot:run
```

**Expected Output:**
```
Friendship Application started on http://localhost:8080
```

## Part 4: Frontend Setup

### Step 1: Navigate to Frontend Directory

```bash
cd frontend
```

### Step 2: Start Local Server

**Option A: Using Python (Recommended)**
```bash
# If you have Python 3
python -m http.server 3000

# If you have Python 2
python -m SimpleHTTPServer 3000
```

**Option B: Using Node.js**
```bash
npm install -g http-server
http-server -p 3000
```

**Option C: Using Live Server (VS Code Extension)**
- Install "Live Server" extension
- Right-click on index.html → "Open with Live Server"

### Step 3: Access Frontend

Open your browser and go to:
```
http://localhost:3000
```

## Part 5: Testing the Application

### Test User Accounts

**Test Account 1:**
- Email: testuser1@example.com
- Password: Test@1234
- Type: Student

**Test Account 2:**
- Email: testuser2@example.com
- Password: Test@1234
- Type: Student

### Testing Workflow

1. **Register New User**
   - Go to Registration page
   - Fill all fields
   - Click Register

2. **Login**
   - Enter email and password
   - Click Login

3. **Complete Profile**
   - Add profile photo
   - Fill personal details
   - Add interests and hobbies

4. **Add Friends**
   - Search for friends
   - Send friend requests
   - Accept/Reject requests

5. **Fill Biodata**
   - Click on friend
   - Fill biodata form
   - Submit

6. **View Dashboard**
   - See all biodata entries
   - Use filters
   - Download as PDF

## Part 6: Troubleshooting

### Problem: "Connection refused" Error

**Solution:**
- Check if MySQL is running
- Check if database URL is correct in application.properties
- Verify username and password

### Problem: "Port 8080 already in use"

**Solution:**
```bash
# Change port in application.properties
server.port=8081

# Or kill the process using port 8080
# On Windows
netstat -ano | findstr :8080
taskkill /PID <PID> /F

# On Mac/Linux
lsof -ti:8080 | xargs kill -9
```

### Problem: CORS Errors

**Solution:**
- Ensure frontend and backend URLs match in API calls
- Check CORS configuration in backend

### Problem: "No such file or directory: database/schema.sql"

**Solution:**
- Make sure you're in the project root directory
- Check the file path is correct
- Use full path if needed

## Part 7: Development Workflow

### For Backend Development

1. Make changes in `backend/src/main/java`
2. Save file (auto-reload enabled)
3. Backend automatically restarts
4. Test with Postman or browser

### For Frontend Development

1. Make changes in `frontend/` files
2. Save file
3. Refresh browser (usually auto-refreshes with Live Server)
4. Test the changes

## Part 8: Useful Commands

### Maven Commands
```bash
# Clean and install
mvn clean install

# Run tests
mvn test

# Create executable JAR
mvn package

# Skip tests during build
mvn clean install -DskipTests
```

### MySQL Commands
```bash
# Login to MySQL
mysql -u root -p

# Show all databases
SHOW DATABASES;

# Show all tables in current database
SHOW TABLES;

# Describe table structure
DESCRIBE table_name;

# Export database
mysqldump -u root -p friendship_db > backup.sql

# Import database
mysql -u root -p friendship_db < backup.sql
```

## Part 9: Next Steps

1. ✅ Read the [Backend Guide](./documentation/BACKEND_GUIDE.md) to understand Java code
2. ✅ Read the [Frontend Guide](./documentation/FRONTEND_GUIDE.md) to understand HTML/CSS/JS
3. ✅ Read the [Database Guide](./documentation/DATABASE_GUIDE.md) to understand the schema
4. ✅ Read the [API Documentation](./documentation/API_DOCUMENTATION.md) for all endpoints

## 📞 Need Help?

- Check the FAQ section in each guide
- Look at error messages carefully (they often tell you the solution)
- Check Stack Overflow for Java/MySQL errors
- Review the code comments for explanations

---

**Congratulations! You've successfully set up the project! 🎉**
