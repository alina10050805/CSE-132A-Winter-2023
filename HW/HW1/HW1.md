# HW1 - Basic SQL

## Question 1
Suppose relations R(A,B) and S(B,C,D) have the tuples shown below:
```
        A	B
        1	2
R =	    3	4
        5	6

        B	C	D
        2	4	6
S =	    4	6	8
        4	7	9
```
Compute the result of the join query:
```
     SELECT A, R.B, S.B, C, D
     FROM R, S
     WHERE R.A < S.C AND R.B < S.D
```
Then, identify one of the tuples in the result from the list below.

 
a) 	(3,4,4,7,8)

b) 	(1,2,4,4,6)

c) 	(3,4,4,6,8)

d) 	(1,2,2,6,8)


#### Answer: c)

## Question 2
Here are three relations, R(a,b), S(a,b), and T(a,b). Their current values are:
```
  R	          S	          T
a	b       a	b       a	b
0	0       0   0       0   0
0	1       0   1       0   1
1	0       1   0       1   0
1	1       1   1       1   1
```
Compute the result of the query:
```
     SELECT R.a, R.b, S.b, T.b
     FROM R, S, T
     WHERE R.b = S.a AND S.b <> T.b
```
Identify, in the list below, the true statement about whether or not a tuple appears in the output, and how many times it appears.

 
a) 	(0,0,0,0) appears once.

b) 	(1,1,1,0) appears once.

c) 	(1,0,0,1) appears once.

d) 	(0,1,1,1) does not appear.
 

 
 	
#### Answer:   d)

## Question 3
The latest scores from the Japanese Baseball League are in the table with schema
```
Scores(Team, Opponent, RunsFor, RunsAgainst)
```
The data in this table is as follows:
```
Team	        Opponent        RunsFor     RunsAgainst
Dragons	        Tigers	            5	        3
Carp	        Swallows	        4	        6
Bay Stars	    Giants	            2	        1
Marines	        Hawks	            5	        3
Ham Fighters	Buffaloes	        1	        6
Lions	        Golden Eagles	    8	        12
Tigers	        Dragons	            3	        5
Swallows	    Carp	            6	        4
Giants	        Bay Stars	        1	        2
Hawks	        Marines	            3	        5
Buffaloes	    Ham Fighters	    6	        1
Golden Eagles   Lions	            12	        8
```
What is the result of executing on this data the query:

```
    SELECT Team
    FROM Scores
    WHERE RunsFor > RunsAgainst AND
        RunsFor <= RunsAgainst + 2
```
Identify in the list below, the team that appears in the output.

 
a) 	Hawks

b) 	Giants

c) 	Ham Fighters

d) 	Bay Stars

 	
#### Answer:   d)

## Question 4
The latest scores from the Japanese Baseball League are in the table with schema
```
Scores(Team, Opponent, RunsFor, RunsAgainst)
```
The data in this table is as follows:
```
Team	        Opponent        RunsFor     RunsAgainst
Dragons	        Tigers	            5	        3
Carp	        Swallows	        4	        6
Bay Stars	    Giants	            2	        1
Marines	        Hawks	            5	        3
Ham Fighters	Buffaloes	        1	        6
Lions	        Golden Eagles	    8	        12
Tigers	        Dragons	            3	        5
Swallows	    Carp	            6	        4
Giants	        Bay Stars	        1	        2
Hawks	        Marines	            3	        5
Buffaloes	    Ham Fighters	    6	        1
Golden Eagles   Lions	            12	        8
```
What is the result of executing on this data the query:
```
     SELECT S1.Team, S2.Team
     FROM Scores S1, Scores S2
     WHERE S1.Team < S2.Team AND
         (S1.RunsFor = S2.RunsFor 
          OR S1.RunsAgainst = S2.RunsAgainst)
```
Remember that when strings are compared, "<" means "precedes in alphabetical order.

Identify, in the list below, a row of the result.

```
a) 	Giants	    Hawks
 	
b) 	Swallows	Buffaloes
 	
c) 	Buffaloes	Bay Stars
 	
d) 	Giants	    Ham Fighters
```


 	
#### Answer:   d)

## Question 5
The latest scores from the Japanese Baseball League are in the table with schema
```
Scores(Team, Opponent, RunsFor, RunsAgainst)
```
The data in this table is as follows:
```
Team	        Opponent        RunsFor     RunsAgainst
Dragons	        Tigers	            5	        3
Carp	        Swallows	        4	        6
Bay Stars	    Giants	            2	        1
Marines	        Hawks	            5	        3
Ham Fighters	Buffaloes	        1	        6
Lions	        Golden Eagles	    8	        12
Tigers	        Dragons	            3	        5
Swallows	    Carp	            6	        4
Giants	        Bay Stars	        1	        2
Hawks	        Marines	            3	        5
Buffaloes	    Ham Fighters	    6	        1
Golden Eagles   Lions	            12	        8
```
What is the result of executing on this data the query:

```
     SELECT Team AS Winner, RunsFor + RunsAgainst AS Runs
     FROM Scores
     WHERE RunsFor > RunsAgainst
```
Identify in the list below, a value and the name of a column in which it appears.

 
a) 	"Dragons" appears in column Winner.
 	
b) 	12 appears in column Runs.

c) 	"Hawks" appears in column Winner.
 	
d) 	"Buffaloes" appears in column Team.
 	
#### Answer:   a)

## Question 6
Suppose relations R(A,B) and S(B,C,D) have the tuples shown below:
```
        A	B
        1	2
R =	    3	4
        5	6

        B	C	D
        2	4	6
S =	    4	6	8
        4	7	9
```
Compute the result of the join query:

```
     SELECT A, R.B, C, D
     FROM R, S
     WHERE R.B = S.B
```
Then, identify which of the following tuples is in the result.

 
a) 	(5,6,7,8)
 	
b) 	(3,4,6,8)
 	
c) 	(5,6,4,6)
 	
d) 	(3,4,2,6)
 	
#### Answer:   b)


## Question 7
The latest scores from the Japanese Baseball League are in the table with schema
```
Scores(Team, Opponent, RunsFor, RunsAgainst)
```
The data in this table is as follows:
```
Team	        Opponent        RunsFor     RunsAgainst
Dragons	        Tigers	            5	        3
Carp	        Swallows	        4	        6
Bay Stars	    Giants	            2	        1
Marines	        Hawks	            5	        3
Ham Fighters	Buffaloes	        1	        6
Lions	        Golden Eagles	    8	        12
Tigers	        Dragons	            3	        5
Swallows	    Carp	            6	        4
Giants	        Bay Stars	        1	        2
Hawks	        Marines	            3	        5
Buffaloes	    Ham Fighters	    6	        1
Golden Eagles   Lions	            12	        8
```
What is the result of executing on this data the query:

```
     SELECT Team, Opponent
     FROM Scores
     WHERE Team LIKE '% %' OR
         Opponent LIKE '_i%'
```
Identify, in the list below, a row of the result.

```
a) 	Hawks	    Marines
 	
b) 	Marines	    Hawks
 	
c) 	Dragons	    Tigers
 	
d) 	Swallows	Carp
```

 	
#### Answer:   c)


## Question 8
The latest scores from the Japanese Baseball League are in the table with schema
```
Scores(Team, Opponent, RunsFor, RunsAgainst)
```
The data in this table is as follows:
```
Team	        Opponent        RunsFor     RunsAgainst
Dragons	        Tigers	            5	        3
Carp	        Swallows	        4	        6
Bay Stars	    Giants	            2	        1
Marines	        Hawks	            5	        3
Ham Fighters	Buffaloes	        1	        6
Lions	        Golden Eagles	    8	        12
Tigers	        Dragons	            3	        5
Swallows	    Carp	            6	        4
Giants	        Bay Stars	        1	        2
Hawks	        Marines	            3	        5
Buffaloes	    Ham Fighters	    6	        1
Golden Eagles   Lions	            12	        8
```
What is the result of executing on this data the query:

```
     SELECT *
     FROM Scores
     WHERE RunsFor > 5
```
Identify in the list below, a row in the result.

``` 
a) 	Buffaloes	Ham Fighters	1
 	
b) 	Bay Stars	    Giants      2   1
 	
c) 	Lions	    Golden Eagles	8	12
 	
d) 	                8
```

 	
#### Answer:   c)
