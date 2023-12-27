binary_tree(void).
binary_tree(tree(Root,Left,Right)) :- binary_tree(Left),binary_tree(Right).


member_tree(X,tree(X,L,R)).
member_tree(X,tree(R,Nl,Nr)) :- member_tree(X,Nl).
member_tree(X,tree(R,Nl,Nr)) :- member_tree(X,Nr).

%here we are inserting a node in a empty tree
insert_node(X,nil,tree(X,nil,nil)).
insert_node(X,tree(Root,Left,Right),tree(Root,Left1,Right)) :- X @< Root, insert_node(X,Left,Left1).
insert_node(X,tree(Root,Left,Right),tree(Root,Left,Right1)) :- X @> Root, insert_node(X,Right,Right1).


construct_tree([],nil).
construct_tree([X|Y],T) :- construct_tree(Y,T1), insert_node(X,T1,T).

in_order(tree(X,L,R),Xs) :- in_order(L,Ls),in_order(R,Rs),append(Ls,[X|Rs],Xs).
in_order(nil,[]).

tdcraversing(L,OLs) :- construct_tree(L,T),in_order(T,OLs).

count_leaves(nil,0).
count_leaves(tree(Root,nil,nil),1). 
count_leaves(tree(Root,Left,Right),X) :- count_leaves(Left,M),count_leaves(Right,N), X is M + N.



