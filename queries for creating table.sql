-- creating all tables

CREATE TABLE Regions (
    region_id INT PRIMARY KEY,
    region_name VARCHAR(50) NOT NULL
);

CREATE TABLE Branches (
    branch_id INT PRIMARY KEY,
    region_id INT NOT NULL,
    branch_name VARCHAR(100) NOT NULL,
    location VARCHAR(100),
    FOREIGN KEY (region_id)
        REFERENCES Regions(region_id)
);

CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    branch_id INT NOT NULL,
    employee_name VARCHAR(100) NOT NULL,
    job_title VARCHAR(50),
    FOREIGN KEY (branch_id)
        REFERENCES Branches(branch_id)
);

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    region_id INT NOT NULL,
    customer_name VARCHAR(100) NOT NULL,
    phone VARCHAR(20),
    FOREIGN KEY (region_id)
        REFERENCES Regions(region_id)
);

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    unit_price DECIMAL(10,2)
);

CREATE TABLE Sales_Orders (
    order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    employee_id INT NOT NULL,
    branch_id INT NOT NULL,
    order_date DATE NOT NULL,

    FOREIGN KEY (customer_id)
        REFERENCES Customers(customer_id),

    FOREIGN KEY (employee_id)
        REFERENCES Employees(employee_id),

    FOREIGN KEY (branch_id)
        REFERENCES Branches(branch_id)
);

CREATE TABLE Order_Items (
    order_item_id INT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,

    FOREIGN KEY (order_id)
        REFERENCES Sales_Orders(order_id),

    FOREIGN KEY (product_id)
        REFERENCES Products(product_id)
);
