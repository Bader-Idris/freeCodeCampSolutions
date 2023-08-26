-- connect with:  psql --username=freecodecamp --dbname=postgres
CREATE DATABASE salon;
-- \c salon
CREATE TABLE customers(
  customer_id SERIAL PRIMARY KEY,
  phone VARCHAR(15),
  name VARCHAR(40),
  UNIQUE (phone)
);

CREATE TABLE services(
  service_id SERIAL PRIMARY KEY,
  name VARCHAR(40),
  UNIQUE (name)
);

CREATE TABLE appointments(
  appointment_id SERIAL PRIMARY KEY,
  customer_id INT REFERENCES customers(customer_id),
  service_id INT REFERENCES services(service_id),
  time VARCHAR(30)
);

INSERT INTO services(name) VALUES('cut'),
('color'),
('perm'),
('style'),
('trim');
