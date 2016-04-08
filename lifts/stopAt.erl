-module(stopAt).
-export([stopAt/3]).

-import(insert, [insert/4]).
-import(lists, [append/2, keyfind/3]).

stopAt(Stoplist, Now, Floor) ->
	if
		(Now < Floor) -> 
			Dir = "up",
			insert(Stoplist, Now, Dir, Floor);
		(Now > Floor) -> 
			Dir = "down",
			insert(Stoplist, Now, Dir, Floor);
		(Now == Floor) -> 
			append([Floor], Stoplist);
			%fix the code below
			%if
			%	(keyfind(Floor, 1, Stoplist) == false) -> append([Floor], Stoplist);
			%	true -> Stoplist
			%end,
		true -> 
			%io:format("This should never happen(stopAt/3)."),
            Stoplist
	end
.