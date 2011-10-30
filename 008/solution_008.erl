-module(solution_008).
-export([start/0]).


bignumber() ->
    {ok, FileBin} = file:read_file("bignumber.dat"),
    FileText = binary_to_list(FileBin),
    NumCharacters = length(FileText),
    BigNumber = lists:sublist(FileText, NumCharacters - 1), % Dropping "\n"
    BigNumber.


list_consecs(String) ->
    [Current|RemString] = String,
    Consec = [Current],
    Collection = [],
    list_consecs(RemString, Consec, Collection).

list_consecs([], Consec, Collection) ->
    lists:sort(
        fun(A, B) -> length(A) < length(B) end,
        [Consec|Collection]
    );
list_consecs(String, Consec, Collection) ->
    [Current|RemString] = String,
    case Current == lists:last(Consec) of
        true -> list_consecs(RemString, [Current|Consec], Collection);
        false -> list_consecs(RemString, [Current], [Consec|Collection])
    end.


solution(NumConsecutives) ->
    BigNumber = bignumber(),
    AllConsecutives = list_consecs(BigNumber),
    TargetConsecutives =
        [C || C <- AllConsecutives, length(C) =:= NumConsecutives],
    TargetConsecutives.


start() ->
    io:format("~p~n", [solution(5)]).
