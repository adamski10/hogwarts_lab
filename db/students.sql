DROP TABLE students;
DROP TABLE houses;

CREATE TABLE houses (
  id SERIAL primary key,
  name VARCHAR(255)
);

CREATE TABLE students (
  id SERIAL primary key,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  house_id INT REFERENCES houses(id) ON DELETE CASCADE,
  age INT
);