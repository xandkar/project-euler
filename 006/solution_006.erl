-module(solution_006).
-export([start/0]).


solution(MaxNum) ->
    Numbers = lists:seq(1, MaxNum),
    SumOfSquares = lists:sum([math:pow(N, 2) || N <- Numbers]),
    SquareOfSum = math:pow(lists:sum(Numbers), 2),
    SquareOfSum - SumOfSquares.


start() ->
    io:format("~p\n", [solution(100)]).
