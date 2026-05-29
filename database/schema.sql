-- Friendship Biodata Memories Database Schema
-- This file creates all tables needed for the application
-- Run this file using: mysql -u root -p friendship_db < database/schema.sql

-- ============================================
-- 1. USERS TABLE
-- ============================================
CREATE TABLE IF NOT EXISTS users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(255) UNIQUE NOT NULL,
    username VARCHAR(100) NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    nickname VARCHAR(100),
    bio TEXT,
    profile_photo_url VARCHAR(500),
    date_of_birth DATE,
    phone VARCHAR(20),
    user_type ENUM('STUDENT', 'PROFESSIONAL', 'OTHER') DEFAULT 'STUDENT',
    
    -- Profile Details
    hobbies TEXT,
    favorite_color VARCHAR(50),
    favorite_food VARCHAR(100),
    dream_goal TEXT,
    
    -- Account Settings
    dark_mode_enabled BOOLEAN DEFAULT FALSE,
    account_status ENUM('ACTIVE', 'INACTIVE', 'SUSPENDED') DEFAULT 'ACTIVE',
    
    -- Timestamps
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    last_login TIMESTAMP NULL,
    
    INDEX idx_email (email),
    INDEX idx_username (username),
    INDEX idx_created_at (created_at)
);

-- ============================================
-- 2. FRIEND PROFILES TABLE
-- ============================================
CREATE TABLE IF NOT EXISTS friend_profiles (
    friendship_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    friend_id INT NOT NULL,
    friend_category ENUM('SCHOOL_FRIEND', 'COLLEGE_FRIEND', 'OFFICE_FRIEND', 'BEST_FRIEND', 'OTHER') DEFAULT 'OTHER',
    friendship_status ENUM('PENDING', 'ACCEPTED', 'BLOCKED') DEFAULT 'PENDING',
    
    -- Friendship Metrics
    friendship_percentage INT DEFAULT 0 CHECK (friendship_percentage >= 0 AND friendship_percentage <= 100),
    total_memories INT DEFAULT 0,
    last_interaction TIMESTAMP NULL,
    
    -- Timestamps
    connected_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (friend_id) REFERENCES users(user_id) ON DELETE CASCADE,
    UNIQUE KEY unique_friendship (user_id, friend_id),
    INDEX idx_user_id (user_id),
    INDEX idx_friend_id (friend_id),
    INDEX idx_status (friendship_status)
);

-- ============================================
-- 3. BIODATA ENTRIES TABLE
-- ============================================
CREATE TABLE IF NOT EXISTS biodata_entries (
    biodata_id INT PRIMARY KEY AUTO_INCREMENT,
    friendship_id INT NOT NULL,
    from_user_id INT NOT NULL,
    to_user_id INT NOT NULL,
    
    -- Biodata Fields
    what_i_like_about_you TEXT,
    what_i_dislike TEXT,
    best_memory_together TEXT,
    funny_moments TEXT,
    favorite_nickname VARCHAR(100),
    friendship_rating INT CHECK (friendship_rating >= 1 AND friendship_rating <= 5),
    hidden_talent VARCHAR(255),
    one_word_about_you VARCHAR(100),
    future_wishes TEXT,
    advice_message TEXT,
    secret_message TEXT,
    
    -- Media
    favorite_photo_url VARCHAR(500),
    voice_message_url VARCHAR(500),
    
    -- Additional Info
    is_public BOOLEAN DEFAULT TRUE,
    is_featured BOOLEAN DEFAULT FALSE,
    view_count INT DEFAULT 0,
    
    -- Timestamps
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    FOREIGN KEY (friendship_id) REFERENCES friend_profiles(friendship_id) ON DELETE CASCADE,
    FOREIGN KEY (from_user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (to_user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    INDEX idx_friendship_id (friendship_id),
    INDEX idx_from_user (from_user_id),
    INDEX idx_to_user (to_user_id),
    INDEX idx_created_at (created_at)
);

-- ============================================
-- 4. MEMORIES TABLE
-- ============================================
CREATE TABLE IF NOT EXISTS memories (
    memory_id INT PRIMARY KEY AUTO_INCREMENT,
    friendship_id INT NOT NULL,
    creator_id INT NOT NULL,
    
    -- Memory Details
    title VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    memory_date DATE,
    memory_category ENUM('BIRTHDAY', 'TRIP', 'CELEBRATION', 'FUNNY', 'EMOTIONAL', 'CASUAL') DEFAULT 'CASUAL',
    
    -- Timeline & Importance
    is_favorite BOOLEAN DEFAULT FALSE,
    importance_level ENUM('LOW', 'MEDIUM', 'HIGH') DEFAULT 'MEDIUM',
    
    -- Timestamps
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    FOREIGN KEY (friendship_id) REFERENCES friend_profiles(friendship_id) ON DELETE CASCADE,
    FOREIGN KEY (creator_id) REFERENCES users(user_id) ON DELETE CASCADE,
    INDEX idx_friendship_id (friendship_id),
    INDEX idx_creator_id (creator_id),
    INDEX idx_memory_date (memory_date)
);

-- ============================================
-- 5. GALLERY PHOTOS TABLE
-- ============================================
CREATE TABLE IF NOT EXISTS gallery_photos (
    photo_id INT PRIMARY KEY AUTO_INCREMENT,
    friendship_id INT NOT NULL,
    uploaded_by INT NOT NULL,
    
    -- Photo Details
    photo_url VARCHAR(500) NOT NULL,
    thumbnail_url VARCHAR(500),
    title VARCHAR(255),
    description TEXT,
    photo_category ENUM('MEMORY', 'PROFILE', 'MOMENT', 'CELEBRATION', 'OTHER') DEFAULT 'MEMORY',
    
    -- Photo Metadata
    is_featured BOOLEAN DEFAULT FALSE,
    view_count INT DEFAULT 0,
    like_count INT DEFAULT 0,
    
    -- Timestamps
    uploaded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (friendship_id) REFERENCES friend_profiles(friendship_id) ON DELETE CASCADE,
    FOREIGN KEY (uploaded_by) REFERENCES users(user_id) ON DELETE CASCADE,
    INDEX idx_friendship_id (friendship_id),
    INDEX idx_uploaded_by (uploaded_by),
    INDEX idx_uploaded_at (uploaded_at)
);

-- ============================================
-- 6. COMMENTS TABLE
-- ============================================
CREATE TABLE IF NOT EXISTS comments (
    comment_id INT PRIMARY KEY AUTO_INCREMENT,
    biodata_id INT,
    memory_id INT,
    photo_id INT,
    commenter_id INT NOT NULL,
    
    -- Comment Content
    comment_text TEXT NOT NULL,
    emoji_reaction VARCHAR(50),
    
    -- Comment Status
    is_approved BOOLEAN DEFAULT TRUE,
    is_deleted BOOLEAN DEFAULT FALSE,
    like_count INT DEFAULT 0,
    
    -- Timestamps
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    FOREIGN KEY (biodata_id) REFERENCES biodata_entries(biodata_id) ON DELETE CASCADE,
    FOREIGN KEY (memory_id) REFERENCES memories(memory_id) ON DELETE CASCADE,
    FOREIGN KEY (photo_id) REFERENCES gallery_photos(photo_id) ON DELETE CASCADE,
    FOREIGN KEY (commenter_id) REFERENCES users(user_id) ON DELETE CASCADE,
    INDEX idx_biodata_id (biodata_id),
    INDEX idx_memory_id (memory_id),
    INDEX idx_photo_id (photo_id),
    INDEX idx_commenter_id (commenter_id),
    INDEX idx_created_at (created_at)
);

-- ============================================
-- 7. FRIENDSHIP RATINGS TABLE
-- ============================================
CREATE TABLE IF NOT EXISTS friendship_ratings (
    rating_id INT PRIMARY KEY AUTO_INCREMENT,
    friendship_id INT NOT NULL,
    rated_by INT NOT NULL,
    
    -- Rating Details
    rating_score INT NOT NULL CHECK (rating_score >= 1 AND rating_score <= 5),
    rating_category ENUM('LOYALTY', 'HUMOR', 'SUPPORT', 'TRUSTWORTHINESS', 'FUN', 'OVERALL') DEFAULT 'OVERALL',
    comment TEXT,
    
    -- Badge System
    badge_type ENUM('BEST_FRIEND', 'FOREVER_FRIEND', 'LOYAL_FRIEND', 'FUNNY_FRIEND', 'SUPPORTIVE_FRIEND') DEFAULT NULL,
    
    -- Timestamps
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    FOREIGN KEY (friendship_id) REFERENCES friend_profiles(friendship_id) ON DELETE CASCADE,
    FOREIGN KEY (rated_by) REFERENCES users(user_id) ON DELETE CASCADE,
    INDEX idx_friendship_id (friendship_id),
    INDEX idx_rated_by (rated_by),
    INDEX idx_rating_score (rating_score)
);

-- ============================================
-- ADDITIONAL TABLES FOR PREMIUM FEATURES
-- ============================================

-- Time Capsule Messages
CREATE TABLE IF NOT EXISTS time_capsule_messages (
    message_id INT PRIMARY KEY AUTO_INCREMENT,
    from_user_id INT NOT NULL,
    to_user_id INT NOT NULL,
    
    message_content TEXT NOT NULL,
    open_date DATE NOT NULL,
    is_opened BOOLEAN DEFAULT FALSE,
    opened_at TIMESTAMP NULL,
    
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (from_user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (to_user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    INDEX idx_to_user (to_user_id),
    INDEX idx_open_date (open_date)
);

-- Friendship Quiz
CREATE TABLE IF NOT EXISTS friendship_quiz (
    quiz_id INT PRIMARY KEY AUTO_INCREMENT,
    creator_id INT NOT NULL,
    friend_id INT NOT NULL,
    
    question TEXT NOT NULL,
    correct_answer VARCHAR(255),
    option_1 VARCHAR(255),
    option_2 VARCHAR(255),
    option_3 VARCHAR(255),
    option_4 VARCHAR(255),
    difficulty ENUM('EASY', 'MEDIUM', 'HARD') DEFAULT 'MEDIUM',
    
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (creator_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (friend_id) REFERENCES users(user_id) ON DELETE CASCADE,
    INDEX idx_creator_id (creator_id),
    INDEX idx_friend_id (friend_id)
);

-- Birthday Reminders
CREATE TABLE IF NOT EXISTS birthday_reminders (
    reminder_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    friend_id INT NOT NULL,
    
    birthday_date DATE NOT NULL,
    reminder_sent BOOLEAN DEFAULT FALSE,
    last_reminder_date TIMESTAMP NULL,
    
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (friend_id) REFERENCES users(user_id) ON DELETE CASCADE,
    INDEX idx_birthday_date (birthday_date),
    INDEX idx_user_id (user_id)
);

-- Password Reset Tokens
CREATE TABLE IF NOT EXISTS password_reset_tokens (
    token_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    reset_token VARCHAR(255) UNIQUE NOT NULL,
    expiry_time TIMESTAMP NOT NULL,
    is_used BOOLEAN DEFAULT FALSE,
    
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    INDEX idx_reset_token (reset_token),
    INDEX idx_expiry_time (expiry_time)
);

-- ============================================
-- CREATE INDEXES FOR BETTER PERFORMANCE
-- ============================================

CREATE INDEX idx_users_account_status ON users(account_status);
CREATE INDEX idx_friendship_status ON friend_profiles(friendship_status);
CREATE INDEX idx_biodata_created ON biodata_entries(created_at DESC);
CREATE INDEX idx_memories_favorite ON memories(is_favorite);
CREATE INDEX idx_photos_featured ON gallery_photos(is_featured);

-- ============================================
-- VIEWS FOR COMMON QUERIES
-- ============================================

-- View: User's Active Friendships
CREATE VIEW active_friendships AS
SELECT 
    fp.friendship_id,
    fp.user_id,
    fp.friend_id,
    u1.username as user_username,
    u2.username as friend_username,
    u2.profile_photo_url as friend_photo,
    fp.friend_category,
    fp.friendship_percentage,
    fp.total_memories,
    COUNT(DISTINCT be.biodata_id) as biodata_count,
    COUNT(DISTINCT gp.photo_id) as photo_count
FROM friend_profiles fp
JOIN users u1 ON fp.user_id = u1.user_id
JOIN users u2 ON fp.friend_id = u2.user_id
LEFT JOIN biodata_entries be ON fp.friendship_id = be.friendship_id
LEFT JOIN gallery_photos gp ON fp.friendship_id = gp.friendship_id
WHERE fp.friendship_status = 'ACCEPTED'
GROUP BY fp.friendship_id;

-- View: Recent Biodata Entries
CREATE VIEW recent_biodata AS
SELECT 
    be.biodata_id,
    be.from_user_id,
    be.to_user_id,
    u1.username as from_user,
    u2.username as to_user,
    u1.profile_photo_url,
    be.favorite_nickname,
    be.friendship_rating,
    be.created_at,
    COUNT(DISTINCT c.comment_id) as comment_count
FROM biodata_entries be
JOIN users u1 ON be.from_user_id = u1.user_id
JOIN users u2 ON be.to_user_id = u2.user_id
LEFT JOIN comments c ON be.biodata_id = c.biodata_id
WHERE be.is_public = TRUE
GROUP BY be.biodata_id
ORDER BY be.created_at DESC;

PRINT 'Database schema created successfully! ✅';
