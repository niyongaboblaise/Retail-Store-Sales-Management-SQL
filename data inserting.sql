--inserting data in all tables


INSERT INTO Regions VALUES
(1, 'Kigali'),
(2, 'Southern'),
(3, 'Northern'),
(4, 'Western');

INSERT INTO Branches VALUES
(1, 1, 'Kigali Main Branch', 'Kigali'),
(2, 2, 'Huye Branch', 'Huye'),
(3, 3, 'Musanze Branch', 'Musanze'),
(4, 4, 'Rubavu Branch', 'Rubavu');

INSERT INTO Employees VALUES
(1, 1, 'John', 'Sales Manager'),
(2, 1, 'Alice', 'Salesperson'),
(3, 2, 'David', 'Salesperson'),
(4, 2, 'Mary', 'Salesperson'),
(5, 3, 'Peter', 'Salesperson'),
(6, 4, 'Grace', 'Salesperson');

INSERT INTO Customers VALUES
(1, 1, 'James', '0781000001'),
(2, 1, 'Sarah', '0781000002'),
(3, 1, 'Michael', '0781000003'),
(4, 2, 'Diane', '0781000004'),
(5, 2, 'Robert', '0781000005'),
(6, 3, 'Grace', '0781000006'),
(7, 3, 'Daniel', '0781000007'),
(8, 4, 'Emma', '0781000008'),
(9, 4, 'Joseph', '0781000009'),
(10, 1, 'Patrick', '0781000010');


INSERT INTO Products VALUES
(1, 'Laptop', 'Electronics', 800000),
(2, 'Smartphone', 'Electronics', 400000),
(3, 'Television', 'Electronics', 600000),
(4, 'Office Chair', 'Furniture', 150000),
(5, 'Desk', 'Furniture', 250000);

INSERT INTO Sales_Orders VALUES
(1, 1, 1, 1, '2026-01-05'),
(2, 2, 2, 1, '2026-01-10'),
(3, 3, 1, 1, '2026-01-15'),
(4, 4, 3, 2, '2026-01-20'),
(5, 5, 4, 2, '2026-02-05'),
(6, 6, 5, 3, '2026-02-10'),
(7, 7, 5, 3, '2026-02-15'),
(8, 8, 6, 4, '2026-02-20'),
(9, 9, 6, 4, '2026-03-05'),
(10, 1, 2, 1, '2026-03-10'),
(11, 4, 3, 2, '2026-03-15'),
(12, 6, 5, 3, '2026-03-20');


INSERT INTO Order_Items VALUES
(1, 1, 1, 2, 800000),
(2, 1, 2, 1, 400000),
(3, 2, 2, 2, 400000),
(4, 2, 3, 1, 600000),
(5, 3, 1, 1, 800000),
(6, 3, 4, 2, 150000),
(7, 4, 3, 2, 600000),
(8, 4, 5, 1, 250000),
(9, 5, 1, 1, 800000),
(10, 5, 2, 2, 400000),
(11, 6, 4, 3, 150000),
(12, 6, 5, 2, 250000),
(13, 7, 2, 1, 400000),
(14, 7, 3, 1, 600000),
(15, 8, 1, 1, 800000),
(16, 8, 5, 2, 250000),
(17, 9, 2, 2, 400000),
(18, 9, 4, 1, 150000),
(19, 10, 1, 1, 800000),
(20, 10, 3, 1, 600000),
(21, 11, 5, 2, 250000),
(22, 11, 4, 2, 150000),
(23, 12, 1, 1, 800000),
(24, 12, 2, 1, 400000);

