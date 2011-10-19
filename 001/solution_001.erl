-module(solution_001).
-export([start/0]).


mults_of_3n5(Ceiling) ->
    [N || N <- lists:seq(1, Ceiling - 1), (N rem 3 == 0) or (N rem 5 == 0)].


start() -> io:format("~p\n", [lists:sum(mults_of_3n5(1000))]).
