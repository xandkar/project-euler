-module(solution_003).
-export([start/0]).


%
% The following solution works, but is extremely inefficient for large numbers
% (like the one the problem is actually asking for). BEAM could not allocate
% heap on a 16GB node (and crashed)!
%
% TODO: Read-up on efficient prime generation.
% TODO: Consider these thoughts/ideas:
%           - Chunk the computation.
%           - May be not all the cases need to be tested?
%           - If we only need the largest, may be we can track only the largest
%             factor/prime candidate instead of the whole list?
%           - Check for factor and prime at the same time, this way only
%             current and largets-found numbers need to be passed around.
%


is_prime(Candidate) ->
    is_prime(Candidate, [2]++lists:seq(3, Candidate - 1, 2)).

is_prime(Candidate, [Divisor|_])
    when Candidate rem Divisor == 0 ->
        false;
is_prime(Candidate, [_|RemainingDivisors]) ->
    is_prime(Candidate, RemainingDivisors);
is_prime(_, []) -> 
    true.


primes(Ceiling) ->
    [2, 3]++[N || N <- lists:seq(5, Ceiling, 2), is_prime(N) == true].


prime_factors(Number) ->
    [N || N <- primes(Number), Number rem N == 0].


solution(Target) ->
    lists:last(lists:sort(prime_factors(Target))).


% Test case:
start() ->
    io:format("~p\n", [solution(13195)]).

% Problem case:
%start() -> io:format("~p\n", [solution(600851475143)]).
