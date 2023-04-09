SELECT bar, SUM(countbeer) AS num
FROM (
      SELECT s.bar, COUNT(*) AS countbeer
      FROM serves s
      WHERE 
      NOT EXISTS
            (SELECT *
             FROM frequents f
             WHERE f.bar=s.bar AND
             NOT EXISTS
                   (SELECT *
                    FROM likes l
                    WHERE l.drinker=f.drinker AND l.beer=s.beer))
      GROUP BY s.bar
      UNION ALL
      SELECT serves.bar, 0 AS countbeer
      FROM serves, frequents, likes
      WHERE frequents.bar=serves.bar
      GROUP BY serves.bar)
GROUP BY bar;