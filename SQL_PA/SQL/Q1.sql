SELECT DISTINCT bar
FROM likes, serves
WHERE drinker='Molly' AND likes.beer=serves.beer AND price<3;