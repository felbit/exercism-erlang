-module(custom_set).
-export([add/2, contains/2, difference/2, disjoint/2, empty/1, equal/2, from_list/1, intersection/2, subset/2, union/2, test_version/0]).

add(E, S) -> add([], E, S).

add(S1, E, []) -> reverse([E|S1]);
add(S1, E, [E|_] = S2) -> reverse(S1) ++ S2;
add(S1, E, [H|_] = S2) when E < H -> reverse(S1) ++ [E|S2];
add(S1, E, [H|T]) -> add([H|S1], E, T).

contains(_, []) -> false;
contains(E, [E|_]) -> true;
contains(E, [H|_]) when E < H -> false;
contains(E, [_|T]) -> contains(E, T).

difference([], _) -> [];
difference(S, []) -> S;
difference(S1, S2) -> reverse(difference(S1, S2, [])).

difference([], _, R) -> R;
difference(S, [], R) -> reverse(R) ++ S;
difference([H|T1], [H|T2], R) -> difference(T1, T2, R);
difference([H1|T1], [H2|_] = S2, R) when H1 < H2 -> difference(T1, S2, [H1|R]);
difference(S1, [_|T2], R) -> difference(S1, T2, R).

disjoint([], _) -> true;
disjoint(_, []) -> true;
disjoint([H|_], [H|_]) -> false;
disjoint([H1|T1], [H2|_] = S2) when H1 < H2 -> disjoint(T1, S2);
disjoint(S1, [_|T2]) -> disjoint(S1, T2).

empty([]) -> true;
empty(_) -> false.

equal(S, S) -> true;
equal(_, _) -> false.

from_list(L) -> quicksort(L).

intersection([], _) -> [];
intersection(_, []) -> [];
intersection(S1, S2) -> reverse(intersection(S1, S2, [])).

intersection([], _, R) -> R;
intersection(_, [], R) -> R;
intersection([H|T1], [H|T2], R) -> intersection(T1, T2, [H|R]);
intersection([H1|T1], [H2|_] = S2, R) when H1 < H2 -> intersection(T1, S2, R);
intersection(S1, [_|T2], R) -> intersection(S1, T2, R).

%% This quicksort-implementation drops redundant values intentionally.
%% This could indeed be solved with lists:usort (which might as well be faster)
%% but I decided to implement the custom set without relying on the lists package
quicksort([]) -> [];
quicksort([P|T]) -> quicksort([X || X <- T, X < P]) ++ [P] ++ quicksort([X || X <- T, X > P]).

%% I'd like that, but I shall not, since lists:reverse is highly optimised.
% reverse([]) -> [];
% reverse(S) -> reverse(S, []).
% reverse([], R) -> R;
% reverse([H|T], R) -> reverse(T, [H|R]).
reverse(S) -> lists:reverse(S).

subset([], _) -> true;
subset(_, []) -> false;
subset([H|T1], [H|T2]) -> subset(true, T1, T2);
subset(_, _) -> false.

subset(true, [], _) -> true;
subset(true, _, []) -> false;
subset(true, [H|T1], [H|T2]) -> subset(true, T1, T2);
subset(true, _, _) -> false.

test_version() -> 2.

union(S1, S2) -> from_list(S1 ++ S2).
