-module(secret_handshake).
-export([commands/1, test_version/0]).

%% I added an overflow valve of 32 here to prevent numbers higher that 31 to be checked 
%% since a valid code has only 5 bindary digits.
base2(N) -> list_to_integer(integer_to_list(N rem 32, 2)).

commands(N) -> commands(base2(N), secret_commands(), []).

commands(0, _, Result) -> lists:reverse(Result);
commands(1, [], Result) -> Result;
commands(N, [H|T], Result) -> commands(N div 10, T, update_result(N rem 10, H, Result)).

secret_commands() -> ["wink", "double blink", "close your eyes", "jump"].

update_result(0, _, Result) -> Result;
update_result(1, C, Result) -> [C|Result].

test_version() -> 1.
