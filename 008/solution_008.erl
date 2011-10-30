-module(solution_008).
-export([start/0]).


bignumber() ->
    {ok, FileBin} = file:read_file("bignumber.dat"),
    FileText = binary_to_list(FileBin),
    NumChars = length(FileText),
    BigNumber = lists:sublist(FileText, NumChars - 1), % Dropping "\n"
    BigNumber.


product(List) ->
    [Head|Tail] = List,
    product(list_to_integer([Head]), Tail).

product(Product, List) ->
    case List =:= [] of
        true -> Product;
        false ->
            [Head|Tail] = List,
            product(Product * list_to_integer([Head]), Tail)
    end.


groups_of(GroupLength, BigNumber) ->
    Groups = [],
    Position = 1,
    groups_of(GroupLength, BigNumber, Groups, Position).

groups_of(GroupLength, BigNumber, Groups, Position) ->
    Group = lists:sublist(BigNumber, Position, GroupLength),
    NewGroups = [Group|Groups],
    case (Position + GroupLength) =:= length(BigNumber) of
        true -> NewGroups;
        false -> groups_of(GroupLength, BigNumber, NewGroups, Position + 1)
    end.


solution(GroupLength) ->
    BigNumber = bignumber(),
    Groups = groups_of(GroupLength, BigNumber),
    Products = lists:sort([product(G) || G <- Groups]),
    LargestProduct = lists:last(Products),
    LargestProduct.


start() ->
    io:format("~p~n", [solution(5)]).
