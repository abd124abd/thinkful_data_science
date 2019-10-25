-- list of stations with a count of number of trips

SELECT
  s.name,
  s.dockcount,
  COUNT(*)
FROM
  stations s
JOIN
  trips t
ON
  s.name = t.start_station
GROUP BY 1, 2
ORDER BY s.name DESC;
