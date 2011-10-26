-module(solution_007).
-export([start/0]).


is_divisible(Number)
        when Number rem 2 =:= 0 ->
            true;
is_divisible(Number) ->
    MaxDivisor = round(math:sqrt(Number)),
    Divisors = lists:seq(3, MaxDivisor, 2),
    is_divisible(Number, Divisors).

is_divisible(_, []) -> false;
is_divisible(Number, [Divisor|RemainingDivisors]) ->
    if
        Number rem Divisor == 0 ->
            true;
        true ->
            is_divisible(Number, RemainingDivisors)
    end.


nth_prime(N) ->
    nth_prime(N, 2, 3, 5).

nth_prime(N, PrimesFound, LastPrime, _)
        when PrimesFound >= N ->
            LastPrime;
nth_prime(N, PrimesFound, LastPrime, Count) ->
    case is_divisible(Count) of
        true -> nth_prime(N, PrimesFound, LastPrime, Count + 2);
        false -> nth_prime(N, PrimesFound + 1, Count, Count + 2)
    end.


solution(N) ->
    nth_prime(N).


start() ->
    io:format("~p\n", [solution(10001)]).
