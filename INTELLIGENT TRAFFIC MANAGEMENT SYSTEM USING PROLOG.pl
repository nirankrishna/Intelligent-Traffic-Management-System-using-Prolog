% -------- DATA --------

road(a,b).
road(b,c).
road(c,d).

signal(a,green).
signal(b,green).
signal(c,red).
signal(d,green).

vehicle(car1,a).
vehicle(car2,b).
vehicle(car3,c).

% -------- RULES --------

can_move(Car,Loc) :-
    vehicle(Car,Loc),
    signal(Loc,green).

next_move(Car,Next) :-
    vehicle(Car,Cur),
    road(Cur,Next),
    can_move(Car,Cur).

% -------- PRINT --------

print_move(Car) :-
    ( next_move(Car,Next) ->
        format('~w moves to ~w~n',[Car,Next])
    ;
        format('~w waiting~n',[Car])
    ).

% -------- SIMULATION --------

run :-
    write('TRAFFIC SIMULATION'), nl,
    write('-------------------'), nl,

    write('STEP 1'), nl,
    print_move(car1),
    print_move(car2),
    print_move(car3), nl,

    write('STEP 2'), nl,
    print_move(car1),
    print_move(car2),
    print_move(car3), nl,

    write('STEP 3'), nl,
    print_move(car1),
    print_move(car2),
    print_move(car3).

:- initialization(run).