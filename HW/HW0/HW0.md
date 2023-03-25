# HW 0 - Constraints

## Question 1
Suppose we start with the following relation-schema declaration:
```
        CREATE TABLE Emps (
(1)         id INT,
(2)         ssNo INT,
(3)         name CHAR(20),
(4)         managerID INT
        );
```
The numbers (1) through (4) are not part of the declaration, but will be used to refer to certain lines. Our intent is that both id and ssNo are keys by themselves, and that the value of managerID must be one of the values that appears in the id attribute of the same relation Emps. Which of the following is **not** a legal addition of SQL standard key and/or foreign-key constraints? Note: the addition does not have to achieve **all** the goals stated; it must only result in legal SQL.

 
a) Add PRIMARY KEY just before the comma on line (1), and add REFERENCES Emps(id) at the end of line (4).
 	
b) Add PRIMARY KEY just before the comma on line (1), and add , FOREIGN KEY (managerID) REFERENCES Emps(id) after line (4).
 	
c) Add UNIQUE just before the commas on lines (1) and (2).

d) Add , FOREIGN KEY (managerID) REFERENCES Emps(id) after line (4).

#### Answer: d)

## Question 2
Here are declarations of two relations R and S:
```
CREATE TABLE S(
    c INT PRIMARY KEY,
    d INT
);
CREATE TABLE R(
    a INT PRIMARY KEY,
    b INT,
    CHECK(b IN (SELECT c FROM S))
);
```
R(a,b) currently contains the four tuples (0,4), (1,5), (2,4), and (3,5). S(c,d) currently contains the four tuples (2,10), (3,11), (4,12), and (5,13). As a result, certain insertions and deletions on S are illegal, as are certain updates or insertions on R. You should develop simple tests for illegal operations of these four kinds. Then, show your understanding by indicating which of the following modifications will not be rejected because of a constraint violation.

a) 	Inserting (3,3) into R.

b) 	Updating (3,5) in R to be (3,3).

c) 	Updating (0,4) in R to be (0,0).
 	
d) 	Inserting (4,6) into R.
 
 	
#### Answer:   b)

## Question 3
Here are declarations of two relations R and S:
```
CREATE TABLE S(
    c INT PRIMARY KEY,
    d INT
);

CREATE TABLE R(
    a INT PRIMARY KEY,
    b INT REFERENCES S(c)
);
```
R(a,b) currently contains the four tuples (0,4), (1,5), (2,4), and (3,5). S(c,d) currently contains the four tuples (2,10), (3,11), (4,12), and (5,13). As a result, certain insertions and deletions on R and S are illegal. You should develop simple tests for illegal operations of these four kinds. Then, show your understanding by indicating which of the following modifications will **not** violate any constraint.

 
a) 	Inserting (0,3) into R.

b) 	Deleting (1,5) from R.

c) 	Inserting (1,2) into R.

d) 	Inserting (4,4) into S.
 	
#### Answer:   b)

## Question 4
Relation R has schema:
```
CREATE TABLE R (
    a INT PRIMARY KEY,
    b INT DEFAULT 0,
    c INT NOT NULL
);
```
R is currently empty. Develop a test that determines whether an insertion into R is currently legal. Then apply your test to determine which of the following INSERT statements is allowable.

 
a) 	INSERT INTO R(b,c) VALUES(3,4);

b) 	INSERT INTO R(a,b) VALUES(1,2);

c) 	INSERT INTO R(c,a) VALUES(6,7);

d) 	INSERT INTO R(b,a) VALUES(5,6);
 	
#### Answer:   c)

## Question 5
Relation SPP(supID, partID, projID, qty) is a relation whose tuples mean that supplier supID supplies part partID to project projID in quantity qty. Suppose that each of the four attributes are integers. Write a CREATE TABLE statement for relation SPP. Do not forget to declare that supID, partID, and projID together form the key. and that these are each foreign keys referencing the relations Suppliers, Parts, and Projects, respectively. Then, identify from the list below the element that would appear as part of the definition.	 

a) 	FOREIGN KEY Suppliers REFERENCES supID

b) 	FOREIGN KEY partID REFERENCES Parts

c) 	TABLE SPP

d) 	PRIMARY KEY (supID)
 	
#### Answer:   b)
