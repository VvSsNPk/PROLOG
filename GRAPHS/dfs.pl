edge(a,6,b).
edge(a,1,c).
edge(b,3,c).
edge(b,1,e).
edge(c,6,g).
edge(c,2,f).
edge(d,1,h).
edge(e,5,d).
edge(e,2,f).
edge(f,5,h).
edge(f,8,i).
edge(g,1,f).
edge(g,4,i).
edge(h,5,i).

goal(i).


solve(Node, Solution) :-
    depthfirst([], Node, Solution).


depthfirst(Path, Node,Solution):-
    goal(Node).

depthfirst(Path, Node,Solution) :-
    edge(Node,_,Node1),
    \+ member(Node1, Path),
    depthfirst([Node|Path],Node1,Solution).
