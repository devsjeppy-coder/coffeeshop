-- Database
CREATE DATABASE IF NOT EXISTS coffeeshop;
USE coffeeshop;

-- Table: users
CREATE TABLE IF NOT EXISTS users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role ENUM('Admin', 'User') DEFAULT 'User',
    status ENUM('Active', 'Inactive') DEFAULT 'Active',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table: menu
CREATE TABLE IF NOT EXISTS menu (
    menu_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    category ENUM('Food','Beverage','Dessert') DEFAULT 'Food',
    price FLOAT NOT NULL,
    description VARCHAR(100) NOT NULL,
    tag ENUM('Spicy','Vegetarian','Popular') DEFAULT 'Popular',
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE SET NULL
);

-- Table: events
CREATE TABLE IF NOT EXISTS events (
    event_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    title VARCHAR(255) NOT NULL,
    date DATE NOT NULL,
    time TIME NOT NULL,
    category ENUM('Birthday','Wedding','Seminar') DEFAULT 'Birthday',
    price FLOAT NOT NULL,
    slots INT NOT NULL,
    status ENUM('Active','Cancelled','Full') DEFAULT 'Active',
    FOREIGN KEY(user_id) REFERENCES users(user_id) ON DELETE SET NULL
);

-- Table: messages
CREATE TABLE IF NOT EXISTS messages (
    message_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    topic VARCHAR(100) NOT NULL,
    message VARCHAR(255) NOT NULL,
    date DATE NOT NULL,
    status ENUM('Pending','Read','Replied') DEFAULT 'Pending',
    FOREIGN KEY(user_id) REFERENCES users(user_id) ON DELETE SET NULL
);