#12
SELECT mc.`country_code`, m.`mountain_range`, p.`peak_name`, p.`elevation`
FROM `peaks` AS p
JOIN `mountains` AS m 
ON p.`mountain_id` = m.`id`
JOIN `mountains_countries` AS mc 
ON m.`id` = mc.`mountain_id`
WHERE mc.`country_code` = 'BG' AND p.`elevation` > 2835
ORDER BY p.`elevation` DESC;

#13
SELECT mc.`country_code`, COUNT(m.`mountain_range`) AS 'mountain_range_count'
FROM `mountains` m
JOIN `mountains_countries` mc
ON m.`id` = mc.`mountain_id`
WHERE mc.`country_code` IN ('BG', 'US', 'RU')
GROUP BY mc.`country_code`
ORDER BY `mountain_range_count` DESC;

#14
SELECT c.`country_name`, r.`river_name`
FROM `countries` AS c
LEFT JOIN `countries_rivers` AS cr ON c.`country_code` = cr.`country_code`
LEFT JOIN `rivers` AS r ON r.`id` = cr.`river_id`
WHERE c.`continent_code` = 'AF'
ORDER BY c.`country_name`
LIMIT 5;

#16
SELECT COUNT(c.`country_code`)
FROM `countries` AS c
LEFT JOIN `mountains_countries` AS mc ON c.`country_code` = mc.`country_code`
LEFT JOIN `mountains` AS m ON mc.`mountain_id` = m.`id`
WHERE m.`id` IS NULL;

#17
SELECT c.`country_name`, MAX(p.`elevation`) AS 'highest_peak_elevation',MAX(r.`length`) AS 'longest_river_length'
FROM `countries` AS c
LEFT JOIN `mountains_countries` AS mc ON c.`country_code` = mc.`country_code`
LEFT JOIN `peaks` AS p ON mc.`mountain_id` = p.`mountain_id`
LEFT JOIN `countries_rivers` AS cr ON c.`country_code` = cr.`country_code`
LEFT JOIN `rivers` AS r ON cr.`river_id` = r.`id`
GROUP BY c.`country_name`
ORDER BY `highest_peak_elevation` DESC , `longest_river_length` DESC , c.`country_name`
LIMIT 5;