-module(insert).
-export([insert/4]).

-import(lists, [append/2]).

%needs to actually insert in the correct place
insert(Stoplist, Now, Dir, Floor) ->
	append(Stoplist, [Floor])
.