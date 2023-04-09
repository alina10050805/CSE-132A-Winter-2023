-- 1
SELECT DISTINCT bar
FROM likes, serves
WHERE drinker='Molly' AND likes.beer=serves.beer AND price<3;

-- 2
SELECT DISTINCT f1.drinker AS drinker1, f2.drinker AS drinker2
FROM frequents f1, frequents f2, likes l1, likes l2, serves s1, serves s2
WHERE f1.drinker<f2.drinker AND f1.bar=f2.bar AND 
      (f1.drinker=l1.drinker AND s1.bar=f1.bar AND s1.beer=l1.beer) AND
      (f2.drinker=l2.drinker AND s2.bar=f2.bar AND s2.beer=l2.beer);
      
-- 3
SELECT bar
FROM (SELECT bar, MIN(aveage)
      FROM (SELECT serves.bar, AVG(price) AS aveage
            FROM serves
            GROUP BY bar));
            
-- 4
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

-- 5
SELECT serves.beer, AVG(serves.price) AS avg_price, COUNT(likes.beer) AS popularity
FROM serves
LEFT JOIN likes ON serves.beer=likes.beer
GROUP BY serves.beer;

-- 6
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

-- 7
SELECT * FROM likes;

UPDATE likes
SET beer='--'
WHERE beer='Coors';
UPDATE likes
SET beer='Coors'
WHERE beer='Bass';
UPDATE likes
SET beer='Bass'
WHERE beer='--';

SELECT * FROM likes;