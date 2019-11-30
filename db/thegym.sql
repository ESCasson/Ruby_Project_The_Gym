DROP TABLE IF EXISTS members;
DROP TABLE IF EXISTS exclasses;

CREATE TABLE members(
  id SERIAL PRIMARY KEY,
  first_name VARCHAR,
  last_name VARCHAR,
  premier_member BOOLEAN
);

CREATE TABLE exclasses(
  id SERIAL PRIMARY KEY,
  date DATE,
  time TIME,
  type VARCHAR,
  instructor VARCHAR,
  length_min  VARCHAR
);
