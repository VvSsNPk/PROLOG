unmarried_student(X) :- not(married(X)), student(X).
student(bill).
married(joe).

member_of(X,Xs,Ys) :- member(X,Xs),member(X,Ys).
disjoint(Xs,Ys) :- not(member_of(X,Xs,Ys)).

factorial(1,1).
factorial(N,A) :-N > 1,
		 N1 is N-1,
		 factorial(N1,M),
		 A is N*M.

factorial_bcc(N,A) :- factorial_bcc(0,N,1,A).
factorial_bcc(I,N,Z,A) :-I < N,
			 I1 is I + 1,
			 Z1 is Z * I1,
			 factorial_bcc(I1,N,Z1,A).
factorial_bcc(N,N,A,A).

between(I,J,I) :- I =< J.
between(I,J,K) :- I < J, I1 is I+1, between(I1,J,K).

summing([],0).
summing([X|Y],N) :- summing(Y,N1),N is X + N1.

sum_acc(L,A) :- sum_acc(L,0,A).
sum_acc([],A,A).
sum_acc([X|Y],Z,A) :- Z1 is Z + X, sum_acc(Y,Z1,A).

is_list([]).
is_list([X|Y]) :- is_list(Y).


flatten([X|Y],Xs) :- flatten(X,M),flatten(Y,N),append(M,N,Xs).
flatten([],[]).
flatten(X,[X]) :- not(is_list(X)).

flatten_my(L,Lf) :- flatten_my(L,Lf,[]).
flatten_my([X|Y],Lf,[Xs,Ys|L]) :- flatten_my(X,Xs,L),flatten_my(Y,Ys,L).
flatten_my([],L,L).


