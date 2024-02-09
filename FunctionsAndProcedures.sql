#1
DELIMITER $$
CREATE PROCEDURE usp_get_employees_salary_above_35000()
BEGIN
SELECT `first_name`, `last_name` FROM `employees`
WHERE `salary` > 35000
ORDER BY `first_name`, `last_name`, `employee_id`;
END $$

#2
DELIMITER $$
CREATE PROCEDURE usp_get_employees_salary_above(target_salary DECIMAL(19, 4))
BEGIN
SELECT `first_name`, `last_name` FROM `employees`
WHERE `salary` >= target_salary
ORDER BY `first_name`, `last_name`, `employee_id`;
END$$

#3
DELIMITER $$
CREATE PROCEDURE usp_get_towns_starting_with(starting_text VARCHAR(50))
BEGIN
SELECT `name` FROM `towns`
WHERE `name` LIKE CONCAT(starting_text, '%')
ORDER BY `name`;
END$$

#4
DELIMITER $$
CREATE PROCEDURE usp_get_employees_from_town(searched_town VARCHAR(50))
BEGIN
SELECT `first_name`, `last_name` FROM `employees` e
JOIN `addresses` a USING (`address_id`)
JOIN `towns` t USING (`town_id`)
WHERE t.`name` = searched_town
ORDER BY `first_name`, `last_name`;
END$$

#5
DELIMITER $$
CREATE FUNCTION ufn_get_salary_level (salary DECIMAL(19, 4))
RETURNS VARCHAR(10)
DETERMINISTIC
BEGIN
DECLARE salary_level VARCHAR(10);
IF salary < 30000 THEN SET salary_level := 'Low';
ELSEIF salary >= 30000 and salary <= 50000 THEN SET salary_level := 'Average';
ELSE SET salary_level := 'High';
END IF;
RETURN salary_level;
END$$

#6
DELIMITER $$
CREATE PROCEDURE usp_get_employees_by_salary_level(salary_level VARCHAR(10))
BEGIN
SELECT `first_name`, `last_name` FROM `employees`
WHERE ufn_get_salary_level(`salary`) = salary_level
ORDER BY `first_name`DESC, `last_name` DESC;
END$$

#7
DELIMITER $$
CREATE FUNCTION ufn_is_word_comprised(set_of_letters varchar(50), word varchar(50))  
RETURNS INT
DETERMINISTIC
BEGIN
RETURN word REGEXP(CONCAT('^[', set_of_letters, ']+$'));
END$$
