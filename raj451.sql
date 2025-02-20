Create database Food_delivery;
use Food_delivery;
-- User Table
CREATE TABLE User (
    UserID INT PRIMARY KEY AUTO_INCREMENT,
    UserName VARCHAR(50),
    UserEmail VARCHAR(100),
    UserPhone VARCHAR(15),
    UserAddress TEXT,
    PasswordHash VARCHAR(255)
);

-- Restaurant Table
CREATE TABLE Restaurant (
    RestaurantID INT PRIMARY KEY AUTO_INCREMENT,
    RestaurantName VARCHAR(100),
    RestaurantAddress TEXT,
    RestaurantPhone VARCHAR(15),
    RestaurantEmail VARCHAR(100),
    CuisineType VARCHAR(50),
    AverageRating DECIMAL(2,1),
    OpeningHours VARCHAR(50)
);

-- Menu Table
CREATE TABLE Menu (
    MenuID INT PRIMARY KEY AUTO_INCREMENT,
    RestaurantID INT,
    DishName VARCHAR(100),
    DishDescription TEXT,
    DishPrice DECIMAL(8,2),
    DishImage VARCHAR(255),
    FOREIGN KEY (RestaurantID) REFERENCES Restaurant(RestaurantID)
);

-- Order Table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT,
    RestaurantID INT,
    OrderStatus VARCHAR(50),
    OrderDate DATETIME,
    TotalAmount DECIMAL(8,2),
    FOREIGN KEY (UserID) REFERENCES User(UserID),
    FOREIGN KEY (RestaurantID) REFERENCES Restaurant(RestaurantID)
);

-- OrderDetails Table
CREATE TABLE OrderDetails (
    OrderDetailsID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    MenuID INT,
    Quantity INT,
    Price DECIMAL(8,2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (MenuID) REFERENCES Menu(MenuID)
);

-- Payment Table
CREATE TABLE Payment (
    PaymentID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    PaymentStatus VARCHAR(50),
    PaymentMethod VARCHAR(50),
    PaymentDate DATETIME,
    TransactionID VARCHAR(50),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Review Table
CREATE TABLE Review1 (
    RestaurantID INT,
    UserID INT,
    Rating INT,
    ReviewText TEXT,
    ReviewDate DATETIME,
    FOREIGN KEY (RestaurantID) REFERENCES Restaurant(RestaurantID),
    FOREIGN KEY (UserID) REFERENCES User(UserID)
);

-- Delivery Table
CREATE TABLE Delivery (
    DeliveryID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    DeliveryPersonID INT,
    DeliveryStatus VARCHAR(50),
    EstimatedTime DATETIME,
    ActualDeliveryTime DATETIME,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (DeliveryPersonID) REFERENCES DeliveryPerson(DeliveryPersonID)
);

-- DeliveryPerson Table
CREATE TABLE DeliveryPerson (
    DeliveryPersonID INT PRIMARY KEY AUTO_INCREMENT,
    DeliveryPersonName VARCHAR(50),
    DeliveryPersonPhone VARCHAR(15),
    VehicleDetails VARCHAR(100)
);
INSERT INTO User (UserID, UserName, UserEmail, UserPhone, UserAddress, PasswordHash)
VALUES ('101','John kadam', 'john.kadam@gmail.com', '9876543210', '123 Main St', '#_1234'),
        ('102','Mohan pingle', 'mohan@gmail.com', '9876783210', '123 same rtw', '#_6789'),
        ('103','Sam Pawar', 'Sam.pawar@gmail.com', '7675747373', '6969 Main St', '#_19874'),
        ('104','Soham shaikh', 'shaikh@gmail.com', '9876543210', '123 down St', '#_12654'),
        ('105','Rohan purohit', 'rpurohit@gmail.com', '9876543870', '321 up Main St', '#_1974'),
        ('106','Sufiyan kadam', 'sufikadam@gmail.com', '9675443210', '123 homeSt', '#_674');

INSERT INTO Restaurant (RestaurantName, RestaurantAddress, RestaurantPhone, RestaurantEmail, CuisineType, AverageRating, OpeningHours)
VALUES ('Delicious Diner', '456 Culinary Blvd', '0123456789', 'diner@example.com', 'American', 4.5, '9 AM - 9 PM'),
        ('Royal orchids', '456 lxm rwd', '01234559869', 'royalorchidcuisine@example.com', 'Italian', 4.0, '9 AM - 9 PM'),
		('Toyam', '456 foam arcade', '2345456789', 'eattoyam@example.com', 'Indian', 4.5, '9 AM - 9 PM'),
        ('Motel Visava', '43 palm beach road', '0123456789', 'mvisava@example.com', 'Indian-Chinese', 4.5, '9 AM - 9 PM'),
        ('SP Biryani house', '47/58 peth road', '0123456789', 'spbiryani@example.com', 'Indian', 4.0, '9 AM - 9 PM'),
        ('Hotel Modak', 'sinhgad road', '8888456789', 'modakveg@example.com', 'Maharashtrian', 4.5, '9 AM - 9 PM');
	
INSERT INTO Menu (RestaurantID, DishName, DishDescription, DishPrice, DishImage)
VALUES (1, 'Cheeseburger', 'A juicy beef burger with cheese', 8.99, 'cheeseburger.jpg'),
       (2, 'whitesauce pasta','A saucy White pasta', 8.99, 'whitesauuce pasta.jpg'),
       (3, 'Butter Chicken', 'A creamy, mildly spiced curry made with tender chicken pieces cooked in a rich tomato-based sauce with butter and cream', 8.99, 'Butter Chicken.jpg'),
	   (4, 'Chicken chilly','A spicy and tangy dish made with crispy fried chicken tossed in a flavorful sauce of soy sauce, vinegar, garlic, green chilies, and capsicum.', 8.99, 'Chicken Chilly.jpg'),
       (5, 'Biryani', 'A flavorful and aromatic rice dish made with basmati rice, marinated meat (chicken, mutton, or beef), and a blend of Indian spices.', 8.99, 'Biryani.jpg'),
       (6, 'Modak', 'A sweet dumpling made of rice flour stuffed with coconut and jaggery, flavored with cardamom.', 8.99, 'modak.jpg');
       
       -- Order 2
INSERT INTO Orders (UserID, RestaurantID, OrderStatus, OrderDate, TotalAmount)
VALUES (2, 2, 'Confirmed', NOW(), 15.49);

-- Order 3
INSERT INTO Orders (UserID, RestaurantID, OrderStatus, OrderDate, TotalAmount)
VALUES (3, 1, 'Delivered', NOW(), 25.99);

-- Order 4
INSERT INTO Orders (UserID, RestaurantID, OrderStatus, OrderDate, TotalAmount)
VALUES (4, 3, 'Pending', NOW(), 12.75);

-- Order 5
INSERT INTO Orders (UserID, RestaurantID, OrderStatus, OrderDate, TotalAmount)
VALUES (5, 2, 'Cancelled', NOW(), 19.80);

-- Order 6
INSERT INTO Orders (UserID, RestaurantID, OrderStatus, OrderDate, TotalAmount)
VALUES (6, 1, 'Out for Delivery', NOW(), 23.65);

INSERT INTO Orders (UserID, RestaurantID, OrderStatus, OrderDate, TotalAmount)
VALUES 
(2, 2, 'Confirmed', NOW(), 15.49),
(3, 1, 'Delivered', NOW(), 25.99),
(4, 3, 'Pending', NOW(), 12.75),
(5, 2, 'Cancelled', NOW(), 19.80),
(6, 1, 'Out for Delivery', NOW(), 23.65);

INSERT INTO DeliveryPerson (DeliveryPersonName, DeliveryPersonPhone, VehicleDetails)  
VALUES  
    ('Ramesh Gupta', '9876543210', 'Honda Activa - MH12AB1234'),  
    ('Suresh Kumar', '9876509876', 'Bajaj Pulsar - MH14XY5678'),  
    ('Priya Sharma', '9823456789', 'TVS Jupiter - DL8SZX2345'),  
    ('Amit Verma', '9812345678', 'Royal Enfield - UP16YZ9876'),  
    ('Neha Patil', '9856789012', 'Suzuki Access - KA05MN4321');  

INSERT INTO Delivery (OrderID, DeliveryPersonID, DeliveryStatus, EstimatedTime, ActualDeliveryTime)
VALUES 
(1, 1, 'Out for Delivery', NOW(), NULL),
(2, 2, 'Delivered', NOW(), NOW() - INTERVAL 1 HOUR),
(3, 3, 'Pending', NOW() + INTERVAL 30 MINUTE, NULL),
(4, 1, 'Cancelled', NOW(), NULL),
(5, 2, 'Delivered', NOW(), NOW() - INTERVAL 45 MINUTE),
(6, 3, 'Out for Delivery', NOW(), NULL);

INSERT INTO Payment (OrderID, PaymentStatus, PaymentMethod, PaymentDate, TransactionID)  
VALUES  
    (1, 'Completed', 'Credit Card', '2024-02-10 14:30:00', 'TXN12345678'),  
    (2, 'Pending', 'UPI', '2024-02-11 16:45:00', 'TXN98765432'),  
    (3, 'Failed', 'Net Banking', '2024-02-12 12:15:00', 'TXN56789012'),  
    (4, 'Completed', 'Cash on Delivery', '2024-02-13 18:20:00', 'TXN34567890'),  
    (5, 'Completed', 'Debit Card', '2024-02-14 10:05:00', 'TXN87654321');  


INSERT INTO Review1 ( RestaurantID, UserID, Rating, ReviewText, ReviewDate)  
VALUES  
    (1, 101, 5, 'Delicious food and excellent service. Highly recommend!', '2024-02-01 19:30:00'),  
    (2, 102, 4, 'Great ambiance but slightly expensive.', '2024-02-05 14:15:00'),  
    (3, 103, 3, 'Food was okay, but service was slow.', '2024-02-10 18:45:00'),  
    (1, 104, 5, 'Loved the biryani! Will visit again.', '2024-02-12 20:00:00'),  
    (2, 105, 2, 'Unhygienic conditions and poor customer service.', '2024-02-15 12:30:00');

SELECT * FROM User;
SELECT * FROM Restaurant;
SELECT * FROM  Menu;
SELECT * FROM  orders;
SELECT * FROM  DeliveryPerson;
SELECT * FROM Delivery;
SELECT * FROM Review1;
SELECT * FROM Payment;




