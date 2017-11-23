DROP TABLE students;
DROP TABLE houses;

CREATE TABLE houses (
  id serial4 primary key,
  house_name varchar(255)
);

CREATE TABLE students (
  id serial4 primary key,
  first_name varchar(255),
  surname varchar(255),
  house_id INT4 REFERENCES houses(id)
);
