-- 3 longest trips on rainy days

WITH
  rainy_days
AS (
  SELECT
    date
  FROM
    weather w
  WHERE
    w.events = 'Rain'
)

SELECT
  t.trip_id,
  t.duration,
  t.start_date,
  rd.date
FROM
  trips t
JOIN
  rainy_days rd
ON
  DATE(t.start_date) = DATE(rd.date)
GROUP BY 1, 2, 3, 4
ORDER BY t.duration DESC
LIMIT 3;
