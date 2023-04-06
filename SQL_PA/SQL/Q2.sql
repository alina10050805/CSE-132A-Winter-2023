SELECT DISTINCT f1.drinker AS drinker1, f2.drinker AS drinker2
FROM frequents f1, frequents f2, likes l1, likes l2, serves s1, serves s2
WHERE f1.drinker<f2.drinker AND f1.bar=f2.bar AND 
      (f1.drinker=l1.drinker AND s1.bar=f1.bar AND s1.beer=l1.beer) AND
      (f2.drinker=l2.drinker AND s2.bar=f2.bar AND s2.beer=l2.beer);