-module(waitTime).
-export([waitTime/4]).

-import(insert, [insert/4]).

waitTime(Stoplist, Now, Dir, Floor) ->
	NewStoplist = insert(Stoplist, Now, Dir, Floor),
	calcTime(NewStoplist, Now, Floor)
.

%needs to actually calc the time
calcTime(Stoplist, Now, End) ->
	length(Stoplist)
.