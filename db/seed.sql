INSERT INTO users(user_id, name, email, password, role, status)
VALUES(1, 'jeffrey sarmiento', 'jeffreysarmiento@gmail.com', 'admin12345', 'Admin', 'Active');

INSERT INTO menu(user_id, category ,price, description, tag)
VALUES(1, 'Food',  213.20, 'Pasta Carbonara', 'Popular');

INSERT INTO events(user_id, title, date, time, category, price, slots, status)
VALUES(1, 'Wedding Reception', '2026-05-20', '12:00:00', 'Wedding', 15000.00, 100, 'Active');

INSERT INTO messages(user_id, topic, message, date, status)
VALUES(1, 'Recommendation', 'Whats your popular product', '2026-05-20', 'Pending');