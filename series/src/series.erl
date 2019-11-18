-module(series).
-export([from_string/2, test_version/0]).

from_string(Width, String) ->
  [lists:sublist(String, X, Width) || X <- lists:seq(1, (length(String) - (Width - 1)))].

test_version() -> 1.
