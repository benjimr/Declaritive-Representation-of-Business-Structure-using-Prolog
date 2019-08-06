% Ben Ryan

% Has part - department hierachy
haspart(worldHQ, chinaHQ).
haspart(worldHQ, irelandHQ).

haspart(chinaHQ, chinaSales).
haspart(chinaHQ, chinaFinance).

haspart(irelandHQ, irelandSales).
haspart(irelandHQ, irelandFinance).


% Head - department heads
head(bob, worldHQ).

head(wen, chinaHQ).
head(hong, chinaSales).
head(ya, chinaFinance).

head(mary, irelandHQ).
head(neil, irelandSales).
head(karen, irelandFinance).


% Department Employees
employee(john, worldHQ).

employee(zhi, chinaHQ).
employee(hui, chinaSales).
employee(ming, chinaFinance).

employee(brian, irelandHQ).
employee(michael, irelandSales).
employee(alan, irelandFinance).


% Generic Department Members
indepartment(X,Y) :- head(X,Y) ; employee(X,Y).


% Colleagues
colleagues(X,Y) :- ((head(X,Z), employee(Y,Z));
                    (head(Y,Z), employee(X,Z))),
                    \=(X,Y).


% Component of department
component(X,Y) :- haspart(Y,X).
component(X,Y) :- haspart(Z,X), component(Z,Y).


% Member of departments
memberof(X,Y) :- indepartment(X,Y).
memberof(X,Y) :- indepartment(X,Z), component(Z,Y).


% Boss of departments below
bossof(X,Y) :- (head(X,Z),employee(Y,Z));
                (head(X,Z), component(Q,Z), indepartment(Y,Q)).
