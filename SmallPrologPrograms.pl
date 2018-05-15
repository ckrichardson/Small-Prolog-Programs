checkifthere(X, []).
checkifthere(X, [Y|Z]) :- X \= YZ, checkifthere(X, Z).
isSet( [] ).
isSet( [X|Y] ) :- checkifthere(X, Y), isSet(Y).

member(X, [X|_]).
member(X, [_|T]) :- member(X, T).
subset([], []).
subset([], _).
subset([H1|T1], L) :- member(H1, L), subset(T1, L).

append([], L, L).
append([H|T], L, [H|L1]) :- append(T, L, L1).
union([], _, _).
union(_, [], _).
union([H1|T1], L, C) :- member(H1, L), union(T1, L, C).
union([H1|T1], L, [H|C]) :- \+member(H1, L), union(T1, L, C).

intersection([], _, _).
intersection(_, [], _).
intersection([H1|T1], [H2|T2], C) :- member(H1, [H2|T2]), append(H1, C, C).
intersection([H1|T1], L, C) :- \+member(H1, L), intersection(T1, L, C).


tally([], [], 0).
tally(_, [], 0).
tally(X, [X|T2], N) :- tally(X, T2, Y), N is Y + 1.
tally(X, [Y|T2], P) :- X\=Y, tally(T2, X, P).

tally([], [], 0).
tally(_, [], 0).
tally(X, [X|T2], N) :- tally(X, T2, Y), N is Y + 1.
tally(X, [Y|T2], P) :- X\=Y, tally(T2, X, P).

insert([], _, _).
insert(_, [], _).
insert(X, [H1|T1], [X, H1|T1] :- H1 >= X, insert(H1, T1, T1).
insert(X, [H1|T1], [H2|T2]) :- insert(X, T1, T2).


