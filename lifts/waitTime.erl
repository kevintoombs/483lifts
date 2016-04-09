-module(waitTime).
-export([waitTime/4]).

-import(insert, [insert/4]).
-import(lists, [append/2, sublist/2]).

waitTime(Stoplist, Now, Dir, Floor) ->
	NewStoplist = insert(Stoplist, Now, Dir, Floor),
	Index = index_of(Floor, NewStoplist, 1),
	SubList = sublist(NewStoplist, Index),
	calcTime(SubList)
.

%return the sum of the differences of elements
%plus 5 for each stop before the last stop (the goal)
calcTime(SubList) ->
	erlang:display(SubList),
	OpenCost = (length(SubList) - 1) * 5,
	calcTime(SubList, OpenCost)
.

calcTime([A,B|TailList], Sum) ->
	erlang:display(Sum),
	Diff = B - A,
	NewSum = erlang:abs(Diff) + Sum,
	NewList = append([B],TailList),
	calcTime(NewList, NewSum)
;
calcTime([_A|_SubList], Sum) ->
	Sum
.


index_of(Item, List) -> index_of(Item, List, 1).

index_of(_, [], _)  -> not_found;
index_of(Item, [Item|_], Index) -> Index;
index_of(Item, [_|Tl], Index) -> index_of(Item, Tl, Index+1).