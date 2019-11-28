DROP TABLE IF EXISTS members;

CREATE TABLE members(
  id SERIAL PRIMARY KEY,
  first_name VARCHAR,
  last_name VARCHAR,
  premier_member BOOLEAN
);
