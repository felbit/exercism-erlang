-module(armstrong_numbers).

-export([is_armstrong_number/1]).

is_armstrong_number(N) -> 
  N =:= round(armstrong(N, length(integer_to_list(N)), [])).

armstrong(0, _, Result) -> 
  lists:foldl(fun sum/2, 0, Result);

armstrong(N, Length, Result) -> 
  armstrong(N div 10, Length, [math:pow(N rem 10, Length) | Result]).

%% This function is a purely cosmetic addition.
%% I could've done this as anonymous function
sum(X, Y) -> X+Y.