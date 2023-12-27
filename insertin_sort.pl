select(X,[X|T],T).
select(X,[H|T],[H|L]) :- select(X,T,L).

insert(X,L,L1) :- select(X,L1,L).


deleting(X,[],[]).
deleting(X,[X|T],L) :- deleting(X,T,L).
deleting(X,[H|T],[H|T1]) :- dif(X,H), deleting(X,T,T1).
