SELECT d.location_id, department_name, city
FROM departments d, locations l
WHERE d.location_id = l.location_id;

SELECT location_id, department_name, city
FROM departments NATURAL JOIN locations;

SELECT location_id, department_name, city
FROM departments JOIN locations
USING (location_id);

SELECT d.location_id, d.department_name, l.city
FROM departments d JOIN locations l
ON (l.location_id = d.location_id);

SELECT last_name, first_name, department_name, city, 
state_province state, postal_code zip, country_name
FROM employees
JOIN departments USING (department_id)
JOIN locations USING (location_id)
JOIN countries USING (country_id)
JOIN regions USING (region_id)
WHERE department_id = 20;

your SQL code:
SELECT last_name, first_name, department_name, city, 
state_province state, postal_code zip, country_name 
FROM employees e, departments d, locations l, countries c, regions r
WHERE e.department_id = d.department_id
  AND d.location_id   = l.location_id
  AND l.country_id    = c.country_id
  AND c.region_id     = r.region_id
  and d.department_id = 20;

SELECT location_id, department_name, city
FROM departments INNER JOIN locations
USING (location_id);

