hello(Who) :-
  format("Hello ~w!~n", [Who]).

main :-
  hello(world).
