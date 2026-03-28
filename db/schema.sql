-- Database
CREATE DATABASE coffeeshop;
USE coffeeshop;

-- Table: users
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role ENUM('Admin', 'User') DEFAULT 'User',
    status ENUM('Active', 'Inactive') DEFAULT 'Active',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table: menu
CREATE TABLE menu (
    menu_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL, 
    category ENUM('Food','Beverage','Dessert') DEFAULT 'Food',
    price FLOAT NOT NULL,
    description VARCHAR(100) NOT NULL,
    tag ENUM('Spicy','Vegetarian','Popular') DEFAULT 'Popular',
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

-- Table: events
CREATE TABLE events (
    event_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL, 
    title VARCHAR(255) NOT NULL,
    date DATE NOT NULL,
    time TIME NOT NULL,
    category ENUM('Birthday','Wedding','Seminar') DEFAULT 'Birthday',
    price FLOAT NOT NULL,
    slots INT NOT NULL,
    status ENUM('Active','Cancelled','Full') DEFAULT 'Active',
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

-- Table: messages
CREATE TABLE messages (
    message_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL, 
    topic VARCHAR(100) NOT NULL,
    message VARCHAR(255) NOT NULL,
    date DATE NOT NULL,
    status ENUM('Pending','Read','Replied') DEFAULT 'Pending',
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

-- Table: orders
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL, 
    total_amount FLOAT NOT NULL,
    status ENUM('Pending','Paid','Cancelled') DEFAULT 'Pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

-- Table: order_items
CREATE TABLE order_items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    menu_id INT NOT NULL,
    quantity INT NOT NULL,
    item_price FLOAT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE,
    FOREIGN KEY (menu_id) REFERENCES menu(menu_id) ON DELETE CASCADE
);