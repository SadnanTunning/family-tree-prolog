/*deploying the facts*/

male(bulbul).
male(tutul).
male(mozammel).
male(azmol).
male(sadi).
male(kabir).
male(sadnan).
male(rafiq).
male(sazzad).
male(shafin).
male(razin).
male(razzak).
male(khorshed).
male(shwapon).
male(raheek).
male(apurba).
male(asif).
male(nisho).
male(bodrul).
male(prince).
male(nipun).
male(nowshad).
male(nazmul).
male(shakib).
male(sojol).


female(hiya).
female(ela).
female(nesa).
female(sobi).
female(nazneen).
female(zina).
female(ruma).
female(rahi).
female(sanchita).
female(shimu).
female(tasneem).
female(urmi).
female(mouri).
female(rimi).
female(raka).
female(sumi).
female(totini).
female(mousumi).
female(jasmine).



father(bulbul,tutul).
father(bulbul,razzak).
father(tutul,mozammel).
father(tutul,azmol).
father(mozammel,sadi).
father(mozammel,kabir).
father(sadi,sadnan).
father(kabir,rafiq).
father(rafiq,sazzad).
father(rafiq,shafin).
father(sazzad,razin).

father(razzak,khorshed).
father(razzak,shwapon).

father(khorshed,raheek).
father(shwapon,apurba).
father(raheek,asif).
father(raheek,nisho).
father(apurba,bodrul).
father(asif,prince).
father(nisho,nipun).

father(bodrul,nowshad).
father(prince,nazmul).
father(nipun,shakib).
father(nowshad,sojol).


mother(hiya,tutul).
mother(hiya,razzak).
mother(ela,mozammel).
mother(ela,azmol).
mother(nesa,sadi).
mother(nesa,kabir).
mother(nazneen,sadnan).
mother(zina,rafiq).
mother(ruma,sazzad).
mother(ruma,shafin).
mother(rahi,razin).

mother(sanchita,khorshed).
mother(sanchita,shwapon).

mother(shimu,raheek).
mother(tasneem,apurba).
mother(urmi,asif).
mother(urmi,nisho).
mother(mouri,bodrul).
mother(rimi,prince).
mother(raka,nipun).

mother(sumi,nowshad).
mother(totini,nazmul).
mother(mousumi,shakib).
mother(jasmine,sojol).


/*deploying the rules*/

parent(X,Y):-
     mother(X,Y);
     father(X,Y).

sibling(X,Y):-
    parent(Z,X),
    parent(Z,Y),
    X\=Y.


sibling(Y,X):-
    parent(Z,X),
    parent(Z,Y),
    X\=Y.

uncle(X,Y):-
     parent(Z,Y),
     sibling(X,Z),
     male(X).

grandparent(X,Y):-
     parent(Z,Y),
     parent(X,Z).


greatgrandparent(X,Y):-
    parent(X,P),
    parent(P,Z),
    parent(Z,Y).

greatgreatgrandparent(X,Y):-
     parent(A,Y),
     parent(B,A),
     parent(C,B),
     parent(X,C).

firstcousin(X,Y):-
    parent(Z,X),
    parent(W,Y),
    sibling(Z,W).
firstcousin(Y,X):-
    parent(Z,X),
    parent(W,Y),
    sibling(Z,W).

secondcousin(X,Y):-
    greatgrandparent(Z,X),
    greatgrandparent(Z,Y),
    \+firstcousin(X,Y),
    \+sibling(X,Y),
    X\=Y.

thirdcousin(X,Y):-
    greatgreatgrandparent(Z,X),
    greatgreatgrandparent(Z,Y),
    \+firstcousin(X,Y),
    \+secondcousin(X,Y),
    \+sibling(X,Y),
    X\=Y.

firstcousin_onceremoved(X,Y):-
    parent(Z,Y),
    firstcousin(X,Z).
firstcousin_onceremoved(X,Y):-
    parent(Z,X),
    firstcousin(Z,Y).

firstcousin_twiceremoved(X,Y):-
    firstcousin(X,Z),
    grandparent(Z,Y).
firstcousin_twiceremoved(X,Y):-
    firstcousin(Z,Y),
    grandparent(Z,X).

secondcousin_onceremoved(X,Y):-
     parent(Z,Y),
     secondcousin(X,Z).
secondcousin_onceremoved(X,Y):-
     parent(Z,X),
     secondcousin(Z,Y).

secondcousin_twiceremoved(X,Y):-
     grandparent(Z,Y),
     secondcousin(X,Z).
secondcousin_twiceremoved(X,Y):-
     grandparent(Z,X),
     secondcousin(Z,Y).

thirdcousin_onceremoved(X,Y):-
     parent(Z,Y),
     thirdcousin(X,Z).
thirdcousin_onceremoved(X,Y):-
     parent(Z,X),
     thirdcousin(Z,Y).

thirdcousin_twiceremoved(X,Y):-
     grandparent(Z,Y),
     thirdcousin(X,Z).
thirdcousin_twiceremoved(X,Y):-
     grandparent(Z,X),
     thirdcousin(Z,Y).

