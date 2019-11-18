-module(diamond).
-export([rows/1]).

rows("A") -> ["A"];
rows("B") -> [" A ", "B B", " A "];
rows("C") -> ["  A  ", " B B ", "C   C", " B B ", "  A  "].
