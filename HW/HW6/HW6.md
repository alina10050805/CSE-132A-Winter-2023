# HW 6: Recursive queries

## Question 1
Consider relation R(a) containing a set of positive integers with no duplicates, and the following recursive SQL query (do not be concerned that in the SQL definition, nonlinear recursions such as this one are not required to be implemented):
```
    WITH RECURSIVE Mystery(X,Y) AS
       (SELECT A AS X, A AS Y FROM R)
        UNION
       (SELECT m1.X, m2.Y
        FROM Mystery m1, Mystery m2
        WHERE m2.X = m1.Y + 1)
    SELECT MAX(Y-X) + 1 FROM Mystery;
```
While the definition looks complicated, Mystery in fact computes a property of R that can be stated very succinctly. Try to determine what Mystery is computing about R, and demonstrate your understanding by identifying, from the list below, the correct example of the result returned by the above query.

 
a) 	If R = { 2, 3, 4, 5, 10, 11, 12} then the query returns 4.

b) 	If R = { 2, 3, 4, 5, 10, 11, 12} then the query returns 7.

c) 	If R = {7, 9, 10, 14, 15, 16, 18} then the query returns 12.

d) 	If R = {2, 4, 6, 8, 10} then the query returns 9.


#### Answer: a)

## Question 2
Consider a relation Parent(par,ch), where a tuple (p,c) in Parent specifies that person p is the parent of person c. The only key for Parent consists of both attributes together. We are interested in writing a recursive query to find all descendants of the person named "Eve." Below you see six WITH-statements, each defining a recursive relation Ancestor(X,Y).
```
1) WITH RECURSIVE Ancestor(X,Y) AS
     ( (SELECT par,ch FROM Parent)
        UNION
       (SELECT Ancestor.X, Parent.ch
        FROM Ancestor, Parent
        WHERE Ancestor.Y=Parent.par) )

2) WITH RECURSIVE Ancestor(X,Y) AS
     ( (SELECT par,ch FROM Parent WHERE par='Eve')
        UNION
       (SELECT Ancestor.X, Parent.ch
        FROM Ancestor, Parent
        WHERE Ancestor.Y=Parent.par) )

3) WITH RECURSIVE Ancestor(X,Y) AS
     ( (SELECT par,ch FROM Parent)
        UNION
       (SELECT Parent.par, Ancestor.Y
        FROM Parent, Ancestor
        WHERE Parent.ch = Ancestor.X) )

4) WITH RECURSIVE Ancestor(X,Y) AS
     ( (SELECT par,ch FROM Parent)
        UNION
       (SELECT Parent.par, Ancestor.Y
        FROM Parent, Ancestor
        WHERE Parent.ch = Ancestor.X and Parent.par='Eve') )

5) WITH RECURSIVE Ancestor(X,Y) AS
     ( (SELECT par,ch FROM Parent WHERE par='Eve')
        UNION
       (SELECT A1.X, A2.Y
        FROM Ancestor A1, Ancestor A2
        WHERE A1.Y = A2.X) )

6) WITH RECURSIVE Ancestor(X,Y) AS
     ( (SELECT par,ch FROM Parent)
        UNION
       (SELECT A1.X, A2.Y
        FROM Ancestor A1, Ancestor A2
        WHERE A1.Y = A2.X and A1.X='Eve') )
```
Any one of these WITH-statements could be followed by any query about the relation Ancestor. We shall consider two possible queries, with which to complete one of the WITH-statements (1) through (6):

```
A: SELECT Y FROM Ancestor;

B: SELECT Y FROM Ancestor WHERE X='Eve';
```
You should determine which of the six WITH-statements above, when followed by A or B, or both, will produce the correct answer: exactly those people who are descendants of Eve. Then, select the true statement from the list below. Note: do not concern yourself with the fact that SQL recursion is only required to be implemented for linear recursions, while several of the WITH-statements use nonlinear recursion.

 
a) 	Neither (A) nor (B) works on exactly (2) and (4).

b) 	(A) works on exactly (1), (2), (4), and (5).

c) 	Neither (A) nor (B) works on exactly (1), (3), and (5).

d) 	(B) works but (A) does not for exactly (1), (3), and (6).

 