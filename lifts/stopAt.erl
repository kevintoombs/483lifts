-module(stopAt).
-export([stopAt/3]).

-import(insert, [insert/4]).
-import(lists, [member/2, keyfind/3]).

stopAt(Stoplist, Now, Floor) ->
	OnFloor = (Floor == Now),
	if
		(Now < Floor) -> 
			Dir = up,
			insert(Stoplist, Now, Dir, Floor);
		(Now > Floor) -> 
			Dir = down,
			insert(Stoplist, Now, Dir, Floor);
		(OnFloor) -> 
			insert(Stoplist, Now, down, Floor);
		true -> 
			io:format("This should never happen(stopAt/3)."),
            Stoplist
	end
.