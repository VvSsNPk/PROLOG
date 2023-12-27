h(8,a).
h(6,b).
h(10,c).
h(2,d).
h(4,e).

%sort_heuristic(L,Sl).
heuristic_list(L) :- findall(h(X,Y),h(X,Y),L).

sort_h([h(X,_)|Xs],Ys) :- sort_h(Xs,Zs), insert(h(X,_),Zs,Ys).
sort_h([],[]).

insert(h(X,M),[],[h(X,M)]).
insert(h(X,L),[h(Y,M)|Ys],[h(Y,M)|Zs]) :- X > Y,insert(h(X,L),Ys,Zs).
insert(h(X,L),[h(Y,M)|Ys],[h(X,L),h(Y,M)]) :- X =< Y.
