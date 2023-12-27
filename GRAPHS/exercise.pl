insert_node(X,nil,tree(X,nil,nil)).
insert_node(X,tree(Root,Left,Right),tree(Root,Left1,Right)) :- X @< Root, insert_node(X,Left,Left1).
insert_node(X,tree(Root,Left,Right),tree(Root,Left,Right1)) :- X @> Root, insert_node(X,Right,Right1).


construct_tree(L,T) :- construct_tree_acc(L,T,nil).
construct_tree_acc([],T,T).
construct_tree_acc([X|Y],T,Acc) :- insert_node(X,Acc,Acc1), construct_tree_acc(Y,T,Acc1).


pre_order(nil,[]).
pre_order(tree(Root,Left,Right), List) :- pre_order(Left,X), pre_order(Right,Y),append(X,[Root|Y],List).

in_order(nil,[]).
in_order(tree(Root,Left,Right),List) :- in_order(Left,X), in_order(Right,Y), append([Root|X],Y,List).
