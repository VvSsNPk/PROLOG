% Flatten a nested list structure.

duplicate([],[]).
duplicate([X|Y],[X,X|L]) :- duplicate(Y,L).

:- duplicate([a,b,c,d], X).
%@ X = [a, a, b, b, c, c, d, d].

:- duplicate([a,v], X).
%@ X = [a, a, v, v].


insert_node(X,nil,tree(X,nil,nil)).
insert_node(X,tree(Root,L,R),tree(Root,L1,R)) :- X @< Root, insert_node(X,L,L1).
insert_node(X,tree(Root,L,R),tree(Root,L,R1)) :- X @> Root, insert_node(X,R,R1).


contruct_tree(L,T) :- construct_tree_acc(L,T,nil).
construct_tree_acc([],T,T).
construct_tree_acc([X|Y],T,Tr) :- insert_node(X,Tr,Result),construct_tree_acc(Y,T,Result).


reverse([],[]).
reverse([X|Y],L) :- reverse(Y,L1),append(Y,[X],L).

reverse_acc(Ol,Rl) :- reverse_acc(Ol,[],Rl).
reverse_acc([],Acc,Acc).
reverse_acc([X|Y],Acc,Rl) :- reverse_acc(Y,[X|Acc],Rl).


reverse_hole(O,R) :-reverse_h(O,R-[]).
reverse_h([],R-R).
reverse_h([X|Y],L-M) :- reverse_h(Y,L-[X|M]).

% so here we write a predicate that adds elements from one list to other if that list is a member

compress(L,X) :- compress(L,[],X).
compress([X|Y],Acc,L) :- member(X,Acc), compress(Y,Acc,L). 
compress([X|Y],Acc,L) :- not(member(X,Acc)),compress(Y,[X|Acc],L).
compress([],Acc,Result) :- reverse_hole(Acc,Result).

len_list(L,N) :- len_list(L,0,N).
len_list([X|Y],Acc,N) :- Acc1 is Acc + 1, len_list(Y,Acc1,N).
len_list([],Acc,Acc).

part_list(L,[],0,L).
part_list([X|Y],[X|L],N,Z) :- M is N-1, part_list(Y,L,M,Z).

insert_at(X,L,Number,Result):-N is Number-1, part_list(L,Y,N,Rest), append(Y,[X|Rest],Result).


%pack consecutive elements of list into sub lists
pack([],[]).
pack([X|Xs],[Z|Zs]) :- transfer(X,Xs,Ys,Z),pack(Ys,Zs).

transfer(X,[],[],[X]).
transfer(X,[Y|Ys],[Y|Ys],[X]) :- X\=Y.
transfer(X,[X|Xs],Ys,[X|Z]) :- transfer(X,Xs,Ys,Z).

% lenght encoding of list is
lenght_encoding(L,R) :- pack(L,M),encode(M,R).

encode([X|L],[[Number,First]|Z]) :- length(X,Number),first_element(X,First),encode(L,Z).
encode([],[]).

first_element([X|Y],X).


append_ag([],L,L).
append_ag([H|T],L,[H|T1]) :- append_ag(T,L,T1).



reverse_ex([],[]).
reverse_ex([X],[X]) :- !.
reverse_ex([H|T],L) :- reverse_ex(T,X), append_ag(X,[H],L).


deetle_pred(X,[X|T],L) :- deetle_pred(X,T,L).
deetle_pred(X,[H|T],[H|L]) :- dif(X,H),deetle_pred(X,T,L).
deetle_pred(X,[],[]).

remove_duplicates([],[]).
remove_duplicates([X|Y],[X|L]) :- deetle_pred(X,Y,Z),remove_duplicates(Z,L).
%head removing all ocurrences in tale

mod(X,Y,Z) :- Z is X mod Y.
gcd(X,Y,Z) :- Y > 0,mod(X,Y,L), gcd(Y,L,Z).
gcd(X,0,X) :- X > 0.

coprime(X,Y) :- gcd(X,Y,1).
