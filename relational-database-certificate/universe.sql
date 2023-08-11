-- to connect use psql --username=freecodecamp --dbname=postgres
CREATE DATABASE universe;
-- then inside it run:
CREATE TABLE galaxy(
  galaxy_id SERIAL PRIMARY KEY,
  name VARCHAR(30) NOT NULL,
  description TEXT,
  width_in_light_years INT,
  estimated_planets_in_millions INT,
  age_in_millions_of_years NUMERIC(1000, 2) NOT NULL,
  has_life BOOLEAN,
  UNIQUE(name),
  is_spherical BOOLEAN
);
CREATE TABLE star(
  star_id SERIAL PRIMARY KEY,
  name VARCHAR(30) NOT NULL,
  description TEXT,
  melting_distance INT,
  distance_from_earth INT,
  age_in_millions_of_years NUMERIC(10, 2) NOT NULL,
  has_surface BOOLEAN,
  is_spherical BOOLEAN,
  UNIQUE(name),
  galaxy_id REFERENCES galaxy(galaxy_id)
);
CREATE TABLE planet(
  planet_id SERIAL PRIMARY KEY,
  name VARCHAR(30) NOT NULL,
  description TEXT,
  gravity_on_surface INT,
  distance_from_host_star INT,
  age_in_millions_of_years NUMERIC(100, 2) NOT NULL,
  daily_arcing_sphering_degrees NUMERIC(360),
  has_life BOOLEAN,
  has_water_on_surface BOOLEAN,
  size_in_sq INT,
  has_solid_surface BOOLEAN,
  UNIQUE(name),
  star_id REFERENCES star(star_id)
);
CREATE TABLE moon(
  moon_id SERIAL PRIMARY KEY,
  name VARCHAR(30) NOT NULL,
  description TEXT,
  daily_arcing_sphering_degrees NUMERIC(360) NOT NULL,
  gravity_on_surface INT,
  distance_from_host_planet INT,
  size_in_sq INT,
  precious_materials JSONB,
  mass INT,
  gravity INT,
  surface_age NUMERIC(500),
  volcanic_activity TEXT,
  seismic_activity INT,
  magnetic_field INT,
  age_in_millions_of_years NUMERIC(100, 2),
  has_water_on_surface BOOLEAN,
  has_life BOOLEAN,
  is_spherical BOOLEAN,
  enormous_gold_fields INT,
  UNIQUE(name),
  planet_id REFERENCES planet(planet_id)
);
CREATE TABLE meteoroid(
  meteoroid_id SERIAL PRIMARY KEY,
  name VARCHAR(30) NOT NULL,
  description TEXT,
  UNIQUE(name),
  galaxy_id REFERENCES galaxy(galaxy_id)
);
-- a lot of columns aren't necessary, delete them

INSERT INTO galaxy( name, description, age_in_millions_of_years) VALUES
('Andromeda', ' The Andromeda Galaxy is one of the most famous and closest spiral galaxies to our Milky Way.
It is located about 2.537 million light-years away from Earth.', 10000),

('Milky Way', 'The Milky Way Galaxy is our home galaxy and one of the most well-known galaxies in existence.
It is a barred spiral galaxy that contains billions of stars, along with various other celestial objects like planets, asteroids, and comets.', 13600),

('Sombrero', ' The Sombrero Galaxy, also known as M104, is a striking spiral galaxy located about 28 million light-years away from Earth.
Its distinct appearance resembles a wide-brimmed hat or a sombrero, hence the name.',9000);

INSERT INTO star(name, description, age_in_millions_of_years, galaxy_id) VALUES(
  'Sun', 'The Sun, also known as Sol, is the star at the center of our solar system.',
  4600, 2
);
INSERT INTO star(name, description, age_in_millions_of_years, galaxy_id) VALUES(
  'Sirius', 'Sirius is the brightest star in the night sky and is located in the constellation Canis Major.',
  250, 2
);
INSERT INTO star(name, description, age_in_millions_of_years, galaxy_id) VALUES(
  'Betelgeuse', 'Betelgeuse is a red supergiant star located in the constellation Orion.',
  8.5, 2
);
INSERT INTO planet(name, description, age_in_millions_of_years, star_id) VALUES(
  'Earth', 'Earth is the third planet from the Sun and the only known planet to support life.',
  4500, 1
);
INSERT INTO planet(name, description, age_in_millions_of_years, star_id) VALUES(
  'Mars', ' Mars is the fourth planet from the Sun and is often referred to as the "Red Planet" due to its reddish appearance.',
  4600, 1
);
INSERT INTO planet(name, description, age_in_millions_of_years, star_id) VALUES(
  'Jupiter', 'Jupiter is the largest planet in our solar system and the fifth planet from the Sun.',
  4500, 1
);
INSERT INTO moon(name, description, daily_arcing_sphering_degrees, planet_id) VALUES(
  'Moon', 'Earth possessing moon is the natural satellite orbiting our planet.',
  13.2, 1
);
INSERT INTO moon(name, description, daily_arcing_sphering_degrees, planet_id) VALUES(
  'Phobos', ' Phobos is one of the two moons of Mars, along with Deimos.',
  0.3, 2
);
INSERT INTO moon(name, description, daily_arcing_sphering_degrees, planet_id) VALUES(
  'Io', 'Io is one of Jupiter possessing largest moons and the innermost of its four Galilean moons.',
  42.5, 3
);
INSERT INTO meteoroid(name, description, galaxy_id) VALUES (
  'Tunguska', 'This meteoroid is famous for the massive explosion it caused in the Tunguska region of Siberia, Russia, in 1908.',
  2
);
INSERT INTO meteoroid(name, description, galaxy_id) VALUES (
  'Chelyabinsk', 'On February 15, 2013, this meteoroid entered the atmosphere of Earth over the Russian city of Chelyabinsk.',
  2
);
INSERT INTO meteoroid(name, description, galaxy_id) VALUES (
  'Chicxulub', 'This meteoroid is believed to have caused the mass extinction event that wiped out the dinosaurs around 66 million years ago.',
  2
);
INSERT INTO galaxy( name, description, age_in_millions_of_years) VALUES
('Triangulum', 'The Triangulum Galaxy is another close neighbor of the Milky Way, situated about 3 million light-years away.', 10000),
('Whirlpool', 'The Whirlpool Galaxy, or M51a, is a stunning spiral galaxy located in the constellation Canes Venatici.', 400),
('Pinwheel', 'The Pinwheel Galaxy, or M101, is a large spiral galaxy located in the constellation Ursa Major.', 1000),
('Centaurus', 'Centaurus A is a peculiar galaxy located in the constellation Centaurus.', 1200),
('Sculptor', 'The Sculptor Galaxy is a spiral galaxy located in the constellation Sculptor.', 11);






INSERT INTO star(name, description, age_in_millions_of_years, galaxy_id) VALUES(
  'WR 16', 'A Wolf-Rayet star, known for its strong stellar winds and high mass loss. age is not correct',
  4600, 4
);
INSERT INTO star(name, description, age_in_millions_of_years, galaxy_id) VALUES(
  'B416', 'A blue supergiant star, one of the brightest stars in the Triangulum Galaxy. age is not correct',
  4600, 4
);
INSERT INTO star(name, description, age_in_millions_of_years, galaxy_id) VALUES(
  'B324', 'A red supergiant star, among the largest and most luminous stars in the galaxy. age is not correct',
  4600, 4
);
INSERT INTO star(name, description, age_in_millions_of_years, galaxy_id) VALUES(
  'NGC 5195 X-1', 'An X-ray binary system consisting of a black hole and a companion star. age is not correct',
  4600, 5
);
INSERT INTO star(name, description, age_in_millions_of_years, galaxy_id) VALUES(
  'SN 2005cs', 'A Type II supernova that occurred in 2005, marking the explosion of a massive star. age is not correct',
  4600, 5
);

INSERT INTO planet(name, description, age_in_millions_of_years, star_id) VALUES(
  'Mercury', 'Mercury is the closest planet to the Sun and the smallest planet in our solar system.',
  4600, 1
);
INSERT INTO planet(name, description, age_in_millions_of_years, star_id) VALUES(
  'Venus', 'Venus is often referred to as the sister planet of Earth due to its similar size and composition.',
  4600, 1
);
INSERT INTO planet(name, description, age_in_millions_of_years, star_id) VALUES(
  'Saturn', 'Saturn is a gas giant known for its beautiful and prominent ring system.',
  4600, 1
);
INSERT INTO planet(name, description, age_in_millions_of_years, star_id) VALUES(
  'Uranus', 'Uranus is an ice giant planet with a unique feature - it rotates on its side, likely due to a massive collision early in its formation.',
  4600, 1
);
INSERT INTO planet(name, description, age_in_millions_of_years, star_id) VALUES(
  'Neptune', 'Neptune is the farthest known planet from the Sun and is also an ice giant.',
  4600, 1
);
INSERT INTO planet(name, description, age_in_millions_of_years, star_id) VALUES(
  'Kepler-452b', ' Often referred to as the cousin of Earth Kepler-452b is an exoplanet located about 1,400 light-years away from us.',
  6000, 2
);
INSERT INTO planet(name, description, age_in_millions_of_years, star_id) VALUES(
  'Proxima Centauri b', ' Proxima Centauri b is an exoplanet orbiting the closest star to our solar system, Proxima Centauri.',
  4850, 2
);
INSERT INTO planet(name, description, age_in_millions_of_years, star_id) VALUES(
  'TRAPPIST-1e', ' TRAPPIST-1e is one of the seven planets orbiting the ultra-cool dwarf star TRAPPIST-1, located about 39 light-years away.',
  7600, 2
);
INSERT INTO planet(name, description, age_in_millions_of_years, star_id) VALUES(
  'HD 189733b', 'HD 189733b is a gas giant exoplanet located about 63 light-years away.',
  2000, 2
);
INSERT INTO planet(name, description, age_in_millions_of_years, star_id) VALUES(
  'WASP-12b', 'WASP-12b is a gas giant exoplanet located about 1,400 light-years away.',
  1000, 2
);


INSERT INTO moon(name, description, daily_arcing_sphering_degrees, planet_id) VALUES(
  'Titan', 'Titan is the largest moon of Saturn and the second-largest moon in the solar system.',
  0.4, 6
);
INSERT INTO moon(name, description, daily_arcing_sphering_degrees, planet_id) VALUES(
  'Enceladus', 'Enceladus is a small moon of Saturn known for its geysers erupting from its south pole.',
  0.1, 6
);
INSERT INTO moon(name, description, daily_arcing_sphering_degrees, planet_id) VALUES(
  'Mimas', 'Mimas is a moon of Saturn and is known for its prominent impact crater called Herschel.',
  0.5, 6
);
INSERT INTO moon(name, description, daily_arcing_sphering_degrees, planet_id) VALUES(
  'Iapetus', ' Iapetus is a moon of Saturn and is known for its stark contrast in surface color.',
  0.1, 6
);
INSERT INTO moon(name, description, daily_arcing_sphering_degrees, planet_id) VALUES(
  'Hyperion', 'Hyperion is an irregularly shaped moon of Saturn and has a porous, spongy surface.',
  0.1, 6
);
INSERT INTO moon(name, description, daily_arcing_sphering_degrees, planet_id) VALUES(
  'Europa', 'Europa is one of Jupiter possessed by Galilean moons and is believed to have a subsurface ocean of liquid water beneath its icy crust.',
  6.4, 3
);
INSERT INTO moon(name, description, daily_arcing_sphering_degrees, planet_id) VALUES(
  'Ganymede', ' Ganymede is the largest moon in the solar system and is larger than the planet Mercury.',
  4.1, 3
);
INSERT INTO moon(name, description, daily_arcing_sphering_degrees, planet_id) VALUES(
  'Callisto', 'Callisto is another one of Jupiter possessed by Galilean moons.',
  2.7, 3
);
INSERT INTO moon(name, description, daily_arcing_sphering_degrees, planet_id) VALUES(
  'Triton', 'Triton is the largest moon of Neptune and is unique because it orbits in the opposite direction of Neptune possessed by rotation.',
  0.5, 8
);
INSERT INTO moon(name, description, daily_arcing_sphering_degrees, planet_id) VALUES(
  'Charon', ' Charon is the largest moon of Pluto and is notable for its size relative to Pluto.',
  0.5, 9
);
INSERT INTO moon(name, description, daily_arcing_sphering_degrees, planet_id) VALUES(
  'Ariel', ' Ariel is one of Uranus possessed by moons and has a relatively smooth surface with a few impact craters.',
  0.2, 7
);
INSERT INTO moon(name, description, daily_arcing_sphering_degrees, planet_id) VALUES(
  'Miranda', 'Miranda is one of Uranus possessed by moons and is known for its diverse and chaotic terrain.',
  0.2, 7
);
INSERT INTO moon(name, description, daily_arcing_sphering_degrees, planet_id) VALUES(
  'Cordelia', 'Cordelia is one of the small inner moons of Uranus.',
  13, 7
);
INSERT INTO moon(name, description, daily_arcing_sphering_degrees, planet_id) VALUES(
  'Ophelia', 'Ophelia is one of the small inner moons of Uranus.',
  13, 7
);
INSERT INTO moon(name, description, daily_arcing_sphering_degrees, planet_id) VALUES(
  'Bianca', 'Bianca is one of the small inner moons of Uranus.',
  13, 7
);
INSERT INTO moon(name, description, daily_arcing_sphering_degrees, planet_id) VALUES(
  'Cressida', 'Cressida is one of the small inner moons of Uranus.',
  13, 7
);
INSERT INTO moon(name, description, daily_arcing_sphering_degrees, planet_id) VALUES(
  'Desdemona', 'Desdemona is one of the small inner moons of Uranus.',
  13, 7
);
INSERT INTO moon(name, description, daily_arcing_sphering_degrees, planet_id) VALUES(
  'Juliet', 'Juliet is one of the small inner moons of Uranus.',
  13, 7
);
-- finally, done in: 5:25 PM 8/11/2023