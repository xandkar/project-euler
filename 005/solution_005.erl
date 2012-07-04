-module(solution_005).
-export([main/0]).


main() ->
    project_euler_005(1, 20),
    halt().


project_euler_005(Bottom, Top) ->
    Solution = smallest_divisible(Bottom, Top),
    io:format("~b\n", [Solution]).


smallest_divisible(Bottom, Top) ->
    ByRange = lists:seq(Bottom, Top),
    Init = Top,
    Step = Top,
    smallest_divisible(Init, Step, ByRange).


smallest_divisible(N, Step, ByRange) ->
    case is_divisible(N, ByRange) of
        true -> N;
        false -> smallest_divisible(N + Step, Step, ByRange)
    end.


is_divisible(_, []) -> true;
is_divisible(N, [D | _Divisors]) when N rem D =/= 0 -> false;
is_divisible(N, [_ |  Divisors]) -> is_divisible(N, Divisors).
