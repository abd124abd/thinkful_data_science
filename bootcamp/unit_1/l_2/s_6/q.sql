-- 1. Most expensive listing

SELECT
  price
FROM
  sfo_listings
ORDER BY price DESC
LIMIT 1;

-- 2. Most popular neighborhoods

-- by number of reviews
SELECT
  neighbourhood,
  SUM(number_of_reviews),
  COUNT(*)
FROM
  sfo_listings
GROUP BY 1
ORDER BY sum DESC;

-- by calendar listings
WITH
  neighbourhoods_by_calendar
AS (
  SELECT
    c.listing_id,
    l.neighbourhood
  FROM
    sfo_calendar c
  JOIN
    sfo_listings l
  ON
    c.listing_id = l.id
  GROUP BY 1, 2
)

SELECT
  n.neighbourhood,
  COUNT(*)
FROM
  neighbourhoods_by_calendar n
GROUP BY 1
ORDER BY count DESC;

-- 3. Cheapest San Fran time of year



-- 3b. Busiest
