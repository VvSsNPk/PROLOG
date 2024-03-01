flatten_list([],[]).
flatten_list([X|Y],L) :- flatten_list(X,L2),flatten_list(Y,L1),append(L2,L1,L).
flatten_list(X,[X]):- \+ is_list(X).

is_list([]).
is_list([_|Y]) :- is_list(Y).

first_part([],_,[]).
first_part(_,0,[]).
first_part([X|Y],N,[X|M]) :- N >= 0,Z is N-1, first_part(Y,Z,M).

split([],_,[],[]).
split(L,N,L1,L2) :- first_part(L,N,L1),append(L1,L2,L).

lenght([],1).
lenght([X|Y],N) :- lenght(Y,M), N is M + 1.

rotate([],_,[]).
rotate(L,0,L).
rotate(L,N,L1) :- split(L,N,L2,L3),append(L3,L2,L1).
rotate(L,N,L1) :- N < 0,lenght(L,M), K is M + N -1,split(L,K,L2,L3),append(L3,L2,L1).


delete_first(X,[X|Y],Y).
delete_first(X,[Xs|Ys],[Xs|L]) :- X \= Xs, delete_first(X,Ys,L).

select_one(X,L,Z) :- delete_first(X,Z,L).

list_rnd([X],[X]).
list_rnd([X|Y],L) :- list_rnd(Y,M), select_one(X,M,L).

range(N,N,[N]).
range(M,N,[M|L]) :- M < N,K is M + 1, range(K,N,L).


