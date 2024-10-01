/***************************************/
%     CS 381 - Programming Lab #5       %
%                                       %
%  Regina Sanchez                       %
%  sanchreg@oregonstate.edu             %
%                                       %
/***************************************/

% load family tree
:- consult('royal.pl').

% enables piping in tests
portray(Term) :- atom(Term), format("~s", Term).


% starting with parents
/***************************************/
% mother
% got from the assignment description
mother(M,C):- parent(M,C), female(M). 
% father
% essentially followed the same but changed it to be male
father(F,C) :- parent(F, C), male(F).


% immediate family
/***************************************/
% spouse
spouse(M,F) :- married(M,F).
spouse(F,M) :- married(F,M).
% child
child(C,P) :- parent(P,C).
% son
son(S,P) :- child(S,P), male(S).
% daughter
daughter(D,P) :- child(D,P), female(D).
% sibling
sibling(X,Y) :- parent(Z,X), parent(Z,Y), X \= Y.
% brother
brother(B,S) :- sibling(B,S), male(B).
% sister
sister(S,B) :- sibling(S,B), female(S).


% extended family
/***************************************/
% aunt by blood
aunt(A,X) :- parent(P,X), sibling(A,P), female(A).
% aunt by marriage
aunt(A,X) :- spouse(A,S), sibling(S,P), parent(P,X), female(A).
% uncle by blood
uncle(U,X) :- parent(P,X), sibling(U,P), male(U).
% uncle by marriage
uncle(U,X) :- spouse(U,S), sibling(S,P), parent(P,X), male(U).
% grandparent
grandparent(GP,GC) :- parent(GP,P), parent(P,GC).
% grandfather
grandfather(GF,GC) :- grandparent(GF,GC), male(GF).
% grandmother
grandmother(GM,GC) :- grandparent(GM,GC), female(GM).
% grandchild
grandchild(GC,GP) :- grandparent(GP,GC).


% ancestors
/***************************************/
% ancestor
ancestor(X,Y) :- parent(X,Y).
ancestor(X,Y) :- parent(X,Z), ancestor(Z,Y).
% descendant
descendant(X,Y) :- child(X,Y).
descendant(X,Y) :- child(X,Z), descendant(Z,Y).


% numeric
/***************************************/
% older
older(X,Y) :- born(X,BX), born(Y,BY), BX < BY.
% younger
younger(X,Y) :- born(X,BX), born(Y,BY), BX > BY.
% regentWhenBorn
regentWhenBorn(X,Y) :- born(Y,BY), reigned(X,Start,End), Start =< BY,BY < End.