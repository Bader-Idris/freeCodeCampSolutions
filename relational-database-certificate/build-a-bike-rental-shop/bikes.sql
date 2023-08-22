CREATE DATABASE bikes;

CREATE TABLE bikes();
ALTER TABLE bikes ADD COLUMN bike_id SERIAL PRIMARY KEY;
ALTER TABLE bikes ADD COLUMN type VARCHAR(50) NOT NULL;
ALTER TABLE bikes ADD COLUMN size INT NOT NULL;
ALTER TABLE bikes ADD COLUMN available BOOLEAN NOT NULL DEFAULT true;

CREATE TABLE customers();
ALTER TABLE customers ADD COLUMN customer_id SERIAL PRIMARY KEY;
ALTER TABLE customers ADD COLUMN phone VARCHAR(15) NOT NULL UNIQUE;
ALTER TABLE customers ADD COLUMN name VARCHAR(40) NOT NULL;

CREATE TABLE rentals();
ALTER TABLE rentals ADD COLUMN rental_id SERIAL PRIMARY KEY;

ALTER TABLE rentals ADD COLUMN customer_id INT NOT NULL;
ALTER TABLE rentals ADD FOREIGN KEY(customer_id) REFERENCES customers(customer_id);

ALTER TABLE rentals ADD COLUMN bike_id INT NOT NULL;
ALTER TABLE rentals ADD FOREIGN KEY(bike_id) REFERENCES bikes(bike_id);

ALTER TABLE rentals ADD COLUMN date_rented DATE NOT NULL DEFAULT NOW();
ALTER TABLE rentals ADD COLUMN date_returned DATE;

INSERT INTO bikes(type, size) VALUES('Mountain', 27);
INSERT INTO bikes(type, size) VALUES('Mountain', 28);
INSERT INTO bikes(type, size) VALUES('Mountain', 29);
INSERT INTO bikes(type, size) VALUES('Road', 27);

INSERT INTO bikes(type, size) VALUES
('Road', 28),
('Road', 29);

INSERT INTO bikes(type, size) VALUES
('BMX', 19),
('BMX', 20),
('BMX', 21);

-- 👇this is after creating the function with its case expression 👇
UPDATE bikes SET available = false WHERE available = true;
-- we changed it, for checking if it will return nothing when all bikes are rented

-- now change all but BMX to true
UPDATE bikes SET available = true WHERE type != 'BMX';
