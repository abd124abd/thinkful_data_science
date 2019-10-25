-- which station is full most often

SELECT
  sn.station_id,
  sn.name,
  COUNT(*)
FROM
  stations sn
JOIN
  status su
ON
  sn.station_id = su.station_id
WHERE
  su.docks_available = 0
GROUP BY 1, 2
ORDER BY COUNT(*) DESC
LIMIT 1;
