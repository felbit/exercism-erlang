-module(prime_factors).

-export([factors/1]).


factors(Value) -> factors(Value, 2, []).

factors(1, _, Result) -> Result;
factors(Value, CurrentPrime, Result) when Value rem CurrentPrime == 0 ->
  factors(Value div CurrentPrime, CurrentPrime, [CurrentPrime | Result]);
factors(Value, CurrentPrime, Result) ->
  factors(Value, CurrentPrime + 1, Result).
  
