-module(insert).
-export([insert/4]).

-import(lists, [append/2, member/2, nth/2]).

insert([], Now, Dir, Floor) ->
	[Floor]
;

%needs to actually insert in the correct place
insert(Stoplist, Now, Dir, Floor) ->
	First = nth(1, Stoplist),
	AlreadyExists = member(Floor, Stoplist),
	AlreadyOnFloor = (Now == Floor),
	if
		(AlreadyExists) -> 
			Stoplist;
		(AlreadyOnFloor) ->
			io:format("already on floor."),
			append([Floor],Stoplist);
		((Now<Floor) and (Floor<First) and (Dir == up)) -> 
			append([Floor], Stoplist);
		((Now>Floor) and (Floor>First) and (Dir == down)) -> 
			append([Floor], Stoplist);
		true -> 
			%io:format("end of insert clauses.~n"),
            recurInsert(Stoplist, Dir, Floor)
	end
.

recurInsert(Stoplist, Dir, Floor) ->
	%io:format("recur called:~p ~p ~p~n", [Stoplist, Dir, Floor]),
	case {Stoplist} of
		{[A,B | Rest]} -> 
			%io:format("first of recurinsert clauses:~p ~p ~p~n", [A, B, Rest]),
			if
				((A<Floor) and (Floor<B) and (Dir == up)) ->
					append([A, Floor, B], Rest);
				((A>Floor) and (Floor>B) and (Dir == down)) ->
					append([A, Floor, B], Rest);
				true ->
					EndList = append([B],Rest),
					%erlang:display(EndList),
					ListAfterInsert = recurInsert(EndList, Dir, Floor),
					NewList = append([A], ListAfterInsert)
			end;
		{Stoplist} -> 
			%io:format("end of recurinsert clauses.~n"),
			append(Stoplist,[Floor])
    end
.