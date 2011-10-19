-module(solution_002).
-export([start/0]).


fibonacci(Max) -> fibonacci(Max, 0, 1, []).

fibonacci(Max, Previous, Latest, Sequence)
    when Previous + Latest >= Max -> Sequence;

fibonacci(Max, Previous, Latest, Sequence) ->
    fibonacci(Max, Latest, Previous + Latest, [Previous + Latest | Sequence]).


filt_even(Nums) -> lists:filter(fun(N) -> N rem 2 == 0 end, Nums).


solution() -> lists:sum(filt_even(fibonacci(4000000))).


start() -> io:format("~p\n", [solution()]).
