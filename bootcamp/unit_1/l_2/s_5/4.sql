-- Challenge: length of longest trip for each day it rains anywhere

-- method 1 - aggregate all trip durations then join
WITH
  rainy_days
AS (
  SELECT
    date
  FROM
    weather w
  WHERE w.events = 'Rain'
),
  longest_trip
AS  (
  SELECT
    DATE(start_date),
    MAX(duration)
  FROM
    trips
  GROUP BY 1
)

SELECT
  rd.date,
  lt.max
FROM
  rainy_days rd
JOIN
  longest_trip lt
ON
  DATE(rd.date) = DATE(lt.date)
GROUP BY 1, 2
ORDER BY lt.max DESC;


-- method 2 - more efficient - join then aggregate
WITH
  rainy_day_trips
AS (
  SELECT
    date,
    duration
  FROM
    weather w
  JOIN
    trips t
  ON
    DATE(t.start_date) = DATE(w.date)
  WHERE
      w.events = 'Rain'
  GROUP BY 1, 2
)

SELECT
  date,
  MAX(duration)
FROM
  rainy_day_trips rdt
GROUP BY 1
ORDER BY max DESC;
