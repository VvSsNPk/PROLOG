:- autoload(library(lists), [member/2]).
isForm(S, var(X)) :- member(X,S),string(X).
isForm(S, neg(F)) :- isForm(S,F).
isForm(S, disj(F,G)) :- isForm(S, F), isForm(S, G).
isForm(S, conj(F,G)) :- isForm(S,F), isForm(S,G).
isForm(S,impl(F,G)) :- isForm(S,F), isForm(S,G).


simplify(var(X),var(X)).
simplify(conj(X,Y),conj(L,M)) :- simplify(X,L),simplify(Y,M).
simplify(neg(X),neg(L)) :- simplify(X,L).
simplify(disj(X,Y),neg(neg(L),neg(M))) :- simplify(X,L), simplify(Y,M).
simplify(impl(X,Y),conj(neg(L),M)) :- simplify(X,L), simplify(Y,M).

eval(P,var(N),V) :- member(assign(N,V),P).
eval(P,neg(F),V) :- simplify(F,Z), eval(P,Z,Fv), V is 1-Fv.
eval(P,conj(F,G),V) :- simplify(F,M), simplify(G,N), eval(P,M,Fv), eval(P,N,Gv), V is Fv * Gv.

