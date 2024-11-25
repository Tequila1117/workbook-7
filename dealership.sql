-- Drop the existing database if it exists
DROP DATABASE IF EXISTS dealership;

-- Recreate the database
CREATE DATABASE dealership;
USE dealership;

-- Table to store dealership information
CREATE TABLE `dealership` (
  dealership_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  address VARCHAR(50) NOT NULL,
  phone VARCHAR(12) NOT NULL
);

-- Table to store vehicle information
CREATE TABLE `vehicles` (
  vin VARCHAR(20) PRIMARY KEY,
  year INT NOT NULL,
  price DECIMAL(10, 2) NOT NULL,
  make VARCHAR(50) NOT NULL,
  model VARCHAR(50) NOT NULL,
  color VARCHAR(50) NOT NULL,
  sold BOOLEAN DEFAULT FALSE
);

-- Table to track which dealership has which vehicle in its inventory
CREATE TABLE `inventory` (
  dealership_id INT,
  vin VARCHAR(20),
  PRIMARY KEY (dealership_id, vin),
  FOREIGN KEY (dealership_id) REFERENCES dealership(dealership_id),
  FOREIGN KEY (vin) REFERENCES vehicles(vin)
);

-- Table to store sales contract information
CREATE TABLE `sales_contracts` (
  id INT AUTO_INCREMENT PRIMARY KEY,
  vin VARCHAR(20),
  sale_date DATE NOT NULL,
  sale_price DECIMAL(10, 2) NOT NULL,
  customer_name VARCHAR(50) NOT NULL,
  FOREIGN KEY (vin) REFERENCES vehicles(vin)
);

-- Table to store lease contract information (optional)
CREATE TABLE `lease_contracts` (
  id INT AUTO_INCREMENT PRIMARY KEY,
  vin VARCHAR(20),
  lease_start DATE NOT NULL,
  lease_end DATE NOT NULL,
  lease_price DECIMAL(10, 2) NOT NULL,
  customer_name VARCHAR(50) NOT NULL,
  FOREIGN KEY (vin) REFERENCES vehicles(vin)
);