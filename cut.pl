delete(X,[],[]).

delete(X,[H|Y],[H|Z]) :- delete(X,Y,Z).
delete(X,[X|Y],L) :-!,delete(X,Y,L).

reverse_dl([],[]).
reverse_dl([X|Y],L) :- reverse_dl(Y,M), append(M,[X],L).
