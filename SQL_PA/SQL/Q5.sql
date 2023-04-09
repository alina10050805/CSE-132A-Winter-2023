SELECT serves.beer, AVG(serves.price) AS avg_price, COUNT(likes.beer) AS popularity
FROM serves
LEFT JOIN likes ON serves.beer=likes.beer
GROUP BY serves.beer;