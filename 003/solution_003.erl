-module(solution_003).
-export([start/0]).


is_prime(Candidate) ->
    is_prime(Candidate, 3, round(math:sqrt(Candidate))).

is_prime(Candidate, Divisor, _)
    when
        Candidate rem Divisor == 0 ->
            false;
is_prime(Candidate, Divisor, MaxDivisor) ->
    case Divisor >= MaxDivisor of
        true -> true;
        false -> is_prime(Candidate, Divisor + 2, MaxDivisor)
    end.


reduced_target(Target) ->
    Reduced = round(math:sqrt(Target)),
    Remainder = Reduced rem 2,
    case Remainder == 0 of
        true -> Reduced + 1;
        false -> Reduced
    end.


largest_prime_factor(Target) ->
    ReducedTarget = reduced_target(Target),
    largest_prime_factor(Target, ReducedTarget, ReducedTarget - 2, 3).

largest_prime_factor(_, _, CurrentCandidate, LastCandidate)
    when CurrentCandidate =< LastCandidate ->
        "N/A";
largest_prime_factor(Target, ReducedTarget, CurrentCandidate, LastCandidate) ->
     case (Target rem CurrentCandidate == 0) and is_prime(CurrentCandidate) of
        true -> CurrentCandidate;
        false -> largest_prime_factor(Target, ReducedTarget,
                                      CurrentCandidate - 2, LastCandidate)
    end.


solution(Target) ->
    largest_prime_factor(Target).


start() ->
    io:format("~p\n", [solution(600851475143)]).
