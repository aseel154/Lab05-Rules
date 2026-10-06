% ============================================================
% ARTI 303 - Lab Exercise - Task 1
% Simpsons Family Tree Knowledge Base
% ============================================================

% -------------------- FACTS --------------------

male(abraham).
male(clancy).
male(herb).
male(homer).
male(bart).

female(mona).
female(jackie).
female(marge).
female(patty).
female(selma).
female(lisa).
female(maggie).
female(ling).

parent(abraham, herb).
parent(mona, herb).

parent(abraham, homer).
parent(mona, homer).

parent(clancy, marge).
parent(jackie, marge).

parent(clancy, patty).
parent(jackie, patty).

parent(clancy, selma).
parent(jackie, selma).

parent(homer, bart).
parent(marge, bart).

parent(homer, lisa).
parent(marge, lisa).

parent(homer, maggie).
parent(marge, maggie).

parent(selma, ling).


% -------------------- RULES --------------------

father(X, Y) :-
    male(X),
    parent(X, Y).

mother(X, Y) :-
    female(X),
    parent(X, Y).

son(X, Y) :-
    male(X),
    parent(Y, X).

daughter(X, Y) :-
    female(X),
    parent(Y, X).

brother(X, Y) :-
    male(X),
    parent(P, X),
    parent(P, Y),
    X \= Y.

sister(X, Y) :-
    female(X),
    parent(P, X),
    parent(P, Y),
    X \= Y.

grandfather(X, Y) :-
    male(X),
    parent(X, Z),
    parent(Z, Y).

aunt(X, Y) :-
    female(X),
    sister(X, P),
    parent(P, Y).

uncle(X, Y) :-
    male(X),
    brother(X, P),
    parent(P, Y).

cousin(X, Y) :-
    parent(P1, X),
    parent(P2, Y),
    parent(G, P1),
    parent(G, P2),
    P1 \= P2,
    X \= Y.

ancestor(X, Y) :-
    parent(X, Y).

ancestor(X, Y) :-
    parent(X, Z),
    ancestor(Z, Y).


% ============================================================
% TEST QUERIES AND ANSWERS
% ============================================================

% ----- father -----
% ?- father(homer, bart).
% true.
%
% ?- father(abraham, homer).
% true.

% ----- mother -----
% ?- mother(marge, lisa).
% true.
%
% ?- mother(selma, ling).
% true.

% ----- son -----
% ?- son(bart, homer).
% true.
%
% ?- son(homer, abraham).
% true.

% ----- daughter -----
% ?- daughter(lisa, marge).
% true.
%
% ?- daughter(ling, selma).
% true.

% ----- brother -----
% ?- brother(homer, herb).
% true.
%
% ?- brother(herb, homer).
% true.

% ----- sister -----
% ?- sister(patty, marge).
% true.
%
% ?- sister(selma, marge).
% true.

% ----- grandfather -----
% ?- grandfather(abraham, bart).
% true.
%
% ?- grandfather(clancy, lisa).
% true.

% ----- aunt -----
% ?- aunt(patty, bart).
% true.
%
% ?- aunt(selma, lisa).
% true.

% ----- uncle -----
% ?- uncle(herb, bart).
% true.
%
% ?- uncle(herb, lisa).
% true.

% ----- cousin -----
% ?- cousin(bart, ling).
% true.
%
% ?- cousin(lisa, ling).
% true.

% ----- ancestor -----
% ?- ancestor(abraham, bart).
% true.
%
% ?- ancestor(clancy, maggie).
% true.
