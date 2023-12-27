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


search_df([Goal|Rest],Goal) :-
    goal(Goal).
search_df([Cureent|Rest],Goal) :-
    children(Current,Children),
    append(Children,Rest,NewAgenda),
    search_df(NewAgenda,Goal).

children([Node|Path],Children) :-
    findall([C,Node|Path],edge(Node,_,C),Children).



search_df_loop([Goal|Rest],Visited,Goal) :-
    goal(Goal).
search_df_loop([Current|Rest],Visited,Goal) :-
    children(Current,Children),
    add_df(Children,Rest,Visited,NewAgenda),
    search_df_loop(NewAgenda,[Current|Visited],Goal).

add_df([],Agenda,Visited,Agenda).
add_df([Child|Rest],OldAgenda,Visited,[Child|NewAgenda]):-
    not(member(Child,OldAgenda)),
    not(member(Child,Visited)),
    add_df(Rest,OldAgenda,Visited,NewAgenda).
add_df([Child|Rest],OldAgenda,Visited,NewAgenda):-
    member(Child,OldAgenda),
    add_df(Rest,OldAgenda,Visited,NewAgenda).
add_df([Child|Rest],OldAgenda,Visited,NewAgenda):-
    member(Child,Visited),
    add_df(Rest,OldAgenda,Visited,NewAgenda).

