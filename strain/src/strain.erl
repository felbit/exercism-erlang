-module(strain).

-export([keep/2, discard/2, test_version/0]).

keep(Fn, List) -> [X || X <- List, Fn(X)].

discard(Fn, List) -> [X || X <- List, Fn(X) =:= false].

test_version() -> 1.
