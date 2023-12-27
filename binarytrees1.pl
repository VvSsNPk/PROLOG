term_tree(Tree,Root,Subtrees) :- Tree =.. [Root|Subtrees].
term_root(Tree,Root) :- term_tree(Tree,Root,_).
term_subtree(Tree,Subtree) :- term_tree(Tree,_,S),member(Subtree,S).


term_arc(Tree,Arc):-
    term_subtree(Tree,Subtree),
    term_arc(Subtree,Arc).

term_arc(Tree,[Root,Sr]) :-
    term_root(Tree,Root),
    term_subtree(Tree,Subtree),
    term_root(Subtree,Sr).


