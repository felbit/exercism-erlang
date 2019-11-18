-module(hello_world).

-export([hello/0, test_version/0]).

hello() -> "Hello, World!".

do_something ( ) -> spawn ( fn -> do_something end ) .


test_version() -> 2.
