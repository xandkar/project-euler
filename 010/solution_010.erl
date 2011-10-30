-module(solution_010).
-export([start/0]).


is_prime(N) ->
    case N of
        1 -> false;
        2 -> true;
        3 -> true;
        _Else ->
            case N rem 2 =:= 0 of
                true -> false;
                false ->
                    Divisor = 3,
                    MaxDivisor = round(math:sqrt(N)),
                    is_prime(N, Divisor, MaxDivisor)
            end
    end.

is_prime(N, Divisor, _)
    when N rem Divisor =:= 0 ->
        false;
is_prime(N, Divisor, MaxDivisor) ->
    case Divisor >= MaxDivisor of
        true -> true;
        false -> is_prime(N, Divisor + 2, MaxDivisor)
    end.


solution(MaxPrime) ->
    lists:sum([N || N <- lists:seq(1, MaxPrime), is_prime(N)]).


start() ->
    io:format("~p~n", [solution(2000000)]).
