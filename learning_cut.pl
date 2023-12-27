% here the predicate merge(X,Y,|XY) merges an already sorted list in a sorted order
merge([X|Xs],[Y|Ys],[X|Zs]) :- X < Y,!,merge(Xs,[Y|Ys],Zs).
merge([X|Xs],[Y|Ys],[Y|Zs]) :- X > Y, merge([X|Xs],Ys,Zs).
merge([X|Xs],[Y|Ys],[X,Y|Zs]) :- X = Y, merge(Xs,Ys,Zs).
merge(Xs,[],Xs).
merge([],Xs,Xs).
