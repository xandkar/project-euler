-module(solution_005).
-export([start/0]).


is_divisible(_, []) ->
    true;
is_divisible(Number, [Divisor|Divisors]) ->
    case Number rem Divisor of
        0 -> is_divisible(Number, Divisors);
        _Else -> false
    end.


smallest_no_rem_in_range(Divisors) ->
    smallest_no_rem_in_range(Divisors, 1).

smallest_no_rem_in_range(Divisors, Count) ->
    case is_divisible(Count, Divisors) of
        true -> Count;
        false -> smallest_no_rem_in_range(Divisors, Count + 1)
    end.


solution(From, To) ->
    smallest_no_rem_in_range(lists:seq(From, To)).


start() ->
    io:format("~p\n", [solution(1, 20)]).
