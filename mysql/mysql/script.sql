CREATE DATABASE IF NOT EXISTS employees_db;
USE employees_db;
CREATE TABLE  EMPLOYEES (
    emp_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_name VARCHAR(50) NOT NULL,
     emp_contact INT,
    emp_add VARCHAR(250)
)
INSERT INTO EMPLOYEES (emp_id,emp_name, emp_contact, emp_add)
VALUES
    (1,'Jagriti', 7007220804, "Gorakhpur"),
        (2,'Saloni', 7007220805, "Lucknow"),
       (3,'Kajal', 7007220889, "sant kabir nagar");
