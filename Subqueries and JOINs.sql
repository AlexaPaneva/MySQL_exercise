#1
SELECT e.`employee_id`, e.`job_title`, e.`address_id`, a.`address_text`
FROM `employees` AS e
JOIN `addresses` AS a
ON e.`address_id` = a.`address_id`
ORDER BY `address_id`
LIMIT 5;

#2
SELECT e.`first_name`, e.`last_name`, t.`name`, a.`address_text`
FROM `employees` AS e
JOIN `addresses` AS a
ON e.`address_id` = a.`address_id`
JOIN `towns` AS t
ON a.`town_id` = t.`town_id`
ORDER BY e.`first_name`, e.`last_name`
LIMIT 5;

#3
SELECT e.`employee_id`, e.`first_name`, e.`last_name`, d.`name`
FROM `employees` AS e
JOIN `departments` AS d
ON e.`department_id` = d.`department_id`
WHERE d.`name` = 'Sales'
ORDER BY `employee_id` DESC;
 
 #4
 SELECT e.`employee_id`, e.`first_name`, e.`salary`, d.`name`
 FROM `employees` AS e
 JOIN `departments` AS d
 ON e.`department_id` = d.`department_id`
 WHERE e.`salary` > 15000
 ORDER BY d.`department_id` DESC
 LIMIT 5;
 
 #5
 SELECT e.`employee_id`, e.`first_name`, ep.`project_id`
 FROM `employees` AS e
 LEFT JOIN `employees_projects` AS ep
 ON e.`employee_id` = ep.`employee_id`
 WHERE ep.`project_id` IS NULL
 ORDER BY e.`employee_id` DESC
 LIMIT 3;
 
 #6
 SELECT e.`first_name`, e.`last_name`, e.`hire_date`, d.`name`
 FROM `employees` AS e
 JOIN `departments` AS d
 ON e.`department_id` = d.`department_id`
 WHERE e.`hire_date` > '1999-01-01 00:00:00' AND d.`name` IN ('Sales', 'Finance')
 ORDER BY e.`hire_date`;
 
 #7
 SELECT e.`employee_id`, e.`first_name`, p.`name` AS 'project_name'
 FROM `employees` AS e
  JOIN `employees_projects` AS ep
  ON e.`employee_id` = ep.`employee_id`
  JOIN `projects` p
  ON ep.`project_id` = p.`project_id`
  WHERE DATE(p.`start_date`) > '2002-08-13' AND p.`end_date` IS NULL
  ORDER BY e.`first_name`, p.`name`
  LIMIT 5;
  
  #8
   SELECT e.`employee_id`, e.`first_name`,  IF(YEAR(p.`start_date`) >= 2005, NULL ,p.`name`) AS 'project_name'
 FROM `employees` AS e
  JOIN `employees_projects` AS ep
  ON e.`employee_id` = ep.`employee_id`
  JOIN `projects` p
  ON ep.`project_id` = p.`project_id`
  WHERE e.`employee_id` = 24
  ORDER BY p.`name`;
  
  #9
  SELECT e.`employee_id`, e.`first_name`, e.`manager_id`, m.`first_name`
  FROM `employees` e
  JOIN `employees` m
  ON e.`manager_id` = m.`employee_id` #e.`employee_id` = m.`manager_id`
  WHERE e.`manager_id` IN (3, 7)
  ORDER BY e.`first_name`;
  
/*SELECT e.`employee_id`, e.`first_name`, e.`manager_id`, m.`first_name`
  FROM `employees` e, `employees` m
  WHERE e.`manager_id` = m.`employee_id` #e.`employee_id` = m.`manager_id`
  AND e.`manager_id` IN (3, 7)
  ORDER BY e.`first_name`;*/
  
#10  
  SELECT 
  e.`employee_id`,
  CONCAT(e.`first_name`, ' ', e.`last_name`) AS 'employee_name',
  CONCAT(m.`first_name`, ' ', m.`last_name`) AS 'manager_name',
  d.`name` AS 'department_name'
  FROM `employees` e
  JOIN `employees` m ON e.`manager_id` = m.`employee_id`
  JOIN `departments` d ON e.`department_id` = d.`department_id`
  ORDER BY e.`employee_id`
  LIMIT 5;
  
  #11
  SELECT AVG (`salary`) AS 'min_average_salary' FROM `employees`
  GROUP BY `department_id`
  ORDER BY `min_average_salary`
  LIMIT 1;