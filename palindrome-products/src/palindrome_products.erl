-module(palindrome_products).
-export([smallest/2, largest/2, palindrome/1, test_version/0]).

smallest(Min, Max) when Min > Max -> {error, invalid_range};
smallest(Min, Max) -> factors(palindrome(lists:seq(Min, Max)), lists:seq(Min, Max)).

largest(Min, Max) when Min > Max -> {error, invalid_range};
largest(Min, Max) -> 
  factors(
    palindrome(
      lists:reverse(
        lists:seq(Min, Max))), 
    lists:seq(Min, Max)).

factors(undefined, _) -> undefined;
factors(N, Range) -> {N, [{X, Y} || X <- Range, Y <- Range, X=<Y, X*Y =:= N]}.

is_palindrome(N) -> integer_to_list(N) =:= lists:reverse(integer_to_list(N)).

palindrome(Range) -> palindrome(Range, Range, Range).

palindrome([], _, _) -> undefined;
palindrome([_|T1], [], Range) -> palindrome(T1, Range, Range);
palindrome([H1|_] = R1, [H2|T2], Range) ->
  case is_palindrome(H1*H2) of
    true -> H1*H2;
    false -> palindrome(R1, T2, Range)
  end.

test_version() -> 1.
