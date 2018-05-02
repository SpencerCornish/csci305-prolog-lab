 % Spencer Cornish
 % CSCI 305 Prolog Lab 2

% Mother and father
mother(M,C):- 
    parent(M,C), 
    female(M).

father(F,C):- 
    parent(F,C),
    male(F).

% Husband/Wife
spouse(S1,S2):- 
    married(S1,S2), 
    married(S2,S1).

% Children
child(C,P):- parent(P,C).

son(S,P):- 
    parent(P,S), 
    male(S).

daughter(D,P):- 
    parent(P,D), 
    female(D).

% Siblings
sibling(M,C):- 
    parent(P,C), 
    parent(P,M).

brother(B,C):- 
    sibling(C,B), 
    male(B).

sister(S,C):- 
    parent(C,S), 
    female(S).

% Aunts and uncles
uncle(U,C):- 
    parent(P,C), 
    sibling(U,P), 
    male(U).

uncle(U,C):- 
    parent(P,C), 
    sister(S,P), 
    married(U,S), 
    male(U).

aunt(A,C):- 
    parent(P,C), 
    sibling(A,P), 
    female(A).

aunt(A,C):- 
    parent(P,C),
    brother(B,P),
    married(A,B), 
    female(A).

% Grandparents
grandparent(G,C):- 
    parent(G,P), 
    parent(P,C).

grandfather(G,C):- 
    parent(G,P), 
    parent(P,C), 
    male(G).

grandmother(G,C):- 
    parent(G,P), 
    parent(P,C), 
    female(G).

grandchild(GC, GP):- grandparent(GP,GC).

ancestor(A,D):- 
    parent(P,D), 
    ancestor(A,P).

descendent(D,A):- ancestor(A,D).

regentWhenBorn(R,P):- 
    reigned(R,S,E), 
    born(P,B), 
    (B =< S), 
    (B =< E).

older(F,N):- 
    born(F, FB), 
    died(F, FD), 
    born(N, NB), 
    died(N, ND), 
    (FD-FB) < (ND-NB).

younger(F,N):- 
    born(F, FB), 
    died(F, FD), 
    born(N, NB), 
    died(N, ND),
    (FD-FB) > (ND-NB).

cousin(A,B):- 
    parent(PA, A),
    parent(PB, B),
    sibling(PA,PB).
    
