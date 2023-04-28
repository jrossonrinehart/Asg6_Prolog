%MIN
findMin([Min], Min).
findMin([H|T], H) :- findMin(T, MT), H < MT.
findMin([H|T], MT) :- findMin(T, MT), H >= MT.

%Max
findMax([Max], Max).
findMax([H|T], H) :- findMax(T, MT), H > MT.
findMax([H|T], MT) :- findMax(T, MT), H =< MT.


findSum([], 0).
findSum([H|T], Sum) :- findSum(T,Tsum), Sum is H + Tsum.
findAvg(L, Avg) :- findSum(L, Sum), length(L, Len), Avg is Sum/Len.



countElem([], _, 0).
countElem([H|T], H, Hcnt) :- countElem(T, H, THcnt), Hcnt is THcnt + 1.
countElem([H|T], N, Ncnt) :- H \= N, countElem(T, N, Ncnt).

countElems([], [], []).
countElems(L, [H], [Hcnt]) :- countElem(L, H, Hcnt).
countElems(L, [H|T], [Hcnt|TR]) :- countElem(L, H, Hcnt), countElems(L, T, TR).
findMode(L, M) :- list_to_set(L, U), countElems(L, U, UC), findMaxU(U, UC, M).


%Median
findmedian(Ls, Med) :- sort(0, @=<, Ls, S), \+isEven(Ls), length(Ls, E), G is floor(E/2), nth0(G, S, Med).
findmedian(Ls, Med) :- sort(0, @=<, Ls, S), isEven(Ls), length(Ls, E), G is E/2, Z is G-1, nth0(G, S, F), nth0(Z, S, T), findAvg([F, T], Med).
isEven(Ls) :- length(Ls, N), 0 is mod(N,2).
