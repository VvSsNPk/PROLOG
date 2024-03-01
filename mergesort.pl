lenghtof([],0).
lenghtof([X|T],Y) :- lenghtof(T,Z), Y is Z +1.

split_list(List,F,S):-
    lenghtof(List, Len),
    Halflen is Len // 2,
    lenghtof(F, Halflen),
    append(F,S,List).



sorting_two(List,[],List).
sorting_two([],List,List).
sorting_two([L1|L],[R1|R],[L1|Finallist]) :-L1 =< R1, sorting_two(L, [R1|R], Finallist).

sorting_two([L1|L],[R1|R],[R1|Finallist]) :- R1 < L1,sorting_two([L1|L],R , Finallist).

merge_sort([],[]).
merge_sort([X],[X]).
merge_sort(List,Ans):-
    lenghtof(List, L),
    L >= 1,
    split_list(List, Left, Right),
    merge_sort(Left,SortedLeft),
    merge_sort(Right,SortedRight),
    sorting_two(SortedLeft, SortedRight, Ans).
