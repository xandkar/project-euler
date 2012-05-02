-module(solution_010_t2_par).
-export([main/0, prime_tester/1]).


-define(WORKERS_PER_CPU, 64).


main() -> project_euler_010(2000000).


project_euler_010(MaxPrime) ->
    Candidates = [2 | lists:seq(3, MaxPrime, 2)],
    Primes = sieve_primes(Candidates),
    Solution = lists:sum(Primes),
    io:format("~b~n", [Solution]),
    halt().


sieve_primes(Candidates) ->
    NumCPUs =
        case erlang:system_info(cpu_topology) of
            undefined ->
                1;
            CPUTopology ->
                CPUsInfo = proplists:get_value(processor, CPUTopology),
                length(CPUsInfo)
        end,
    QueuePID = self(),
    NumWorkers = NumCPUs * ?WORKERS_PER_CPU,
    Workers = [
        spawn_monitor(?MODULE, prime_tester, [QueuePID])
        || _ <- lists:seq(1, NumWorkers)
    ],
    Primes = process_queue(Candidates, Workers, []),
    Primes.


process_queue(_Jobs, _Workers=[], Results) -> Results;
process_queue( Jobs,  Workers,    Results) ->
    receive
        {request_work, WorkerPID} when Jobs =:= [] ->
            WorkerPID ! all_done,
            process_queue(Jobs, Workers, Results);

        {request_work, WorkerPID} ->
            [Job | RemJobs] = Jobs,
            WorkerPID ! {work, Job},
            process_queue(RemJobs, Workers, Results);

        {result, R} ->
            process_queue(Jobs, Workers, [R | Results]);

        {'DOWN', Ref, process, PID, normal} ->
            process_queue(Jobs, lists:delete({PID, Ref}, Workers), Results)
    end.


prime_tester(QueuePID) ->
    QueuePID ! {request_work, self()},
    receive
        all_done ->
            ok;

        {work, N} ->
            case is_prime(N) of
                true ->
                    QueuePID ! {result, N},
                    prime_tester(QueuePID);

                false ->
                    prime_tester(QueuePID)
            end
    end.


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
