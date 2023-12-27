% so here we define some variables to the states that have some domains that should obey some constraints.
%Region = [region(a,A,[B,C,D]),region(b,B,[A,C,E]),region(c,C,[A,B,D,E,F]),region(d,D,[A,C,F]),region(e,E,[B,C,F]),region(f,F,[E,C,D])].
%Colors_se = [red,white,yellow,blue].

color_map([R|Rs],Colors):-
    color_region(R,Colors),
    color_map(Rs,Colors).
color_map([],Colors).



color_region(region(Name,Color,Neighbors),Colors) :-
    select(Color,Colors,Color1), member(Neighbors,Colors1).


select(X,[X|Y],Y).
select(X,[H|T],[H|L]) :- select(X,T,L).
