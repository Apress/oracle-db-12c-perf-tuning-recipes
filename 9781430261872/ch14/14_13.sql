SELECT /*+ star_transformation */ pr.prod_category, c.country_id, 
t.calendar_year, sum(s.quantity_sold), SUM(s.amount_sold)
FROM sales s, times t, customers c, products pr
WHERE s.time_id = t.time_id
AND   s.cust_id = c.cust_id
AND   pr.prod_id = s.prod_id
AND   t.calendar_year = '2011'
GROUP BY pr.prod_category, c.country_id, t.calendar_year;

SELECT /*+ no_star_transformation */ pr.prod_category, c.country_id, 
t.calendar_year, sum(s.quantity_sold), SUM(s.amount_sold)
FROM sales s, times t, customers c, products pr
WHERE s.time_id = t.time_id
AND   s.cust_id = c.cust_id
AND   pr.prod_id = s.prod_id
AND   t.calendar_year = '2011'
GROUP BY pr.prod_category, c.country_id, t.calendar_year;
