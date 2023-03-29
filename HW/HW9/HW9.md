# HW9: Concurrency control	

## Question 1
Which of the following schedules is serializable?	 

a) 	w2(Y),r1(X),r1(Y),w2(X),c2,r1(Z),w1(Y),w1(Z), c1

b) 	r1(X),r2(X),w1(Y),w1(X),w1(Z),c1,r2(Y),w2(Z),c2

c) 	r1(Y),r2(Y),w1(Z),w1(Y),w1(X),c1,r2(Z),w2(X),c2

d) 	r2(Y),r1(Y),w2(Z),r2(X),r1(Z),w2(X),c2,w1(Y),c1



## Question 2
Here are two transactions:
```
T1: r1(X), w1(X), r1(Y), w1(Y)
T2: r2(X), r2(Y), w2(X), w2(Y)
```
We wish to insert lock (l) and unlock (u) operations into the read and write steps of T1 and T2, and then schedule all of these operations using a two-phase-locking scheduler. Several different sequences of the 16 r, w, l, and u operations are allowed by this scheduler. Your problem is to find a simple way to recognize whether a schedule is allowable. Demonstrate your understanding by identifying the schedule that would be allowed by a two-phase-locking scheduler, from the list below.

 
a) 	l1(X), r1(X), w1(X), u1(X), l2(X), r2(X), l1(Y), r1(Y), w1(Y), u1(Y), l2(Y), r2(Y), w2(X), w2(Y), u2(X), u2(Y).

b) 	l1(X), r1(X), w1(X), l1(Y), l2(X), r2(X), r1(Y), w1(Y), u1(X), u1(Y), l2(Y), r2(Y), w2(X), w2(Y), u2(X), u2(Y).

c) 	l1(X), r1(X), w1(X), l1(Y), u1(X), r2(X), r1(Y), w1(Y), u1(Y), r2(Y), l2(X), l2(Y), w2(X), w2(Y), u2(X), u2(Y).

d) 	l1(X), r1(X), w1(X), l1(Y), r1(Y), w1(Y), u1(Y), u1(X), l2(X), r2(X), l2(Y), r2(Y), w2(X), w2(Y), u2(X), u2(Y).

 
 	

## Question 3
Consider the following transaction schedule:

r1(X), r2(X), r3(X), r1(Y), w2(Z), r3(Y), w3(Z), w1(Y)

This schedule is conflict-equivalent to some or all serial schedules. Determine which serial schedules it is conflict-equivalent to, and then identify the true statement from the list below.

 
a) 	The schedule is conflict-equivalent to (T3, T1, T2)

b) 	The schedule is conflict-equivalent to (T2, T1, T3)

c) 	The schedule is not serial

d) 	The schedule is conflict-equivalent to (T3, T2, T1)

 	