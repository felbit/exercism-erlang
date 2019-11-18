-module(darts).

-export([score/2]).


score(R) when R =< 1.0 -> 10;
score(R) when R =< 5.0 -> 5;
score(R) when R =< 10.0 -> 1;
score(_) -> 0.

score(X, Y) -> score(math:sqrt(X*X + Y*Y)).
