# HW5 - Triggers and Views

## Question 1
Suppose relation R(a,b,c) has the following tuples: (1,1,3), (1,2,3), (2,1,4), (2,3,5), (2,4,1), (3,2,4), and (3,3,6). Define the view V by:
```
CREATE VIEW V AS
    SELECT a+b AS d, c FROM R;
```
What is the result of the query:

```
SELECT d, SUM(c) FROM V
GROUP BY d
HAVING COUNT(*) <> 1;
```
Identify, from the list below, a tuple in the result.

 
a) 	(1,8)

b) 	(2,3)

c) 	(2,7)

d) 	(5,9)



#### Answer: d)

## Question 2
Here is a SQL standard trigger on relation R(a,b):
```
CREATE TRIGGER T
AFTER INSERT ON R
REFERENCING NEW ROW AS Newtuple
FOR EACH ROW
WHEN(Newtuple.a * Newtuple.b > 10)
INSERT INTO R VALUES(Newtuple.a - 1, Newtuple.b + 1);
```
When we insert a tuple into R, the trigger may cause another tuple to be inserted, which may cause yet another tuple to be inserted, and so on, until finally a tuple is inserted that does not cause the trigger to fire. Your problem is to examine the behavior of this trigger and determine under what circumstances exactly three tuples are inserted. Demonstrate your understanding by identifying, from the list below, which of the following tuples, if inserted into an initially empty relation R, results, after all instances of the trigger are allowed to execute, in exactly three tuples being present in R(a,b)?

 
a) 	(5,3)

b) 	(2,9)

c) 	(50,0)

d) 	(3,5)
