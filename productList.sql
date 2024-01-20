CREATE TABLE product (
    id SERIAL PRIMARY KEY,
    img VARCHAR(500),
    name VARCHAR(500) NOT NULL,
    price DECIMAL(10, 3),
    category VARCHAR(255) DEFAULT 'Unknown' NOT NULL
);

INSERT INTO product (img, name, price, category) VALUES
('images/menu/menu-ca phe.jpg', 'Caffe đen', 15.000, 'Coffe'),
('images/menu/menu-ca phe sua.jpg', 'Cà phê sữa', 20.000, 'Coffe'),
('images/menu/menu-bac xiu.jpg', 'Bạc xỉu', 20.000, 'Coffe'),
('images/menu/menu-cacao sua.jpg', 'Ca cao sữa', 30.000, 'Coffe'),
('images/menu/menu-espresso.jpg', 'Espresso', 35.000, 'Coffe'),
('images/menu/menu-latte.jpg', 'Latte', 35.000, 'Coffe'),
('images/menu/menu-mocha.jpg', 'Mocha', 30.000, 'Coffe'),
('images/menu/menu-tra sua bac ha.jpg', 'Trà sữa bạc hà', 35.000, 'Trà sữa'),
('images/menu/menu-tra sua khoai mon.jpg', 'Trà sữa khoai môn', 35.000, 'Trà sữa'),
('images/menu/menu-tra sua mat cha.jpg', 'Trà sữa matcha', 35.000, 'Trà sữa'),
('images/menu/menu-tra-sua-ruyen-thong.jpg', 'Trà sữa truyền thống', 35.000, 'Trà sữa'),
('images/menu/menu-tra sua socola.jpg', 'Trà sữa socola', 38.000, 'Trà sữa'),
('images/menu/menu-tra sua dau.jpg', 'Trà sữa dâu', 35.000, 'Trà sữa'),
('images/menu/menu-tra sua viet quat.jpg', 'Trà sữa việt quất', 45.000, 'Trà sữa'),
('images/menu/menu-tra sua thai xanh.jpg', 'Trà sữa thái xanh', 40.000, 'Trà sữa'),
('images/menu/menu-tra bac ha.jpg', 'Trà bạc hà', 35.000, 'Trà'),
('images/menu/menu-tra dao.jpg', 'Trà đào', 35.000, 'Trà'),
('images/menu/menu-tra vai.jpg', 'Trà vải', 35.000, 'Trà'),
('images/menu/menu-tra chanh.jpg', 'Trà chanh', 30.000, 'Trà'),
('images/menu/menu-tra oi.jpg', 'Trà ổi', 35.000, 'Trà'),
('images/menu/menu-tra mang cau.jpg', 'Trà mãng cầu', 30.000, 'Trà'),
('images/menu/menu-tra nhiet doi.jpg', 'Trà nhiệt đới', 25.000, 'Trà'),
('images/menu/menu-hong tra.jpg', 'Hồng trà', 20.000, 'Trà'),
('images/menu/menu-oi ep.jpg', 'Sinh tố ổi', 25.000, 'Sinh tố'),
('images/menu/menu-cam ep.jpg', 'Cam ép', 25.000, 'Sinh tố'),
('images/menu/menu-sinh to dua.jpg', 'Sinh tố dừa', 25.000, 'Sinh tố'),
('images/menu/menu-nuoc ep dua hau.jpg', 'Sinh tố dưa hấu', 30.000, 'Sinh tố'),
('images/menu/menu-nuoc ep ca rot.jpg', 'Sinh tố cà rốt', 25.000, 'Sinh tố'),
('images/menu/menu-thom ep.jpg', 'Sinh tố thơm', 25.000, 'Sinh tố'),
('images/menu/menu-sinh to bo.jpg', 'Sinh tố bơ', 35.000, 'Sinh tố'),
('images/menu/menu-sinh to dau.jpg', 'Sinh tố dâu', 25.000, 'Sinh tố'),
('images/menu/menu-tra xanh 0 do.jpg', 'Trà xanh không độ', 15.000, 'Trà'),
('images/menu/menu-coca.png', 'Cocacola', 15.000, 'Nước ngọt'),
('images/menu/menu-pepsi.jpg', 'Pepsi', 15.000, 'Nước ngọt'),
('images/menu/menu-nuoc suoi.jpg', 'Nước suối', 10.000, 'Nước ngọt'),
('images/menu/menu-redbull.jpg', 'Redbull', 20.000, 'Nước ngọt'),
('images/menu/menu-sting.jpg', 'Sting', 20.000, 'Nước ngọt'),  
('images/menu/menu-C2.jpg', 'C2', 15.000, 'Nước ngọt'),
('images/menu/menu-7up.jpg', '7up', 20.000, 'Nước ngọt'),
('images/menu/menu-soda bac ha.jpg', 'Soda bạc hà', 25.000, 'Soda'),
('images/menu/menu-soda blue.jpg', 'Soda blue', 25.000, 'Soda'),
('images/menu/menu-soda chanh.jpg', 'Soda chanh', 20.000, 'Soda'),
('images/menu/menu- soda viet quat.jpg', 'Soda việt quất', 25.000, 'Soda'),
('images/menu/menu-soda chanh dây.jpg', 'Soda chanh dây', 25.000, 'Soda'),
('images/menu/menu-soda dau.jpg', 'Soda dâu', 25.000, 'Soda'),
('images/menu/menu-soda dao.jpg', 'Soda đào', 25.000, 'Soda');

CREATE TABLE admin (
    username VARCHAR(255) NOT NULL PRIMARY KEY,
    password VARCHAR(255) NOT NULL
);

INSERT INTO admin (username, password) VALUES
('giangkoli', 'giang123');

CREATE TABLE users (
	id SERIAL PRIMARY KEY,
    email VARCHAR(255),
    username VARCHAR(255) UNIQUE,
    password VARCHAR(255),
    otp INT
);

CREATE TABLE shopping_cart (
    user_id INT REFERENCES users(id),
    product_id INT REFERENCES product(id),
    quantity INT DEFAULT 1,
    PRIMARY KEY (user_id, product_id)
);

CREATE TABLE comment (
    comment_id SERIAL PRIMARY KEY,
    comment_content VARCHAR(500) NOT NULL,
    username_comment VARCHAR(255) NOT NULL REFERENCES users(username)
);

SELECT * FROM product;
SELECT * FROM admin;
SELECT * FROM users;
SELECT * FROM shopping_cart;
SELECT * FROM comment;

INSERT INTO shopping_cart (user_id, product_id, quantity) VALUES
(1, 2, 1);

SELECT product.img, product.name, product.price, shopping_cart.quantity
FROM shopping_cart
JOIN users ON shopping_cart.user_id = users.id
JOIN product ON shopping_cart.product_id = product.id
WHERE users.id = 1;