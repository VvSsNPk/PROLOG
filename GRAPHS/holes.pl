%problem definition Dijkstra's Dutch Flag Problem. convert the list in following order.
% [red(1),white(2),blue(3),red(4),white(5)] -> [red(1),red(4),white(2),white(5),blue(3)].

collecting([red(X)|T],[red(X)|R]-Reds1,Whites,Blues):- collecting(T,R-Reds1,Whites,Blues).
collecting([white(X)|T],Red,[white(X)|W]-Whites1,Blues) :- collecting(T,Red,W-Whites1,Blues).
collecting([blue(X)|T],Red,White,[blue(X)|B]-Blues1) :- collecting(T,Red,White,B-Blues1).
collecting([],R-R,W-W,B-B).

appned(X-Y,Y-Z,Z-M,X-M).

dutchflag(X,L) :- collecting(X,R,W,B), appned(R,W,B,L).

lookup(Key,[(Key,Value)|Dict],Value).
lookup(Key,[(Key1,Value1)|Dict],Value) :- dif(Key,Key1),lookup(Key,Dict,Value).
