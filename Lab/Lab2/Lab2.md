# Battleships
## Questions
Here is a schema about battleships and the battles they fought in:
```
    Ships(name, yearLaunched, country, numGuns, gunSize, displacement)
    Battles(ship, battleName, result)
```
A typical Ships tuple would be:
```
    ('New Jersey', 1943, 'USA', 9, 16, 46000)
```
which means that the battleship New Jersey was launched in 1943; it belonged to the USA, carried 9 guns of size 16-inch (bore, or inside diameter of the barrel), and weighted (displaced, in nautical terms) 46,000 tons. A typical tuple for Battles is:
```
    ('Hood', 'North Atlantic', 'sunk')
```
That is, H.M.S. Hood was sunk in the battle of the North Atlantic. The other possible results are 'ok' and 'damaged'. Write the following queries:

1. Which battleships launched before 1930 had 16-inch guns? List their names, their country, and the number of guns they carried.
2. Which battleship(s) had the guns with the largest gun size?
3. Which battleships had the guns with the second largest gun size. More precisely, find the ships whose gun size was exceeded by only one gun size, no matter how many other ships had that larger gun size. List the names of the ships and their gun size.
4. List, for each country, the average number of guns carried by their battleships.
5. List all the pairs of countries that fought each other in battles. List each pair only once, and list them with the country that comes first in alphabetical order first.
6. For the battle of Surigao Strait, for each country engaged in that battle (had one or more battleships participating), give the number of its battleships that were sunk. Note: this question is very tricky. In particular, you need to deal with the (historical) case that a country engaged in the battle but did not have any ships sunk.

## My Answers
#### Statement #1:
```
SELECT name, country, numGuns
FROM Ships
WHERE yearLaunched<1930 AND gunSize=16
```
#### Statement #2:
```
SELECT name
FROM Ships
WHERE gunSize=(SELECT MAX(gunSize) FROM Ships)
```
#### Statement #3:	
```
SELECT name, gunSize
FROM Ships
WHERE gunSize=(SELECT MAX(gunSize) FROM Ships WHERE gunSize<>(SELECT MAX(gunSize) FROM Ships))
```
#### Statement #4:	
```
SELECT country, AVG(numGuns)
FROM Ships
GROUP BY country
```
#### Statement #5:	
```
SELECT DISTINCT country1.country, country2.country
FROM Ships country1, Ships country2, Battles battle1, Battles battle2
WHERE battle1.battleName=battle2.battleName AND country1.name=battle1.ship AND country2.name=battle2.ship AND country1.country<country2.country
```
#### Statement #6:	
```
SELECT country, COUNT(*) AS numSunk
FROM Ships, Battles
WHERE battleName='Surigao Strait' AND result='sunk' AND name=ship
GROUP BY country
UNION ALL
SELECT country, 0
FROM Ships, Battles
WHERE battleName='Surigao Strait' AND result<>'sunk' AND name=ship
GROUP BY country
```