list_reverse([],[]).
list_reverse([X|Y],Z) :- list_reverse(Y,Z1),append(Z1,[X],Z).


select_one(X,[X|Y],Y).
select_one(X,[H|T],[H|Y]) :- select_one(X,T,Y).

insert_one(X,Xs,Ys) :- select_one(X,Ys,Xs).

permuatation([X|Xs],Zs) :- permutation(Xs,Ys),insert(X,Ys,Zs).
permuatation([],[]).

delete_my(_,[],[].).
delete_my(X,[X|Y],Z) :- delete_my(X,Y,Z).
delete_my(X,[Y|Z],[Y|L] :- dif(X,Y),delete_my(X,Z,L).

count_element(X,[X|T],Z) :- count_element(X,T,N), Z is N+1.
count_element(X,[H|T],Z) :-dif(X,H),count_element(X,T,Z).
count_element(X,[],0).

ordered([X]).
ordered([X,Z|Y]) :-X =< Z,ordered([Z|Y]).


sorting_of(L,X) :- permutation(L,X), ordered(X).


insert_two(X,[],[X]).
insert_two(X,[H|T],[H|Y]) :- X > H, insert_two(X,T,Y).
insert_two(X,[H|T],[X,H|T]) :- X =< H.


sorting_again([X],[X]).
sorting_again([H|T],L ):- sorting_again(T,Z),insert_two(H,Z,L).


%tree(Element,Left,Right).
binary_tree(void).
binary_tree(tree(Element,Left,Right)) :- binary_tree(Left),binary_tree(Right).

partition([],X,[],[]).
partition([H|T],X,[H|Ls],Bs) :- H < X, partition(T,X,Ls,Bs).
partition([H|T],X,Ls,[H|Bs]) :- H >= X, partition(T,X,Ls,Bs).

quick_sort([H|T],Xs) :- partition(T,H,Ls,Bs),
			quick_sort(Ls,Ms),
			quick_sort(Bs,Ns),
			append(Ms,[H|Ns],Xs).
quick_sort([],[]).

% substitution of a atom with other atoms.
substitue(X,Y,[],[]).
substitue(X,Y,[X|T],[Y|Z]) :- substitue(X,Y,T,Z).
substitue(X,Y,[H|T],[H|M]) :- dif(X,H),substitue(X,Y,T,M).

select_variant(X,[X|Ys],Ys).
select_variant(X,[H|T],Z) :- dif(X,H),select_variant(X,T,Z).
% write a program to remove doubles .
%version 1 removing duplicates that means there exist only one duplicate.
member_of(X,[X|T]).
member_of(X,[H|T]) :- member_of(X,T).

nonmember(X,[]).
nonmember(X,[H|T]):- dif(X,H) , nonmember(X,T).


doubles([],[]).
doubles([X|T],L) :- member_of(X,T), doubles(T,L).
doubles([X|T],[X|L]) :- nonmember(X,T),doubles(T,L).
