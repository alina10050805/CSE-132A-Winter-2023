SELECT bar
FROM (SELECT bar, MIN(aveage)
      FROM (SELECT serves.bar, AVG(price) AS aveage
            FROM serves
            GROUP BY bar));