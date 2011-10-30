-module(solution_009).
-export([start/0]).


triplets(Target) ->
    Candidates = lists:seq(1, Target),
    [
        {A, B, C} ||
        A <- Candidates, B <- Candidates, C <- Candidates,
        (A < B) and (B < C),
        A + B + C =:= Target,
        (A * A) + (B * B) =:= C * C
    ].


solution(Target) ->
    Triplets = triplets(Target),
    Products = [A * B * C || {A, B, C} <- Triplets],
    Products.


start() ->
    io:format("~p~n", [solution(1000)]).
