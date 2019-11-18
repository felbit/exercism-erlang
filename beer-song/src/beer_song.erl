-module(beer_song).

-export([verse/1, sing/1, sing/2, test_version/0]).

verse(0) -> ["No more bottles of beer on the wall, no more bottles of beer.\n" "Go to the store and buy some more, 99 bottles of beer on the wall.\n"];
verse(1) -> ["1 bottle of beer on the wall, 1 bottle of beer.\n", "Take it down and pass it around, no more bottles of beer on the wall.\n"];
verse(2) -> ["2 bottles of beer on the wall, 2 bottles of beer.\n", "Take one down and pass it around, 1 bottle of beer on the wall.\n"];
verse(N) -> [integer_to_list(N) ++ " bottles of beer on the wall, " ++ integer_to_list(N) ++ " bottles of beer.\n", "Take one down and pass it around, " ++ integer_to_list(N-1) ++ " bottles of beer on the wall.\n"].

sing(N) -> sing(N, 0).

sing(0, _) -> verse(0) ++ "\n";
sing(To, To) -> verse(To) ++ "\n";
sing(From, To) -> verse(From) ++ "\n" ++ sing(From-1, To).

test_version() -> 1.
