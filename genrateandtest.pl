intersect(Xs,Ys,X) :- member(X,Xs),member(X,Ys).

%permutation sort
select(X,[X|Y],Y).
select(X,[H|T],[H|L]) :- select(X,T,L).

insert(X,L,L1) :- select(X,L1,L).
permutation([],[]).
permutation([X|Y],L) :- permutation(Y,L1),insert(X,L1,L).

ordered([]).
ordered([X]).
ordered([X,Y|Z]) :- X =< Y, ordered([Y|Z]).


permutation_sort(X,Xs) :- permutation(X,Xs),ordered(Xs).

range(M,N,[M|Ns]) :- M < N , M1 is M+1, range(M1,N,Ns).
range(N,N,[N]).

safe([Q|Qs]) :- safe(Qs),not(attack(Q,Qs)).
safe([]).

attack(Q,Qs) :- attack(Q,1,Qs).
attack(Q,N,[X|Y]) :- Q =:= X+N ; Q =:= X-N.
attack(Q,N,[X|Y]) :- N1 is N + 1, attack(Q,N1,Y).

queens(N,Qs) :- range(1,N,Ns),
		permutation(Ns,Qs),
		safe(Qs).
