-- psql --username=freecodecamp --dbname=periodic_table
ALTER TABLE properties RENAME COLUMN weight TO atomic_mass;
ALTER TABLE properties RENAME COLUMN melting_point TO melting_point_celsius;
ALTER TABLE properties RENAME COLUMN boiling_point TO boiling_point_celsius;
ALTER TABLE properties ALTER COLUMN melting_point_celsius SET NOT NULL;
ALTER TABLE properties ALTER COLUMN boiling_point_celsius SET NOT NULL;
ALTER TABLE elements ADD UNIQUE(symbol);
ALTER TABLE elements ADD UNIQUE(name);
ALTER TABLE elements ALTER COLUMN symbol SET NOT NULL;
ALTER TABLE elements ALTER COLUMN name SET NOT NULL;
ALTER TABLE properties ADD FOREIGN KEY(atomic_number) REFERENCES elements(atomic_number);
CREATE TABLE types();
ALTER TABLE types ADD COLUMN type_id INT PRIMARY KEY;
ALTER TABLE types ADD COLUMN type VARCHAR(25) NOT NULL;
CREATE SEQUENCE types_type_id_seq;
ALTER TABLE types ALTER COLUMN type_id SET DEFAULT nextval('types_type_id_seq');
ALTER SEQUENCE types_type_id_seq OWNED BY types.type_id;
INSERT INTO types(type) VALUES('metal'),
('metalloid'),
('nonmetal');
ALTER TABLE properties ADD COLUMN type_id INT, ADD FOREIGN KEY (type_id) REFERENCES types (type_id);


-- -------------------------------------------------------------------------
-- -------- now use the type_id_looping.sh file ----------------------------
-- -------------------------------------------------------------------------

ALTER TABLE properties ALTER COLUMN type_id SET NOT NULL;


-- ------------------------------------------------

-- -------------------------------------------------------------------------
-- -------- USE capitalize_symbol.sh NOW ----------------------------
-- -------------------------------------------------------------------------

ALTER TABLE properties ALTER COLUMN atomic_mass TYPE numeric(9,4);

-- under maintenance🔴👇
-- UPDATE table_name SET column_name=new_value WHERE condition
ALTER TABLE properties DROP CONSTRAINT properties_pkey;
UPDATE properties SET atomic_number = 10, atomic_mass = 20.18 WHERE atomic_number = 1000;
ALTER TABLE properties ADD PRIMARY KEY (atomic_number);

UPDATE properties SET atomic_number=10, atomic_mass=20.18 WHERE atomic_number = 1000;