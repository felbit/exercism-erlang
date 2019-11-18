-module(bob).

-export([response/1]).

is_question(String) ->
  string:length(String) > 0 andalso
    string:sub_string(String, length(String)) =:= "?".

is_shouting(String) ->
  lists:any(fun (C) -> C >= $A andalso C =< $Z end, String) andalso
    string:uppercase(String) =:= String.

is_shouting_question(String) ->
  is_shouting(String) andalso is_question(String).

is_silent(String) ->
  String =:= [].

lookup(String, [{Func, Response} | Funcs]) ->
  case Func(String) of
    true -> Response;
    false -> lookup(String, Funcs)
  end.

response(String) ->
  lookup(
    string:trim(String),
    [
      {fun is_shouting_question/1, "Calm down, I know what I'm doing!"},
      {fun is_silent/1, "Fine. Be that way!"},
      {fun is_shouting/1, "Whoa, chill out!"},
      {fun is_question/1, "Sure."},
      {fun (_) -> true end, "Whatever."}
    ]
  ).