-module(anagram).
-export([find_anagrams/2]).

find_anagrams(S, Cs) ->
  [C || C <- Cs, not_identical(S, C) andalso is_anagram(S, C)].

not_identical(S, C) -> string:lowercase(C) =/= string:lowercase(S).
is_anagram(S, C) -> lists:sort(string:lowercase(S)) =:= lists:sort(string:lowercase(C)).