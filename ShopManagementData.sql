create database ShoppingManagement
go
use ShoppingManagement
go



CREATE TABLE "Users"(
    "user_id" INT NOT NULL,
    "username" VARCHAR(255) NOT NULL,
    "password" VARCHAR(255) NOT NULL,
    "full_name" NVARCHAR(255) NOT NULL,
    "email" VARCHAR(255) NULL,
    "address" NVARCHAR(255) NULL,
    "roles" INT NOT NULL,
    "status" BIT NOT NULL
);
ALTER TABLE
    "Users" ADD CONSTRAINT "users_user_id_primary" PRIMARY KEY("user_id");
CREATE TABLE "Registation"(
    "registration_id" INT NOT NULL,
    "user_id" INT NOT NULL,
    "product_id" INT NOT NULL,
    "quantity" INT NOT NULL,
    "totalMoney" BIGINT NOT NULL
);
ALTER TABLE
    "Registation" ADD CONSTRAINT "registation_registration_id_primary" PRIMARY KEY("registration_id");
CREATE TABLE "Wallet"(
    "wallet_id" INT NOT NULL,
    "user_id" INT NOT NULL,
    "last_money_in" BIGINT NOT NULL,
    "last_time_push_money" DATE NOT NULL
);
ALTER TABLE
    "Wallet" ADD CONSTRAINT "wallet_wallet_id_primary" PRIMARY KEY("wallet_id");
CREATE TABLE "Product_Categories"(
    "product_cate_id" INT NOT NULL,
    "cate_name" NVARCHAR(255) NOT NULL
);
ALTER TABLE
    "Product_Categories" ADD CONSTRAINT "product_categories_product_cate_id_primary" PRIMARY KEY("product_cate_id");
CREATE TABLE "Production"(
    "product_id" INT NOT NULL,
    "product_name" NVARCHAR(255) NOT NULL,
    "product_quantity" INT NOT NULL,
    "product_list_price" BIGINT NOT NULL,
    "product_sale_price" BIGINT NOT NULL,
    "product_information" NVARCHAR(255) NOT NULL,
    "product_category_id" INT NOT NULL
);
ALTER TABLE
    "Production" ADD CONSTRAINT "production_product_id_primary" PRIMARY KEY("product_id");
ALTER TABLE
    "Production" ADD CONSTRAINT "production_product_category_id_foreign" FOREIGN KEY("product_category_id") REFERENCES "Product_Categories"("product_cate_id");
ALTER TABLE
    "Wallet" ADD CONSTRAINT "wallet_user_id_foreign" FOREIGN KEY("user_id") REFERENCES "Users"("user_id");
ALTER TABLE
    "Registation" ADD CONSTRAINT "registation_user_id_foreign" FOREIGN KEY("user_id") REFERENCES "Users"("user_id");
ALTER TABLE
    "Registation" ADD CONSTRAINT "registation_product_id_foreign" FOREIGN KEY("product_id") REFERENCES "Production"("product_id");
ALTER TABLE
	Users ADD CONSTRAINT "UC_Email" UNIQUE (email);
ALTER TABLE
	Users ADD CONSTRAINT "UC_username" UNIQUE (username);

INSERT INTO Product_Categories (product_cate_id, cate_name)
VALUES (1, 'Phone');
INSERT INTO Product_Categories (product_cate_id, cate_name)
VALUES (2, 'Laptop');
INSERT INTO Product_Categories (product_cate_id, cate_name)
VALUES (3, 'Mouse');
INSERT INTO Product_Categories (product_cate_id, cate_name)
VALUES (4, 'Keybroad');
INSERT INTO Product_Categories (product_cate_id, cate_name)
VALUES (5, 'EarPhone');
INSERT INTO Product_Categories (product_cate_id, cate_name)
VALUES (6, 'VR Device');
INSERT INTO Product_Categories (product_cate_id, cate_name)
VALUES (7, 'CPU');
INSERT INTO Product_Categories (product_cate_id, cate_name)
VALUES (8, 'VGA');
INSERT INTO Product_Categories (product_cate_id, cate_name)
VALUES (9, 'RAM');
INSERT INTO Product_Categories (product_cate_id, cate_name)
VALUES (10, 'Chipset');

--phone

INSERT INTO Production (product_id, product_name, product_quantity, product_list_price, product_sale_price, product_information, product_category_id)
VALUES
    (1, 'iPhone X', 100, 999, 799, '5.8-inch OLED Display', 1),
    (2, 'Samsung Galaxy S21', 150, 899, 699, '6.2-inch Dynamic AMOLED 2X', 1),
    (3, 'Google Pixel 6', 80, 799, 699, '6.4-inch OLED Display', 1),
    (4, 'OnePlus 9 Pro', 120, 899, 799, '6.7-inch Fluid AMOLED', 1),
    (5, 'Xiaomi Mi 11', 90, 799, 699, '6.81-inch AMOLED Display', 1),
    (6, 'Apple iPhone 13', 200, 1099, 999, '6.1-inch Super Retina XDR', 1),
    (7, 'Samsung Galaxy Z Fold 3', 50, 1799, 1599, '7.6-inch Dynamic AMOLED 2X', 1),
    (8, 'OnePlus Nord 2', 110, 499, 399, '6.43-inch Fluid AMOLED', 1),
    (9, 'Google Pixel 5a', 70, 449, 399, '6.34-inch OLED Display', 1),
    (10, 'Xiaomi Redmi Note 10', 130, 249, 199, '6.43-inch AMOLED Display', 1);

--laptop
INSERT INTO Production (product_id, product_name, product_quantity, product_list_price, product_sale_price, product_information, product_category_id)
VALUES
    (11, 'Dell XPS 13', 50, 1399, 1199, '13.4-inch 4K UHD+ Display', 2),
    (12, 'Apple MacBook Air', 80, 999, 899, '13.3-inch Retina Display', 2),
    (13, 'HP Spectre x360', 60, 1299, 1099, '13.3-inch OLED Touchscreen', 2),
    (14, 'Lenovo ThinkPad X1 Carbon', 70, 1499, 1299, '14-inch 4K UHD Display', 2),
    (15, 'Asus ROG Zephyrus G14', 40, 1499, 1299, '14-inch QHD Display', 2),
    (16, 'Microsoft Surface Laptop 4', 65, 1199, 999, '13.5-inch PixelSense Touchscreen', 2),
    (17, 'Acer Predator Helios 300', 30, 1099, 999, '15.6-inch Full HD 144Hz Display', 2),
    (18, 'Lenovo IdeaPad 5', 90, 699, 599, '15.6-inch FHD IPS Display', 2),
    (19, 'Asus ZenBook 14', 55, 999, 899, '14-inch Full HD Display', 2),
    (20, 'HP Envy x360', 75, 799, 699, '15.6-inch Full HD Touchscreen', 2);

INSERT INTO Production (product_id, product_name, product_quantity, product_list_price, product_sale_price, product_information, product_category_id)
VALUES
    (21, 'Logitech MX Master 3', 100, 79, 69, 'Wireless Mouse with Advanced Features', 3),
    (22, 'Razer DeathAdder Elite', 150, 69, 59, 'High-Precision Gaming Mouse', 3),
    (23, 'Corsair Dark Core RGB', 80, 79, 69, 'Wireless Gaming Mouse with RGB Lighting', 3),
    (24, 'SteelSeries Rival 600', 120, 89, 79, 'Dual Optical Sensor Gaming Mouse', 3),
    (25, 'Microsoft Surface Precision Mouse', 90, 89, 79, 'Highly Customizable Mouse', 3),
    (26, 'Logitech G Pro Wireless', 200, 129, 119, 'Professional-Grade Wireless Gaming Mouse', 3),
    (27, 'HP X500 Wired Mouse', 50, 19, 14, 'Basic Optical Mouse', 3),
    (28, 'Dell MS116 Wired Mouse', 110, 14, 10, 'Simple and Reliable Mouse', 3),
    (29, 'Anker Ergonomic Vertical Mouse', 70, 29, 24, 'Ergonomic Design for Comfort', 3),
    (30, 'Apple Magic Mouse 2', 130, 79, 69, 'Wireless Multi-Touch Mouse', 3);

INSERT INTO Production (product_id, product_name, product_quantity, product_list_price, product_sale_price, product_information, product_category_id)
VALUES
    (31, 'Logitech G Pro X Mechanical Keyboard', 100, 129, 109, 'Mechanical Gaming Keyboard', 4),
    (32, 'Corsair K95 RGB Platinum XT', 150, 199, 179, 'RGB Mechanical Gaming Keyboard', 4),
    (33, 'Razer BlackWidow Elite', 80, 129, 109, 'Mechanical Gaming Keyboard with RGB', 4),
    (34, 'SteelSeries Apex Pro', 120, 199, 179, 'Adjustable Mechanical Gaming Keyboard', 4),
    (35, 'Ducky One 2 Mini', 90, 99, 89, '60% Compact Mechanical Keyboard', 4),
    (36, 'Apple Magic Keyboard', 200, 99, 89, 'Wireless Keyboard for Mac', 4),
    (37, 'Microsoft Ergonomic Keyboard', 50, 59, 49, 'Ergonomically Designed Keyboard', 4),
    (38, 'HP Wireless Keyboard and Mouse Combo', 110, 29, 24, 'Wireless Keyboard and Mouse Set', 4),
    (39, 'Logitech K780 Multi-Device Wireless Keyboard', 70, 49, 39, 'Multi-Device Keyboard', 4),
    (40, 'Acer Predator Aethon 300 Mechanical Gaming Keyboard', 130, 89, 79, 'Mechanical Gaming Keyboard', 4);

INSERT INTO Production (product_id, product_name, product_quantity, product_list_price, product_sale_price, product_information, product_category_id)
VALUES
    (41, 'Apple AirPods Pro', 100, 249, 199, 'Wireless Noise-Canceling Earbuds', 5),
    (42, 'Sony WF-1000XM4', 150, 229, 199, 'Wireless Noise-Canceling Earbuds', 5),
    (43, 'JBL Free X', 80, 99, 79, 'Wireless In-Ear Headphones', 5),
    (44, 'Bose QuietComfort Earbuds', 120, 279, 249, 'Wireless Noise-Canceling Earbuds', 5),
    (45, 'Samsung Galaxy Buds Pro', 90, 199, 169, 'Wireless Earbuds with ANC', 5),
    (46, 'Beats Powerbeats Pro', 200, 249, 219, 'Wireless Sport Earbuds', 5),
    (47, 'Anker SoundCore Liberty Air 2 Pro', 50, 99, 79, 'Wireless Earbuds with ANC', 5),
    (48, 'Skullcandy Indy Evo', 110, 79, 59, 'Wireless Earbuds with Touch Controls', 5),
    (49, 'Sennheiser Momentum True Wireless 2', 70, 299, 249, 'Premium Wireless Earbuds', 5),
    (50, 'Google Pixel Buds', 130, 179, 149, 'Wireless Earbuds with Google Assistant', 5);

INSERT INTO Production (product_id, product_name, product_quantity, product_list_price, product_sale_price, product_information, product_category_id)
VALUES
    (51, 'Oculus Quest 2', 100, 299, 249, 'Wireless VR Headset', 6),
    (52, 'PlayStation VR', 150, 349, 299, 'VR Headset for PS4/PS5', 6),
    (53, 'HTC Vive Pro 2', 80, 799, 699, 'High-Resolution VR Headset', 6),
    (54, 'Valve Index', 120, 999, 899, 'PC-Connected VR System', 6),
    (55, 'Samsung HMD Odyssey', 90, 499, 399, 'Windows Mixed Reality Headset', 6),
    (56, 'HP Reverb G2', 200, 599, 499, 'VR Headset with High Resolution', 6),
    (57, 'Pimax 8K Plus', 50, 1299, 1099, 'Ultra-Wide Field of View VR Headset', 6),
    (58, 'Oculus Rift S', 110, 399, 299, 'PC-Powered VR Gaming', 6),
    (59, 'Acer OJO 500', 70, 299, 249, 'Windows Mixed Reality Headset', 6),
    (60, 'Lenovo Mirage Solo', 130, 299, 249, 'Standalone Daydream VR Headset', 6);

INSERT INTO Production (product_id, product_name, product_quantity, product_list_price, product_sale_price, product_information, product_category_id)
VALUES
    (61, 'Intel Core i9-11900K', 100, 499, 449, 'Desktop Processor, 11th Gen, 8 Cores', 7),
    (62, 'AMD Ryzen 9 5950X', 150, 749, 699, 'Desktop Processor, 16 Cores', 7),
    (63, 'Intel Core i7-11700K', 80, 399, 349, 'Desktop Processor, 11th Gen, 8 Cores', 7),
    (64, 'AMD Ryzen 7 5800X', 120, 449, 399, 'Desktop Processor, 8 Cores', 7),
    (65, 'Intel Core i5-11600K', 90, 299, 249, 'Desktop Processor, 11th Gen, 6 Cores', 7),
    (66, 'AMD Ryzen 5 5600X', 200, 299, 249, 'Desktop Processor, 6 Cores', 7),
    (67, 'Intel Core i3-10100', 50, 149, 129, 'Desktop Processor, 10th Gen, 4 Cores', 7),
    (68, 'AMD Ryzen 3 3300X', 110, 129, 109, 'Desktop Processor, 4 Cores', 7),
    (69, 'Intel Xeon W-3175X', 70, 2999, 2499, 'High-End Desktop Processor, 28 Cores', 7),
    (70, 'AMD EPYC 7742', 130, 6999, 5999, 'Server Processor, 64 Cores', 7);

INSERT INTO Production (product_id, product_name, product_quantity, product_list_price, product_sale_price, product_information, product_category_id)
VALUES
    (71, 'NVIDIA GeForce RTX 3090', 100, 1499, 1299, 'Graphics Card, 24GB GDDR6X', 8),
    (72, 'AMD Radeon RX 6900 XT', 150, 999, 899, 'Graphics Card, 16GB GDDR6', 8),
    (73, 'NVIDIA GeForce RTX 3080', 80, 799, 699, 'Graphics Card, 10GB GDDR6X', 8),
    (74, 'AMD Radeon RX 6800 XT', 120, 649, 599, 'Graphics Card, 16GB GDDR6', 8),
    (75, 'NVIDIA GeForce RTX 3070', 90, 499, 449, 'Graphics Card, 8GB GDDR6', 8),
    (76, 'AMD Radeon RX 6700 XT', 200, 479, 429, 'Graphics Card, 12GB GDDR6', 8),
    (77, 'NVIDIA GeForce GTX 1660 Super', 50, 249, 229, 'Graphics Card, 6GB GDDR5', 8),
    (78, 'AMD Radeon RX 6600 XT', 110, 379, 329, 'Graphics Card, 8GB GDDR6', 8),
    (79, 'NVIDIA Quadro GV100', 70, 8999, 7999, 'Professional Graphics Card, 32GB HBM2', 8),
    (80, 'AMD Radeon Pro WX 7100', 130, 499, 449, 'Professional Graphics Card, 8GB GDDR5', 8);

INSERT INTO Production (product_id, product_name, product_quantity, product_list_price, product_sale_price, product_information, product_category_id)
VALUES
    (81, 'Corsair Vengeance LPX 16GB DDR4', 100, 79, 69, '16GB DDR4 RAM, 3200MHz', 9),
    (82, 'Crucial Ballistix 32GB DDR4', 150, 129, 119, '32GB DDR4 RAM, 3600MHz', 9),
    (83, 'G.Skill Ripjaws V 8GB DDR4', 80, 49, 39, '8GB DDR4 RAM, 3000MHz', 9),
    (84, 'Kingston HyperX Fury 64GB DDR4', 120, 199, 179, '64GB DDR4 RAM, 3200MHz', 9),
    (85, 'Team T-FORCE DARK Z 16GB DDR4', 90, 69, 59, '16GB DDR4 RAM, 3600MHz', 9),
    (86, 'Corsair Dominator Platinum RGB 32GB DDR4', 200, 229, 199, '32GB DDR4 RAM, 3600MHz', 9),
    (87, 'Patriot Viper Steel 16GB DDR4', 50, 79, 69, '16GB DDR4 RAM, 4400MHz', 9),
    (88, 'ADATA XPG GAMMIX D30 32GB DDR4', 110, 99, 89, '32GB DDR4 RAM, 3200MHz', 9),
    (89, 'Crucial Ballistix MAX 64GB DDR4', 70, 199, 179, '64GB DDR4 RAM, 4000MHz', 9),
    (90, 'Corsair Vengeance RGB Pro 16GB DDR4', 130, 89, 79, '16GB DDR4 RAM, 3200MHz', 9);

INSERT INTO Production (product_id, product_name, product_quantity, product_list_price, product_sale_price, product_information, product_category_id)
VALUES
    (91, 'Intel Z690 Chipset', 100, 149, 129, 'High-End Desktop Chipset', 10),
    (92, 'AMD B550 Chipset', 150, 99, 89, 'Mid-Range Desktop Chipset', 10),
    (93, 'Intel H670 Chipset', 80, 129, 109, 'Mainstream Desktop Chipset', 10),
    (94, 'AMD X570 Chipset', 120, 169, 149, 'High-End Desktop Chipset', 10),
    (95, 'Intel B660 Chipset', 90, 89, 79, 'Mainstream Desktop Chipset', 10),
    (96, 'AMD A520 Chipset', 200, 59, 49, 'Entry-Level Desktop Chipset', 10),
    (97, 'Intel H410 Chipset', 50, 49, 39, 'Entry-Level Desktop Chipset', 10),
    (98, 'AMD X470 Chipset', 110, 149, 129, 'High-End Desktop Chipset (Previous Gen)', 10),
    (99, 'Intel Z590 Chipset', 70, 179, 159, 'High-End Desktop Chipset', 10),
    (100, 'AMD B450 Chipset', 130, 89, 79, 'Mid-Range Desktop Chipset (Previous Gen)', 10);

--USERS

INSERT INTO Users (user_id, username, password, full_name, email, address, roles, status)
VALUES
    (1, 'admin', 'admin', 'Cao Hung', 'hungcaothinh431@gmail.com', '123 Main St', 1, 1),
    (2, 'alicesmith456', 'secret789', 'Alice Smith', 'alice@example.com', '456 Elm St', 2, 1),
    (3, 'bobjones789', 'p@ssw0rd', 'Bob Jones', 'bob@example.com', '789 Oak St', 3, 0),
    (4, 'susanwhite101', 'susan123', 'Susan White', 'susan@example.com', '101 Maple St', 1, 1),
    (5, 'mikejackson222', 'mikepw', 'Mike Jackson', 'mike@example.com', '222 Pine St', 2, 0),
    (6, 'lindaadams333', 'lindapass', 'Linda Adams', 'linda@example.com', '333 Cedar St', 3, 1),
    (7, 'davidwilson444', 'davidpass', 'David Wilson', 'david@example.com', '444 Birch St', 1, 0),
    (8, 'emilybrown555', 'emilypw', 'Emily Brown', 'emily@example.com', '555 Walnut St', 2, 1),
    (9, 'robertjenkins666', 'robertpw', 'Robert Jenkins', 'robert@example.com', '666 Cherry St', 3, 1),
    (10, 'sarahmiller777', 'sarahpass', 'Sarah Miller', 'sarah@example.com', '777 Sycamore St', 1, 0),
    (11, 'peterdavis888', 'peterpw', 'Peter Davis', 'peter@example.com', '888 Redwood St', 2, 1),
    (12, 'lauraclark999', 'laurapass', 'Laura Clark', 'laura@example.com', '999 Cedarwood St', 3, 1),
    (13, 'kevinwright123', 'kevin123', 'Kevin Wright', 'kevin@example.com', '123 Oakwood St', 1, 0),
    (14, 'jessicahall234', 'jessicapw', 'Jessica Hall', 'jessica@example.com', '234 Maplewood St', 2, 1),
    (15, 'williambaker345', 'williampw', 'William Baker', 'william@example.com', '345 Sprucewood St', 3, 1),
    (16, 'marygreen456', 'mary123', 'Mary Green', 'mary@example.com', '456 Piney St', 1, 0),
    (17, 'michaeladams567', 'michaelpw', 'Michael Adams', 'michael@example.com', '567 Birchwood St', 2, 1),
    (18, 'jenniferroberts678', 'jennifer123', 'Jennifer Roberts', 'jennifer@example.com', '678 Willow St', 3, 1),
    (19, 'richardcarter789', 'richardpw', 'Richard Carter', 'richard@example.com', '789 Cedarlane St', 1, 0),
    (20, 'lisaharris890', 'lisapw', 'Lisa Harris', 'lisa@example.com', '890 Oakridge St', 2, 1);
INSERT INTO Users (user_id, username, password, full_name, email, address, roles, status)
VALUES
    (21, 'dianajones111', 'dianapw', 'Diana Jones', 'diana@example.com', '111 Oak St', 2, 1),
    (22, 'samroberts222', 'sampw', 'Sam Roberts', 'sam@example.com', '222 Elm St', 1, 1),
    (23, 'steveadams333', 'stevepw', 'Steve Adams', 'steve@example.com', '333 Maple St', 3, 0),
    (24, 'laurawilson444', 'laurapw', 'Laura Wilson', 'laura@example.com', '444 Birch St', 1, 1),
    (25, 'alexthomas555', 'alexpw', 'Alex Thomas', 'alex@example.com', '555 Cedar St', 2, 0),
    (26, 'oliviasmith666', 'oliviapw', 'Olivia Smith', 'olivia@example.com', '666 Pine St', 3, 1),
    (27, 'robertwhite777', 'robertpw', 'Robert White', 'robert@example.com', '777 Oakwood St', 1, 1),
    (28, 'graceevans888', 'gracepw', 'Grace Evans', 'grace@example.com', '888 Walnut St', 2, 0),
    (29, 'williamjohnson999', 'williampw', 'William Johnson', 'william@example.com', '999 Cedar St', 3, 1),
    (30, 'lucybrown123', 'lucypw', 'Lucy Brown', 'lucy@example.com', '123 Spruce St', 1, 0),
    (31, 'josephmiller234', 'josephpw', 'Joseph Miller', 'joseph@example.com', '234 Piney St', 2, 1),
    (32, 'emilydavis345', 'emilypw', 'Emily Davis', 'emily@example.com', '345 Oakridge St', 3, 1),
    (33, 'michaelhall456', 'michaelpw', 'Michael Hall', 'michael@example.com', '456 Cedarwood St', 1, 0),
    (34, 'sophiaroberts567', 'sophiapw', 'Sophia Roberts', 'sophia@example.com', '567 Willow St', 2, 1),
    (35, 'danielthomas678', 'danielpw', 'Daniel Thomas', 'daniel@example.com', '678 Cedarlane St', 3, 1),
    (36, 'oliviajackson789', 'oliviapw', 'Olivia Jackson', 'olivia@example.com', '789 Oakridge St', 1, 0),
    (37, 'benjaminwilson890', 'benjaminpw', 'Benjamin Wilson', 'benjamin@example.com', '890 Maplewood St', 2, 1),
    (38, 'victoriamartin901', 'victoriapw', 'Victoria Martin', 'victoria@example.com', '901 Redwood St', 3, 1),
    (39, 'matthewadams012', 'matthewpw', 'Matthew Adams', 'matthew@example.com', '012 Pinegrove St', 1, 0),
    (40, 'zoebaker123', 'zoepw', 'Zoe Baker', 'zoe@example.com', '123 Oakhill St', 2, 1);

--Wallet
INSERT INTO Wallet (wallet_id, user_id, last_money_in, last_time_push_money)
VALUES
    (1, 1, 1000, '2023-10-01'),
    (2, 2, 2000, '2023-10-02'),
    (3, 3, 3000, '2023-10-03'),
    (4, 4, 4000, '2023-10-04'),
    (5, 5, 5000, '2023-10-05'),
    (6, 6, 6000, '2023-10-06'),
    (7, 7, 7000, '2023-10-07'),
    (8, 8, 8000, '2023-10-08'),
    (9, 9, 9000, '2023-10-09'),
    (10, 10, 10000, '2023-10-10'),
    (11, 11, 11000, '2023-10-11'),
    (12, 12, 12000, '2023-10-12'),
    (13, 13, 13000, '2023-10-13'),
    (14, 14, 14000, '2023-10-14'),
    (15, 15, 15000, '2023-10-15'),
    (16, 16, 16000, '2023-10-16'),
    (17, 17, 17000, '2023-10-17'),
    (18, 18, 18000, '2023-10-18'),
    (19, 19, 19000, '2023-10-19'),
    (20, 20, 20000, '2023-10-20'),
    (21, 21, 21000, '2023-10-21'),
    (22, 22, 22000, '2023-10-22'),
    (23, 23, 23000, '2023-10-23'),
    (24, 24, 24000, '2023-10-24'),
    (25, 25, 25000, '2023-10-25'),
    (26, 26, 26000, '2023-10-26'),
    (27, 27, 27000, '2023-10-27'),
    (28, 28, 28000, '2023-10-28'),
    (29, 29, 29000, '2023-10-29'),
    (30, 30, 30000, '2023-10-30'),
    (31, 31, 31000, '2023-10-31'),
    (32, 32, 32000, '2023-11-01'),
    (33, 33, 33000, '2023-11-02'),
    (34, 34, 34000, '2023-11-03'),
    (35, 35, 35000, '2023-11-04'),
    (36, 36, 36000, '2023-11-05'),
    (37, 37, 37000, '2023-11-06'),
    (38, 38, 38000, '2023-11-07'),
    (39, 39, 39000, '2023-11-08'),
    (40, 40, 40000, '2023-11-09');


--Registration

-- Insert 50 rows into the Registration table with product_id ranging from 1 to 100

INSERT INTO "Registation" ("registration_id", "user_id", "product_id", "quantity", "totalMoney")
SELECT
    ROW_NUMBER() OVER (ORDER BY "user_id", "product_id") AS "registration_id",
    u."user_id",
    p."product_id",
    1 AS "quantity",
    100 AS "totalMoney"
FROM
    "Users" u
CROSS JOIN
    "Production" p
WHERE
    u."user_id" BETWEEN 1 AND 40
AND
    p."product_id" BETWEEN 1 AND 100;

SELECT * FROM Production p
JOIN Product_Categories pc
ON p.product_category_id = pc.product_cate_id