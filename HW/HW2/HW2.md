# HW2 - Grouping and Aggregation

## Question 1
Here are three relations, R(A,B), S(C,D), and T(E,F). Their current values are:
```
  R	          S	          T
A	B       C	D       E	F
0	1       0   1       0   1
1	0       1   0       1   0
1	1       1   1       1   1
```
Compute the result of the query:

```
     SELECT A, F, SUM(C), SUM(D)
     FROM R, S, T
     WHERE B = C AND D = E
     GROUP BY A, F
     HAVING COUNT(*) > 1
```
Identify, in the list below, the row that appears in the result.

 
a) 	(1,1,2,2)
 	
b) 	(1,1,1,2)
 	
c) 	(0,1,2,2)
 	
d) 	(0,0,1,1)


#### Answer: a)

## Question 2
Suppose we have a relation with schema

R(A, B, C, D, E)

If we issue a query of the form

```
     SELECT ...
     FROM R
     WHERE ...
     GROUP BY B, E
     HAVING ???
```
What terms can appear in the HAVING condition (represented by ??? in the above query)? Identify, in the list below, the term that CAN NOT appear.

 
a) 	E

b) 	A

c) 	B+E

d) 	B*E

 
## Question 3
Suppose we have a relation with schema

R(A, B, C, D, E)

If we issue a query of the form

```
     SELECT ???
     FROM R
     WHERE ...
     GROUP BY C, D
```
What terms can appear in the SELECT list (represented by ??? in the above query)? Identify, in the list below, the term that CAN NOT appear.

 
a) 	B

b) 	SUM(E)

c) 	COUNT(A)

d) 	C+D

## Question 4
The table

Scores(Team, Day, Opponent, Runs)

Gives the scores in the Japanese Baseball League for two consecutive days. The data in this table is as follows:
```
Team	      Day   Opponent   Runs
Dragons	    Sunday	Swallows	4
Tigers	    Sunday	Bay Stars	9
Carp	    Sunday	Giants	    2
Swallows	Sunday	Dragons	    7
Bay Stars	Sunday	Tigers	    2
Giants	    Sunday	Carp	    4
Dragons	    Monday	Carp	    6
Tigers	    Monday	Bay Stars	5
Carp	    Monday	Dragons	    3
Swallows	Monday	Giants	    0
Bay Stars	Monday	Tigers	    7
Giants	    Monday	Swallows	5
```
Determine the result of the query


     SELECT Team, SUM(Runs)
     FROM Scores
     GROUP BY Team
Then, identify, in the list below, one of the tuples of the result.

```
a) 	Swallows	7
 	
b) 	Giants	    34
 	
c) 	Dragons	    4
 	
d) 	Dragons	    54
```

 	
#### Answer:   a)

## Question 5
The table Arc(x,y) currently has the following tuples (note there are duplicates): (1,2), (1,2), (2,3), (3,4), (3,4), (4,1), (4,1), (4,1), (4,2). Compute the result of the query:
```
SELECT a1.x, a2.y, COUNT(*)
FROM Arc a1, Arc a2
WHERE a1.y = a2.x
GROUP BY a1.x, a2.y;
```
Which of the following tuples is in the result?

 
a) 	(3,1,6)

b) 	(3,4,2)

c) 	(4,4,6)

d) 	(3,1,4)

 	
#### Answer:   a)
