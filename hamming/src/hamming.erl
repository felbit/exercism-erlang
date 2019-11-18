-module(hamming).
-export([distance/2]).
-define(length_error, {error, "left and right strands must be of equal " "length"}).

distance(S1, S2) -> distance(S1, S2, 0).

distance([], [], D) -> D;
distance([], _, _) -> ?length_error;
distance(_, [], _) -> ?length_error;
distance([H | T1], [H | T2], D) -> distance(T1, T2, D);
distance([_ | T1], [_ | T2], D) -> distance(T1, T2, (D + 1)).
