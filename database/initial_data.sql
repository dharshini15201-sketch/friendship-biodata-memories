-- Sample Data for Friendship Biodata Memories
-- This file populates the database with test data
-- Run after schema.sql using: mysql -u root -p friendship_db < database/initial_data.sql

-- ============================================
-- INSERT TEST USERS
-- ============================================

INSERT INTO users (
    email, username, password_hash, first_name, last_name, nickname,
    bio, date_of_birth, user_type, hobbies, favorite_color, favorite_food, dream_goal,
    dark_mode_enabled, account_status
) VALUES
(
    'testuser1@example.com',
    'testuser1',
    '$2a$10$abcdefghijklmnopqrstuvwxyz123456',
    'Rajesh',
    'Kumar',
    'Raj',
    'Love coding and coffee ☕',
    '1998-03-15',
    'STUDENT',
    'Coding, Gaming, Reading',
    'Blue',
    'Pizza',
    'Become a Full-Stack Developer',
    FALSE,
    'ACTIVE'
),
(
    'testuser2@example.com',
    'testuser2',
    '$2a$10$abcdefghijklmnopqrstuvwxyz123456',
    'Priya',
    'Singh',
    'Pri',
    'Designer with a passion for creativity',
    '1999-07-22',
    'STUDENT',
    'Design, Photography, Travel',
    'Pink',
    'Biryani',
    'Start my own design agency',
    TRUE,
    'ACTIVE'
),
(
    'testuser3@example.com',
    'testuser3',
    '$2a$10$abcdefghijklmnopqrstuvwxyz123456',
    'Arjun',
    'Patel',
    'Arj',
    'Adventure seeker and sports enthusiast',
    '1998-11-30',
    'STUDENT',
    'Sports, Adventure, Music',
    'Black',
    'Dosa',
    'Become a professional athlete',
    FALSE,
    'ACTIVE'
),
(
    'testuser4@example.com',
    'testuser4',
    '$2a$10$abcdefghijklmnopqrstuvwxyz123456',
    'Sneha',
    'Sharma',
    'Sneh',
    'Bookworm and aspiring writer',
    '1999-02-14',
    'STUDENT',
    'Writing, Reading, Painting',
    'Purple',
    'Momos',
    'Publish a bestselling novel',
    FALSE,
    'ACTIVE'
);

-- ============================================
-- INSERT FRIEND PROFILES (FRIENDSHIPS)
-- ============================================

INSERT INTO friend_profiles (
    user_id, friend_id, friend_category, friendship_status,
    friendship_percentage, total_memories
) VALUES
-- User 1 (Rajesh) connections
(1, 2, 'COLLEGE_FRIEND', 'ACCEPTED', 85, 5),
(1, 3, 'BEST_FRIEND', 'ACCEPTED', 95, 8),
(1, 4, 'COLLEGE_FRIEND', 'ACCEPTED', 75, 3),

-- User 2 (Priya) connections
(2, 1, 'COLLEGE_FRIEND', 'ACCEPTED', 85, 5),
(2, 3, 'COLLEGE_FRIEND', 'ACCEPTED', 80, 4),
(2, 4, 'BEST_FRIEND', 'ACCEPTED', 92, 7),

-- User 3 (Arjun) connections
(3, 1, 'BEST_FRIEND', 'ACCEPTED', 95, 8),
(3, 2, 'COLLEGE_FRIEND', 'ACCEPTED', 80, 4),
(3, 4, 'COLLEGE_FRIEND', 'ACCEPTED', 82, 6),

-- User 4 (Sneha) connections
(4, 1, 'COLLEGE_FRIEND', 'ACCEPTED', 75, 3),
(4, 2, 'BEST_FRIEND', 'ACCEPTED', 92, 7),
(4, 3, 'COLLEGE_FRIEND', 'ACCEPTED', 82, 6);

-- ============================================
-- INSERT BIODATA ENTRIES
-- ============================================

INSERT INTO biodata_entries (
    friendship_id, from_user_id, to_user_id,
    what_i_like_about_you, what_i_dislike, best_memory_together,
    funny_moments, favorite_nickname, friendship_rating,
    hidden_talent, one_word_about_you, future_wishes,
    advice_message, secret_message, is_public, is_featured
) VALUES
-- Rajesh writing for Priya
(
    1, 1, 2,
    'Your creativity and positive attitude inspire me every day. You always know how to cheer me up.',
    'Sometimes you can be too perfectionist about your designs!',
    'Our campus project where we stayed up all night coding and designing together. We created something amazing!',
    'When you tried to explain CSS to me using emojis! 😂',
    'Creative Queen',
    5,
    'You can do amazing digital art if you focus on it more',
    'Inspiring',
    'Hope we collaborate on many more projects and start our startup together',
    'Never doubt your abilities. You are way better than you think!',
    'I think you deserve someone who appreciates your art as much as I do',
    TRUE,
    TRUE
),
-- Priya writing for Rajesh
(
    2, 2, 1,
    'Your problem-solving skills are incredible. You always have the right answer!',
    'You code at 2 AM and expect everyone to be awake! 😅',
    'The hackathon where we won first prize with our app',
    'When your code had a typo and it took us 3 hours to find it',
    'Code Master',
    5,
    'You could be a great teacher if you explain things patiently',
    'Genius',
    'Hope we build something revolutionary that changes the world',
    'Keep coding but also remember to sleep!',
    'Your potential is limitless, don''t ever settle for less',
    TRUE,
    TRUE
),
-- Arjun writing for Rajesh
(
    3, 3, 1,
    'You are my rock, bro. Always there when I need advice.',
    'You are too focused on tech. Let''s go out more!',
    'Our road trip to Goa where we just drove and talked about life',
    'When you got carsick on the highway 😂',
    'Tech Buddy',
    5,
    'You can be an excellent public speaker if you try',
    'Dependable',
    'Let''s travel the world after graduation',
    'Balance your work and life. Health comes first!',
    'You are the best friend anyone could ask for',
    TRUE,
    TRUE
),
-- Sneha writing for Priya
(
    4, 4, 2,
    'You understand me without me even saying anything. That''s true friendship!',
    'You forget about me when you are busy with work 😢',
    'Our late-night conversations about dreams and fears',
    'When we got caught laughing in the library and got scolded by the librarian',
    'Design Diva',
    5,
    'You have a hidden talent for writing. Your emails are poetry!',
    'Soulmate',
    'Hope we live together in the city and achieve our dreams',
    'Be more confident about yourself. You are amazing!',
    'I love you more than words can express',
    TRUE,
    TRUE
);

-- ============================================
-- INSERT MEMORIES
-- ============================================

INSERT INTO memories (
    friendship_id, creator_id,
    title, description, memory_date, memory_category,
    is_favorite, importance_level
) VALUES
-- Memories for friendship 1 (Rajesh & Priya)
(
    1, 1,
    'First Project Together',
    'We created our first app together. It was messy but we learned so much!',
    '2023-06-15',
    'CELEBRATION',
    TRUE,
    'HIGH'
),
(
    1, 2,
    'Late Night Coffee Talks',
    'We spent the whole night discussing life, dreams, and code',
    '2023-08-20',
    'CASUAL',
    TRUE,
    'MEDIUM'
),
-- Memories for friendship 3 (Rajesh & Arjun)
(
    3, 1,
    'Road Trip to Mountains',
    'Best friends adventure in nature with stories to tell forever',
    '2023-07-10',
    'TRIP',
    TRUE,
    'HIGH'
),
(
    3, 3,
    'Birthday Surprise',
    'Arjun surprised Rajesh with a party at midnight',
    '2023-03-15',
    'BIRTHDAY',
    TRUE,
    'HIGH'
),
-- Memories for friendship 6 (Priya & Sneha)
(
    6, 2,
    'Girl''s Day Out',
    'Shopping, food, and endless laughter',
    '2023-09-05',
    'CASUAL',
    TRUE,
    'MEDIUM'
),
(
    6, 4,
    'Movie Marathon',
    'We watched 4 movies in one day and discussed each one',
    '2023-09-22',
    'CASUAL',
    FALSE,
    'MEDIUM'
);

-- ============================================
-- INSERT GALLERY PHOTOS
-- ============================================

INSERT INTO gallery_photos (
    friendship_id, uploaded_by,
    photo_url, title, description, photo_category,
    is_featured, view_count, like_count
) VALUES
-- Photos for friendship 1
(
    1, 1,
    '/assets/photos/project-together-1.jpg',
    'First Project Success',
    'The moment we completed our first app together',
    'MEMORY',
    TRUE,
    45,
    12
),
(
    1, 2,
    '/assets/photos/coffee-date-1.jpg',
    'Coffee Chat',
    'Our favorite coffee shop moments',
    'CASUAL',
    FALSE,
    28,
    8
),
-- Photos for friendship 3
(
    3, 1,
    '/assets/photos/road-trip-1.jpg',
    'Mountain Adventure',
    'Beautiful memories from our mountain trip',
    'MEMORY',
    TRUE,
    67,
    15
),
(
    3, 3,
    '/assets/photos/birthday-party-1.jpg',
    'Birthday Celebration',
    'Midnight surprise party!',
    'CELEBRATION',
    TRUE,
    52,
    18
),
-- Photos for friendship 6
(
    6, 2,
    '/assets/photos/girls-day-1.jpg',
    'Girls Day Out',
    'Fun shopping and food moments',
    'CASUAL',
    FALSE,
    35,
    10
);

-- ============================================
-- INSERT FRIENDSHIP RATINGS
-- ============================================

INSERT INTO friendship_ratings (
    friendship_id, rated_by, rating_score,
    rating_category, comment, badge_type
) VALUES
-- Ratings for various friendships
(
    1, 1, 5, 'LOYALTY', 'She is always there for me', 'BEST_FRIEND'
),
(
    1, 2, 5, 'SUPPORT', 'He supports all my crazy ideas', 'BEST_FRIEND'
),
(
    3, 1, 5, 'HUMOR', 'He makes me laugh every single day', 'FOREVER_FRIEND'
),
(
    3, 3, 5, 'LOYALTY', 'Best friend ever', 'BEST_FRIEND'
),
(
    6, 2, 5, 'TRUSTWORTHINESS', 'I can trust her with my secrets', 'FOREVER_FRIEND'
),
(
    6, 4, 5, 'SUPPORT', 'She believes in me more than I believe in myself', 'BEST_FRIEND'
);

-- ============================================
-- INSERT COMMENTS ON BIODATA
-- ============================================

INSERT INTO comments (
    biodata_id, commenter_id,
    comment_text, emoji_reaction, is_approved
) VALUES
(
    1, 3,
    'Wow! This is so sweet. You guys are the best duo! 💕',
    '❤️',
    TRUE
),
(
    1, 4,
    'The best project partners ever!',
    '👏',
    TRUE
),
(
    2, 1,
    'Haha! The CSS emoji explanation was legendary!',
    '😂',
    TRUE
),
(
    3, 2,
    'This is so touching! True friendship right here! 🎉',
    '🎉',
    TRUE
),
(
    4, 1,
    'You guys are the best! Can''t wait for more adventures!',
    '🚀',
    TRUE
);

-- ============================================
-- INSERT TIME CAPSULE MESSAGES
-- ============================================

INSERT INTO time_capsule_messages (
    from_user_id, to_user_id,
    message_content, open_date, is_opened
) VALUES
(
    1, 2,
    'Hi Priya! This is a message from the past. I hope by the time you read this, we have achieved all our dreams together!',
    '2025-06-29',
    FALSE
),
(
    3, 1,
    'Bro, remember our dreams? Let''s make them reality!',
    '2025-12-31',
    FALSE
);

-- ============================================
-- INSERT BIRTHDAY REMINDERS
-- ============================================

INSERT INTO birthday_reminders (
    user_id, friend_id,
    birthday_date, reminder_sent
) VALUES
(1, 2, '2025-07-22', FALSE),
(1, 3, '2025-11-30', FALSE),
(1, 4, '2025-02-14', FALSE),
(2, 1, '2025-03-15', FALSE),
(2, 3, '2025-11-30', FALSE),
(2, 4, '2025-02-14', FALSE),
(3, 1, '2025-03-15', FALSE),
(3, 2, '2025-07-22', FALSE),
(3, 4, '2025-02-14', FALSE),
(4, 1, '2025-03-15', FALSE),
(4, 2, '2025-07-22', FALSE),
(4, 3, '2025-11-30', FALSE);

PRINT 'Sample data inserted successfully! ✅';
