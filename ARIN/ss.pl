solvable(X) :- goal(X).
solvable(X) :- move(X,Y), solvable(Y).

goal(e).
move(a,b).
move(a,c).
move(b,d).
move(c,d).
move(d,e).
