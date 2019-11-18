-module(roman_numerals).
-export([numerals/1, test_version/0]).

numerals_list() -> 
  [{1000, "M"}, {900, "CM"}, {500, "D"}, {400, "CD"},
  {100, "C"}, {90, "XC"}, {50, "L"}, {40, "XL"},
  {10, "X"}, {9, "IX"}, {5, "V"}, {4, "IV"}, {1, "I"}].

numerals(N) -> numerals(N, [], numerals_list()).

numerals(0, R, _) -> R;
numerals(N, R, [{D, L}|_] = Nl) when N >= D -> numerals(N - D, R ++ L, Nl);
numerals(N, R, [_|T]) -> numerals(N, R, T).

test_version() -> 1.
