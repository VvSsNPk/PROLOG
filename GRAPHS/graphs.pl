edge(oradea,71,zerind).
edge(oradea,151,sibiu).
edge(zerind,75,arad).
edge(arad,140,sibiu).
edge(arad,118,timisoara).
edge(sibiu,99,fagaras).
edge(sibiu,80,'riminicu vilcea').
edge(timisoara,111,lugoj).
edge(lugoj,70,mehadia).
edge(mehadia,75,drobeta).
edge(drobeta,120,craiova).
edge('rimnicu vilcea',146,craiova).
edge(craivova,138,pitesti).
edge('rimnicu vilcea',97,pitesti).
edge(pitesti,101,bucharest).
edge(fagaras,211,bucharest).
edge(bucharest,90,giurgiu).
edge(bucharest,85,urziceni).
edge(urziceni,98,hirsova).
edge(hirsova,96,eforie).
edge(urziceni,142,valsui).
edge(valsui,92,lasi).
edge(lasi,87,neamt).

goal(bucharest).

% breadth first search in prolog
% here you have to use find all for a given node and do bfs on that nodes

bfs(Node,[Node]) :- goal(Node).
bfs(Node,List) :- findall(X,edge(Node,_,X),List).


