# HW4 - NULL Values

## Question 1
For what values of x, y, and z, including NULL, does the boolean expression
```
x <= 3 AND NOT(y >= 1 OR z = 5)
```
have the truth value UNKNOWN? Identify one of those values from the list below.

 
a) 	x = NULL, y = NULL, z = 7.

b) 	x = 5, y = NULL, z = 5.

c) 	x = 4, y = 3, z = NULL.

d) 	x = 2, y = 1, z = NULL.


#### Answer: a)

## Question 2
The table

Scores(Team, Day, Opponent, Runs)

Gives the scores in the Japanese Baseball League for two consecutive days. The Opponent is NULL if the Team did not play on that day. The number of Runs is given as NULL if either the team did not play, or will play on that day but the game is not yet concluded. The data in this table is as follows:
```
Team	     Day	Opponent   Runs
Dragons	    Sunday	Swallows	4
Tigers	    Sunday	Bay Stars	9
Carp	    Sunday	NULL	    NULL
Swallows	Sunday	Dragons	    7
Bay Stars	Sunday	Tigers	    2
Giants	    Sunday	NULL	    NULL
Dragons 	Monday	Carp	    NULL
Tigers	    Monday	NULL	    NULL
Carp	    Monday	Dragons	    NULL
Swallows	Monday	Giants	    0
Bay Stars	Monday	NULL	    NULL
Giants	    Monday	Swallows	5
```
Consider the following three queries, which differ only in the team mentioned in the WHERE clause.

```
1)   SELECT COUNT(*), COUNT(Runs)
     FROM Scores
     WHERE Team = 'Tigers'

2)   SELECT COUNT(*), COUNT(Runs)
     FROM Scores
     WHERE Team = 'Carp'

3)   SELECT COUNT(*), COUNT(Runs)
     FROM Scores
     WHERE Team = 'Swallows'
```
Then, identify in the list below the result of one of these queries.

 ```
a) 	For the Tigers:     2	1
 	
b) 	For the Carp:       2	NULL
 	
c) 	For the Carp:       12	NULL
 	
d) 	For the Tigers:     12	1
```

 
 	
#### Answer:   a)

## Question 3
The table

Scores(Team, Day, Opponent, Runs)

Gives the scores in the Japanese Baseball League for two consecutive days. The Opponent is NULL if the Team did not play on that day. The number of Runs is given as NULL if either the team did not play, or will play on that day but the game is not yet concluded. The data in this table is as follows:
```
Team	     Day	Opponent   Runs
Dragons	    Sunday	Swallows	4
Tigers	    Sunday	Bay Stars	9
Carp	    Sunday	NULL	    NULL
Swallows	Sunday	Dragons	    7
Bay Stars	Sunday	Tigers	    2
Giants	    Sunday	NULL	    NULL
Dragons 	Monday	Carp	    NULL
Tigers	    Monday	NULL	    NULL
Carp	    Monday	Dragons	    NULL
Swallows	Monday	Giants	    0
Bay Stars	Monday	NULL	    NULL
Giants	    Monday	Swallows	5
```
What is the result of executing on this data the query:

```
     SELECT Team, Day
     FROM Scores
     WHERE Opponent IS NULL OR
         NOT (Runs >= 0)
```
Identify, in the list below, a row of the result.

 ```
a) 	Carp	    Monday
 	
b) 	Bay Stars	Sunday

c) 	Carp	    Sunday
 	
d) 	Giants	    Monday
```



## Question 4
For what values of x, y, and z, including NULL, does the boolean expression
```
     x <= 3 OR NOT(y >= 1 AND z = 5)
```
have the truth value FALSE? Identify one of those values from the list below.

 
a) 	x = 5, y = 5, z = 4.
 	
b) 	x = 2, y = 7, z = NULL.
 	
c) 	x = 5, y = 2, z = 5.
 	
d) 	x = NULL, y = 3, z = 5.

 	
#### Answer:   c)

## Question 5
Relation R(x,y) currently consists of only the one tuple (NULL, NULL). Which of the following SQL-99 standard queries will produce a nonempty output? That is, at least one tuple will be produced, although the tuple(s) may have NULL's.	

a) 	SELECT * FROM R WHERE x = NULL

b) 	SELECT r1.x, r2,y FROM R r1, R r2 WHERE r1.y = r2.x
 	
c) 	SELECT y FROM R WHERE x >= y

d) 	SELECT * FROM R WHERE y IS NULL

 	
#### Answer:   d)
