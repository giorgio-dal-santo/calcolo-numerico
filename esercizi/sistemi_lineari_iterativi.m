% es 1
A1 = [3 0 4;
     7 4 2;
     1 1 2];
b1 = A1*ones(3,1);

x0 = zeros(3, 1);
toll = 1e-10;
nitmax = 100000;

jacobi(A1,b1,x0,toll,nitmax);
gs(A1,b1,x0,toll,nitmax);

A2 = [-3 3 -6;
    -4 7 -8;
    5 7 -9];
b2 = A2 * ones(3, 1);

jacobi(A2,b2,x0,toll,nitmax);
gs(A2,b2,x0,toll,nitmax);

A3 = [4 1 1;
    2 -9 0;
    0 -8 -6];
b3 = A3 * ones(3, 1);

[x, nit] = jacobi(A3, b3, x0, toll, nitmax);
[x, nit] = gs(A3, b3, x0, toll, nitmax); % Faster


A4 = [7 6 9;
    4 5 -4;
    -7 -3 8];
b4 = A4 * ones(3, 1);

[x, nit] = jacobi(A4, b4, x0, toll, nitmax); % Faster
[x, nit] = gs(A4, b4, x0, toll, nitmax);

% es 2
A1 = [-22 8 13;
    5 7 -1;
    -4.5 2 -9];

A2 = [1 0.5 0.5;
    -1 3 -0.3;
    0 -0.3 0.4];

A3 = [1 0 -1;
    -1 3 -0.1;
    0.5 0.5 1];

A4 = [1 -3 2.5;
    4 -7 2;
    -8 11 5];

b = [1; 0; -1];

x0 = zeros(3, 1);
toll = 1e-6;
nitmax = 200;

% Verifico la convergenza usando rho(B) < 1

% A = D - E - F;
A=A3;

D=diag(diag(A));
E=-tril(A,-1);
F=-triu(A,1);

% B = D^-1*(E-F) = D\(E+F)
Bj=D\(E+F);
rho=max(abs(eig(Bj)))

if(rho<1)
    expected=A\b;
    actual=jacobi(A,b,x0,toll,nitmax);
    matcmp(expected, actual, toll)
end

% es 3
A1 = [4 -1 0;
    -1 4 -1;
    0 -1 4];

A2 = [-5 4 1;
    4 -6 -2;
    1 -2 -8];

A3 = [1 1/2 1/3;
    1/2 1/3 1/4;
    1/3 1/4 1/5];

A4 = [4 0 7;
    1 5 0;
    -4 5 8];

b = [1; 0; -1];

x0 = zeros(3, 1);
toll = 1e-6;
nitmax = 700;

% Verifico la convergenza usando rho(B) < 1

% A = D - E - F;
A=A3;

D=diag(diag(A));
E=-tril(A,-1);
F=-triu(A,1);

% B = (D-E)^-1-F = (D*E)\F
Bgs=(D-E)\F;
rho=max(abs(eig(Bgs)))

if(rho<1)
    expected=A\b;
    actual=gs(A,b,x0,toll,nitmax);
    matcmp(expected, actual, toll)
end

% es 4
n=15;
A=diag([1:n]) + diag([1:n-3],3).*diag([1:n-3],3) - diag(0.5*ones(1,n-1),-1);
b= ones(n,1);
x0 = zeros(n, 1);
toll = 1e-6;
nitmax = 200;

expected = A\b;
x_j = jacobi(A,b,x0,toll,nitmax);
x_gs = gs(A,b,x0,toll,nitmax);

norm(x_j-expected, 2) % errore assoluto
norm(x_gs-expected, 2)

% es 5
n_valori = [5 10 20 50 100];
toll = 1e-12;
nitmax = 1000;

err_j=zeros(length(n_valori),1);
err_gs = zeros(length(n_valori),1);

nit_j = zeros(length(n_valori),1);
nit_gs = zeros(length(n_valori),1);

for i=1:length(n_valori)

    n=n_valori(i);
    A=diag(3*ones(1,n)) - diag(2*ones(1,n-1),1) - diag(ones(1,n-1),-1);
    x=ones(n,1);
    b=A*x;
    x0 = zeros(n, 1);

    [x_j, nit_j(i)] = jacobi(A,b,x0,toll,nitmax);
    [x_gs, nit_gs(i)] = gs(A,b,x0,toll,nitmax);

    err_j(i)=norm(x_j-x, 2) / norm(x, 2); % errore relativo
    err_gs(i)=norm(x_gs-x, 2) / norm(x, 2);
end

% Tabella dei risultati
Risultati = table(n_valori',nit_j,nit_gs,err_j,err_gs, ...
    'VariableNames',{'n','Iterazioni_Jacobi', ...
    'Iterazioni_GS','Errore_Jacobi','Errore_GS'});

disp(Risultati);

% entrambi i metodi iterativi convergono alla soluzione esatta del sistema
% (vettore di tutti elementi unitari)

% Gli errori relativi risultano molto piccoli, compatibilmente con la
% tolleranza assegnata pari a 10^-12 

% Dal punto di vista teorico, la convergenza è garantita dal fatto che A è
% irriducibilmente diagonalmente dominante per righe

% Confrontando il numero di iterazioni effettuate, si osserva che il metodo
% di Gauss-Seidel risulta generalmente più veloce del metodo di Jacobi.
% Questo comportamento è dovuto al fatto che Gauss-Seidel utilizza
% immediatamente i valori aggiornati delle componenti della soluzione
% all'interno della stessa iterazione, mentre Jacobi utilizza
% esclusivamente i valori calcolati nell'iterazione precedente.   

% ESERCIZI RIEPILOGO

% 1
n_valori=[5,10,100];
toll = 1e-6;
nitmax = 10000;

err_j=zeros(length(n_valori),1);
err_gs = zeros(length(n_valori),1);

nit_j = zeros(length(n_valori),1);
nit_gs = zeros(length(n_valori),1);

for i=1:length(n_valori)
    n=n_valori(i);
    A=2*diag(ones(1,n))-diag(ones(1,n-1),1)-diag(ones(1,n-1),-1);
    b=ones(n,1);
    x_esatta=A\b;

    x_0=zeros(n,1);
    [x_j, nit_j(i)] = jacobi(A,b,x_0,toll,nitmax);
    [x_gs, nit_gs(i)] = gs(A,b,x_0,toll,nitmax);

    err_j(i)=norm(x_j-x_esatta, 2) / norm(x_esatta, 2);
    err_gs(i)=norm(x_gs-x_esatta, 2) / norm(x_esatta, 2);
end

% Tabella dei risultati
Risultati = table(n_valori',nit_j,nit_gs,err_j,err_gs, ...
    'VariableNames',{'n','Iterazioni_Jacobi', ...
    'Iterazioni_GS','Errore_Jacobi','Errore_GS'});

disp(Risultati);

% 2
x = linspace(0,pi/2,9);

% 2.1
n=10;
A=11*diag(ones(1,n))-diag(ones(1,n-1),-1)+diag(x,1);
b=ones(n,1);

% 2.2
% A=D−E−F
% B = D^-1*(E-F) = D\(E+F)
% rho_B=max(abs(eig(A)))

D=diag(diag(A));
E=-tril(A,-1);
F=-triu(A,1);

Bj = D\(E+F);
rho_Bj=max(abs(eig(Bj)));

% 2.3
x_0=zeros(n,1);
toll=1e-5;
nitmax=200;

[x_j,nit_j] = jacobi(A,b,x_0,toll,nitmax);

% 2.4
x_e = A\b;
err=norm(x_j-x_e, 2);

fprintf('\nRisultati:');
fprintf('\nrho Bj: ');
disp(rho_Bj);
fprintf('\nnumero iterazioni: ');
disp(nit_j);
fprintf("\nerrore assoluto: ");
disp(err);

% 3
n=16;
x=[0:n-1];
A=diag(20*ones(1,n))+diag(x)-5*diag(ones(1,n-1),-1)+5*diag(ones(1,n-2),2);
b=ones(n,1);

% 3.1
det_A = det(A);

% 3.2
% A=D−E−F
% B = (D-E)^-1*F = (D-E)\F
D=diag(diag(A));
E=-tril(A,-1);
F=-triu(A,1);

Bgs=(D-E)\F;

rho_Bgs=max(abs(eig(Bgs)));

% 3.3
x_0=zeros(n,1);
toll=1e-6;
nitmax=200;

[x_gs,nit_gs] = gs(A,b,x_0,toll,nitmax);
x_e=A\b;
err=norm(x_gs-x_e, 2) / norm(x_e, 2); % errore relativo

fprintf('\nRisultati:');
fprintf('\ndet A: ');
disp(det_A);
fprintf('\nrho Bgs: ');
disp(rho_Bgs);
fprintf('\nnumero iterazioni: ');
disp(nit_gs);
fprintf("\nerrore relativo: ");
disp(err);