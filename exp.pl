nat(zero).
nat(s(X)) :- nat(X).

add(X,zero,X) :- nat(X).
add(X,s(Y),s(Z)) :- add(X,Y,Z).
