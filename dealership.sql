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

-- Insert some dealership data/info
INSERT INTO dealership (name, address, phone) VALUES
('City Motors', '123 Main St, Cityville', '555-1234'),
('Metro Auto', '456 Metro Blvd, Metropolis', '555-5678');

-- Insert some sample vehicle data
INSERT INTO vehicles (vin, year, price, make, model, color, sold) VALUES
('1A2B3C4D5E6F7G8H9I0J', 2021, 25000.00, 'Toyota', 'Camry', 'Red', FALSE),
('2A3B4C5D6E7F8G9H0J1K', 2020, 22000.00, 'Honda', 'Civic', 'Blue', FALSE),
('3A4B5C6D7E8F9G0H1J2K', 2022, 27000.00, 'Ford', 'Fusion', 'Black', FALSE),
('4A5B6C7D8E9F0G1H2J3K', 2021, 32000.00, 'Chevrolet', 'Malibu', 'White', FALSE),
('5A6B7C8D9E0F1G2H3J4K', 2023, 36000.00, 'BMW', 'X5', 'Silver', FALSE);

-- Insert inventory data, associating vehicles with dealerships
INSERT INTO inventory (dealership_id, vin) VALUES
(1, '1A2B3C4D5E6F7G8H9I0J'),  -- Toyota Camry at City Motors
(1, '2A3B4C5D6E7F8G9H0J1K'),  -- Honda Civic at City Motors
(2, '3A4B5C6D7E8F9G0H1J2K'),  -- Ford Fusion at Metro Auto
(2, '4A5B6C7D8E9F0G1H2J3K'),  -- Chevrolet Malibu at Metro Auto
(1, '5A6B7C8D9E0F1G2H3J4K');  -- BMW X5 at City Motors