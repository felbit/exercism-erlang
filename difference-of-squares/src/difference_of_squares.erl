-module(difference_of_squares).

-export([sum_of_squares/1, square_of_sum/1, difference_of_squares/1, test_version/0]).

sum_of_squares(N) ->
  lists:sum([ X*X || X <- lists:seq(0, N) ]).

square(X) ->
  X*X.

square_of_sum(N) ->
  square(lists:sum(lists:seq(0, N))).

difference_of_squares(N) ->
  square_of_sum(N) - sum_of_squares(N).

test_version() -> 1.
