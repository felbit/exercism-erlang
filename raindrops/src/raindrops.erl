-module(raindrops).
-export([convert/1, test_version/0]).

convert(Number) -> 
  case soundList(Number) of
    [] -> integer_to_list(Number);
    Sounds -> string:join(Sounds, "")
  end.

soundList(Number) ->
  [Drop || {X, Drop} <- [{3, "Pling"}, {5, "Plang"}, {7, "Plong"}], Number rem X == 0].

test_version() -> 1.
