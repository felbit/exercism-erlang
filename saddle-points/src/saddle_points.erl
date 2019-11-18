-module(saddle_points).
-export([saddle_points/1, index_all/1, max_values/1, min_values/1, traverse/1]).

%% A saddle point is per definition the max value in row and min value in
%% column of a two dimensional field. This field is implemented through an
%% list of lists, where the inner lists build the rows whereas the columns
%% are build by taking the values with corresponding indices out of every
%% inner list; e.g.
%%
%% [[ 9 8 7 ]
%%  [ 5 3 2 ]  <- saddle point at {X, Y} = {1, 0}, where X describes
%%  [ 6 6 7 ]]    the index of the inner list within the outer list
%%               and Y the index of the value within the inner list
%%
%% Solution:
%% 1. add the corresponding coordinates {X, Y} to all points
%% 2. for each inner list get the point coordinates of the max value(s)
%% 3. traverse the outer list as so: {X2, Y2} = {Y1, X1}
%% 4. for each (newly) inner list get the point coordinates of the min value(s)
%% 5. return the intersection of both lists (2 and 4)

saddle_points([]) -> [];
saddle_points(Matrix) -> [
  lists:map(fun ({_, P}) -> P end, lists:flatten(lists:map(fun min_values/1, index_all(Matrix)))),
  lists:map(fun ({_, P}) -> P end, lists:flatten(lists:map(fun max_values/1, index_all(Matrix))))
].
%saddle_points(Matrix) -> index_all(Matrix).

%find_vertical(Matrix, I) -> [V || {V, {X, Y}} <- Matrix, Y =:= I].

index_all(L) -> index_outer(L, 0, []).

index_outer([], _, R) -> R;
index_outer([H|T], J, R) -> index_outer(T, J+1, [index_inner(H, 0, J, []) | R]).

index_inner([], _, _, R) -> R;
index_inner([H|T], I, J, R) -> index_inner(T, I+1, J, [{H, {J, I}} | R]).

max_values(Row) -> max_values(Row, [{0, {-1, -1}}]).

max_values([], R) -> R;

%% add point P to the result list when the value of P is equal to any value of
%% the results list
max_values([{V, _} = P | T], [{V, _}|_] = R) -> max_values(T, [P|R]);

%% replace the result list, if the value of point P is bigger than the value
%% of any point in the current result array since all points in the result
%% array have the same value and we just found one bigger than that
max_values([{V1, _} = P | T], [{V2, _}|_]) when V1 > V2 -> max_values(T, [P]);

%% all remaining matching patterns must have a smaller value and can therefor be dropped
max_values([_ | T], R) -> max_values(T, R).


min_values(Row) -> min_values(Row, [{99, {-1, -1}}]).

%% Follows the exact same pattern as max_values
min_values([], R) -> R;
min_values([{V, _} = P | T], [{V, _}|_] = R) -> min_values(T, [P|R]);
min_values([{V1, _} = P | T], [{V2, _}|_]) when V1 < V2 -> min_values(T, [P]);
min_values([_ | T], R) -> min_values(T, R).

traverse(L) ->  [X || X <- L]. %[{V, {Y, X}} || {V, {X, Y}} <- L].