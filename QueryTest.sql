-- Query 1: Get All Dealerships
SELECT * FROM dealership;

-- Query 2: Find All Vehicles for a Specific Dealership (ex. dealership_id = 1)
SELECT vehicles.* 
FROM vehicles
JOIN inventory ON vehicles.vin = inventory.vin
WHERE inventory.dealership_id = 1;

-- Query 3: Find a Car by VIN (ex. VIN = '1A2B3C4D')
SELECT * 
FROM vehicles
WHERE vin = '1A2B3C4D';

-- Query 4: Find the Dealership Where a Certain Car is Located (by VIN)
SELECT dealership.name, dealership.address, dealership.phone
FROM dealership
JOIN inventory ON dealership.dealership_id = inventory.dealership_id
WHERE inventory.vin = '1A2B3C4D';

-- Query 5: Find All Dealerships That Have a Certain Car Type (ex. Red Ford Mustang)
SELECT DISTINCT dealership.name, dealership.address, dealership.phone
FROM dealership
JOIN inventory ON dealership.dealership_id = inventory.dealership_id
JOIN vehicles ON inventory.vin = vehicles.vin
WHERE vehicles.color = 'Red' AND vehicles.make = 'Ford' AND vehicles.model = 'Mustang';

-- Query 6: Get All Sales Information for a Specific Dealer for a Specific Date Range
SELECT sales_contracts.id, sales_contracts.sale_date, sales_contracts.sale_price, sales_contracts.customer_name, vehicles.make, vehicles.model, vehicles.year, vehicles.color
FROM sales_contracts
JOIN vehicles ON sales_contracts.vin = vehicles.vin
JOIN inventory ON vehicles.vin = inventory.vin
WHERE inventory.dealership_id = 1 
  AND sales_contracts.sale_date BETWEEN '2023-01-01' AND '2023-12-31';


