repMin(T1,T2)
 :-
    repMin(New,T1,Min,T2),
    New = Min. % Factored out for clarity

repMin(New,leaf(Min),Min,leaf(New)).
repMin(New,bin(L1,R1),Min,bin(L2,R2))
 :-
    repMin(New,L1,MinL,L2),
    repMin(New,R1,MinR,R2),
    Min is min(MinL,MinR).

