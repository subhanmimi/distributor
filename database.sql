-- Database: distribution_management
CREATE DATABASE IF NOT EXISTS distribution_management;
USE distribution_management;

-- Admin/Distributor table
CREATE TABLE distributors (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Branches table
CREATE TABLE branches (
    id INT PRIMARY KEY AUTO_INCREMENT,
    branch_name VARCHAR(100) NOT NULL,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    address TEXT,
    contact_number VARCHAR(15),
    email VARCHAR(100),
    status ENUM('active', 'inactive') DEFAULT 'active',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Staff table
CREATE TABLE staff (
    id INT PRIMARY KEY AUTO_INCREMENT,
    branch_id INT,
    name VARCHAR(100) NOT NULL,
    phone VARCHAR(15),
    email VARCHAR(100),
    address TEXT,
    designation VARCHAR(50),
    status ENUM('active', 'inactive') DEFAULT 'active',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (branch_id) REFERENCES branches(id)
);

-- Bank Accounts table
CREATE TABLE bank_accounts (
    id INT PRIMARY KEY AUTO_INCREMENT,
    branch_id INT,
    bank_name VARCHAR(100) NOT NULL,
    account_number VARCHAR(50) NOT NULL,
    opening_balance DECIMAL(10,2) DEFAULT 0.00,
    current_balance DECIMAL(10,2) DEFAULT 0.00,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (branch_id) REFERENCES branches(id)
);

-- Transactions table
CREATE TABLE transactions (
    id INT PRIMARY KEY AUTO_INCREMENT,
    branch_id INT,
    bank_account_id INT,
    staff_id INT,
    transaction_date DATE,
    credit DECIMAL(10,2) DEFAULT 0.00,
    debit DECIMAL(10,2) DEFAULT 0.00,
    remarks TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (branch_id) REFERENCES branches(id),
    FOREIGN KEY (bank_account_id) REFERENCES bank_accounts(id),
    FOREIGN KEY (staff_id) REFERENCES staff(id)
);

-- LAPU table
CREATE TABLE lapu (
    id INT PRIMARY KEY AUTO_INCREMENT,
    branch_id INT,
    staff_id INT,
    transaction_date DATE,
    cash_received DECIMAL(10,2) DEFAULT 0.00,
    opening_balance DECIMAL(10,2) DEFAULT 0.00,
    auto_amount DECIMAL(10,2) DEFAULT 0.00,
    total_available_fund DECIMAL(10,2) DEFAULT 0.00,
    total_spent DECIMAL(10,2) DEFAULT 0.00,
    closing_amount DECIMAL(10,2) DEFAULT 0.00,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (branch_id) REFERENCES branches(id),
    FOREIGN KEY (staff_id) REFERENCES staff(id)
);

-- SIM Card table
CREATE TABLE sim_cards (
    id INT PRIMARY KEY AUTO_INCREMENT,
    branch_id INT,
    staff_id INT,
    transaction_date DATE,
    quantity_received INT DEFAULT 0,
    opening_stock INT DEFAULT 0,
    auto_quantity INT DEFAULT 0,
    total_available INT DEFAULT 0,
    total_sold INT DEFAULT 0,
    closing_stock INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (branch_id) REFERENCES branches(id),
    FOREIGN KEY (staff_id) REFERENCES staff(id)
);

-- APB table
CREATE TABLE apb (
    id INT PRIMARY KEY AUTO_INCREMENT,
    branch_id INT,
    staff_id INT,
    transaction_date DATE,
    quantity_received INT DEFAULT 0,
    opening_stock INT DEFAULT 0,
    total_available INT DEFAULT 0,
    total_sold INT DEFAULT 0,
    closing_stock INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (branch_id) REFERENCES branches(id),
    FOREIGN KEY (staff_id) REFERENCES staff(id)
);

-- DTH table
CREATE TABLE dth (
    id INT PRIMARY KEY AUTO_INCREMENT,
    branch_id INT,
    staff_id INT,
    transaction_date DATE,
    amount_received DECIMAL(10,2) DEFAULT 0.00,
    opening_balance DECIMAL(10,2) DEFAULT 0.00,
    auto_amount DECIMAL(10,2) DEFAULT 0.00,
    total_available_fund DECIMAL(10,2) DEFAULT 0.00,
    total_spent DECIMAL(10,2) DEFAULT 0.00,
    closing_amount DECIMAL(10,2) DEFAULT 0.00,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (branch_id) REFERENCES branches(id),
    FOREIGN KEY (staff_id) REFERENCES staff(id)
);

-- Cash Deposit table
CREATE TABLE cash_deposits (
    id INT PRIMARY KEY AUTO_INCREMENT,
    branch_id INT,
    staff_id INT,
    bank_account_id INT,
    deposit_date DATE,
    notes_2000 INT DEFAULT 0,
    notes_500 INT DEFAULT 0,
    notes_200 INT DEFAULT 0,
    notes_100 INT DEFAULT 0,
    notes_50 INT DEFAULT 0,
    notes_20 INT DEFAULT 0,
    notes_10 INT DEFAULT 0,
    notes_5 INT DEFAULT 0,
    notes_2 INT DEFAULT 0,
    notes_1 INT DEFAULT 0,
    total_amount DECIMAL(10,2) DEFAULT 0.00,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (branch_id) REFERENCES branches(id),
    FOREIGN KEY (staff_id) REFERENCES staff(id),
    FOREIGN KEY (bank_account_id) REFERENCES bank_accounts(id)
);