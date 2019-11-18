-module(collatz_conjecture).
-export([steps/1, test_version/0]).

steps(N) when N < 1 -> {error, "Only positive numbers are allowed"};
steps(N) when not is_integer(N) -> {error, "Only integer numbers are allowed."};
steps(N) -> steps(N, 0).
steps(1, Res) -> Res;
steps(N, Res) when N rem 2 == 0 -> steps(N div 2, Res + 1);
steps(N, Res) -> steps(N * 3 + 1, Res + 1).

test_version() -> 2.
