-module(solution_008).
-export([start/0]).


bignumber() ->
    {ok, FileBin} = file:read_file("bignumber.dat"),
    FileText = binary_to_list(FileBin),
    NumCharacters = length(FileText),
    BigNumber = lists:sublist(FileText, NumCharacters - 1), % Dropping "\n"
    BigNumber.


list_conseqs(String) ->
    [Current|RemString] = String,
    Conseq = [Current],
    Collection = [],
    list_conseqs(RemString, Conseq, Collection).

list_conseqs([], Conseq, Collection) ->
    lists:sort(
        fun(A, B) -> length(A) < length(B) end,
        [Conseq|Collection]
    );
list_conseqs(String, Conseq, Collection) ->
    [Current|RemString] = String,
    case Current == lists:last(Conseq) of
        true -> list_conseqs(RemString, [Current|Conseq], Collection);
        false -> list_conseqs(RemString, [Current], [Conseq|Collection])
    end.


solution() ->
    BigNumber = bignumber(),
    AllConsecutives = list_conseqs(BigNumber),
    AllConsecutives.


start() ->
    io:format("~p~n", [solution()]).
