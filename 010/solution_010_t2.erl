-module(solution_010_t2).
-export([main/0]).


main() -> project_euler_010(2000000).


project_euler_010(MaxPrime) ->
    Primes = [2 | [N || N <- lists:seq(3, MaxPrime, 2), is_prime(N)]],
    Solution = lists:sum(Primes),
    io:format("~b~n", [Solution]),
    halt().


is_prime(0) -> false;
is_prime(1) -> false;
is_prime(2) -> true;
is_prime(N) when N rem 2 =:= 0 -> false;
is_prime(N) ->
    InitDivisor = 3,
    MaxDivisor = round(math:sqrt(N)),
    case is_divisible(N, InitDivisor, MaxDivisor) of
        true -> false;
        false -> true
    end.


is_divisible(_N, Div,  MaxDiv) when Div > MaxDiv -> false;
is_divisible( N, Div, _MaxDiv) when N rem Div =:= 0 -> true;
is_divisible( N, Div,  MaxDiv) -> is_divisible(N, Div + 2, MaxDiv).
