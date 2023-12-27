:-op(900,xfx,user:(\)).
append_dl(Xs\Ys,Ys\Zs,Xs\Zs).




%flatten([X|Y],L) :- flatten(X,M),flatten(Y,N),append(M,N,L).
%flatten(X,[X]) :- X \= [].
%flatten([],[]).

%flatten(X,Y) :- flatten_dl(X,Y-[]).
%flatten_dl([X|Y],Ms-Ns) :- flatten_dl(X,Ms-Ls),flatten_dl(Y,Ls-Ns).
%flatten_dl(X,[X|Xs]-Xs) :- X \= [].
%flatten_dl([],Xs-Xs).

%flatten(X,Y) :- flatten(X,[],Y).
%flatten([X|Y],Acc,Ys) :- flatten(X,Acc,Y1),flatten(Y,Y1,Ys).
%flatten(X,Acc,[X|Acc]) :- X \= [].
%flatten([],X,X).

%reverse([],[]).
%reverse([X|Y],Z) :- reverse(Y,M), append(M,[X],Z).

reverse(X,Y) :- reverse_dl(X,Y-[]).
reverse_dl([X|Xs],Ys-Zs) :- reverse_dl(Xs,Ys-[X|Zs]).
reverse_dl([],Xs-Xs).

rverse_list([X|Y],L) :- rverse_list(Y,M),append(M,[X],L).
rverse_list([],[]).

constant(X) :- integer(X).
constant(X) :- atom(X).

flatten([],[]).
flatten([X|Y],L) :- flatten(X,M),flatten(Y,N),append(M,N,L).
flatten(X,[X]) :- constant(X), X \= [].

flatten_ag(X,Y) :- flatten_dl(X,Y-[]).
flatten_dl([X|Xs],Ls-Os) :- flatten_dl(X,Ls-Ms),flatten_dl(Xs,Ms-Os).
flatten_dl(X,[X|Xs]-Xs) :- constant(X), X \= [].
flatten_dl([],Xs-Xs).


%partition(Xs,X,L,B) means partitioning 
