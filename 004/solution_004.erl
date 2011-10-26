-module(solution_004).
-export([start/0]).


is_num_palindrome(Number) ->
    String = integer_to_list(Number),
    Length = length(String),
    {Left, Right} = lists:split(round(Length/2), String),
    LeftReversed = lists:reverse(Left),
    case (Length rem 2) of
        0 ->
            LeftReversed =:= Right;
        1 ->
            % Dropping the pivot character, since we only have one in an
            % odd-length list
            [_|LeftRevTail] = LeftReversed,
            LeftRevTail =:= Right
    end.


solution(From, To) ->
    Products = [X * Y || X <- lists:seq(From, To), Y <- lists:seq(From, To)],
    Palindromes = [N || N <- Products, is_num_palindrome(N)],
    LargestPalindrome = lists:last(lists:sort(Palindromes)),
    LargestPalindrome.


start() ->
    io:format("~p\n", [solution(100, 999)]).
