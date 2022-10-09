-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE galaxies 
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE stars 
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  galaxy_id INT REFERENCES galaxies(id)
);

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  star_id INT REFERENCES stars(id),
  galaxy_id INT REFERENCES galaxies(id),
  moons TEXT[]
);

INSERT INTO galaxies
  (name)
VALUES 
  ('Milky Way'), 
  ('Andromeda'), 
  ('Sombrero'), 
  ('GN-z11'), 
  ('IC 1101'), 
  ('Messier 82');

INSERT INTO stars
  (name, galaxy_id)
VALUES 
  ('The Sun', 1),
  ('Tabby''s Star', 1),
  ('Mira', 1),
  ('Proxima Centauri', 1),
  ('Gliese 876', 1),
  ('Mirach', 2),
  ('Nembus', 2);

INSERT INTO planets
  (name, orbital_period_in_years, star_id, galaxy_id, moons)
VALUES
  ('Earth', 1.00, 1, 1, '{"The Moon"}'),
  ('Mars', 1.88, 1, 1, '{"Phobos", "Deimos"}'),
  ('Venus', 0.62, 1, 1, '{}'),
  ('Neptune', 164.8, 1, 1, '{"Naiad", "Thalassa", "Despina", "Galatea", "Larissa", "S/2004 N 1", "Proteus", "Triton", "Nereid", "Halimede", "Sao", "Laomedeia", "Psamathe", "Neso"}'),
  ('Proxima Centauri b', 0.03, 4, 1, '{}'),
  ('Gliese 876 b', 0.23, 5, 1, '{}');