# HW3 - Nested queries

## Question 1
The table

Scores(Team, Day, Opponent, Runs)

Gives the scores in the Japanese Baseball League for two consecutive days. The data in this table is as follows:
```
Team	      Day	Opponent   Runs
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

```
     SELECT Team, Day
     FROM Scores S1
     WHERE Runs <= ALL
         (SELECT Runs FROM Scores S2
          WHERE S1.Day = S2.Day
         )
```
Then, identify, in the list below, one of the rows of the result. one of these queries.

Hint: When trying to understand what a query does, it is often easiest to work "inside-out." That is, first understand the subquery. Notice that the subquery in this problem has an "input," S1.Day, that is determined outside the subquery, and depends on which row of scores the alias variable S1 refers to.

 ```
a) 	Tigers	Monday
 	
b) 	Giants	Sunday
 	
c) 	Carp	Sunday
 	
d) 	Dragons	Monday
```


#### Answer: c)

## Question 2
The table

Scores(Team, Day, Opponent, Runs)

Gives the scores in the Japanese Baseball League for two consecutive days. The data in this table is as follows:
```
Team	      Day	Opponent   Runs
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

```
     SELECT Team, Day
     FROM Scores S1
     WHERE NOT EXISTS
         (SELECT * FROM Scores S2
          WHERE S1.Runs = S2.Runs AND
              (S1.Team <> S2.Team 
               OR S1.Day <> S2.Day)
         )
```
Then, identify, in the list below, one of the rows of the result.

Hint: When trying to understand what a query does, it is often easiest to work "inside-out." That is, first understand the subquery. Notice that the subquery in this problem has "inputs" S1.Day, S1.Runs, and S1.Team that are determined outside the subquery and depend on which row of scores the alias variable S1 refers to.

 ```
a) 	Bay Stars	Sunday
 	
b) 	Swallows	Monday
 	
c) 	Swallows	Sunday
 	
d) 	Giants	    Monday
```

 
 	
#### Answer:   b)
