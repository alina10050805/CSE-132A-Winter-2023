SELECT DISTINCT a.bar
FROM serves a
WHERE 
NOT EXISTS
      (SELECT *
       FROM likes s
       WHERE s.drinker='Joe' AND 
       NOT EXISTS
             (SELECT *
             FROM serves b
             WHERE b.bar=a.bar AND b.beer=s.beer AND 
             NOT EXISTS
                     (SELECT *
                     FROM serves c
                     WHERE c.beer=b.beer AND c.price<b.price)));