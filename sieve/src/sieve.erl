-module(sieve).
-export([sieve/1, list_multiples/2]).

sieve(_N) -> undefined.

list_multiples(N, X) ->
  list_multiples(N, X, X, []).

list_multiples(N, _, Y, List) when Y > N -> lists:reverse(List);
list_multiples(N, X, Y, List) -> list_multiples(N, X, X+Y, [Y|List]).