% es 1
A = [-16 8 -7;
    1 -5 -3;
    1 10 14];
b = [-9; 4; -13];

A\b
inv(A)*b

% es 2
A = [1 1 1; 2 2 2; 3 3 3];
b = [1 1 1]';

det(A) % 0 quindi no soluzione
rank(A) % 1
rank([A b]) % 2
A\b % Matrix is singular

A = [1 2 3; 4 5 6; 5 7 9];
b = [1 2 3]';

det(A) % 3e^-15 (almost 0)
rank(A) % 2
rank([A b]) % 2
A\b % Matrix is close to singular or badly scaled

% rank(A) = rank(A|b), quindi la matrice ha soluzione
% r < n (2 < 3) quindi il sistema ammette infinite soluzioni

A = [1 2 3; 4 5 6; 5 7 9];
b = [5 2 3]';

det(A) % 3e^-15 (almost 0)
rank(A) % 2
rank([A b]) % 3
A\b % Matrix is close to singular or badly scaled

% rank(A) != rank(A|b), quindi la matrice NON ha soluzione
% A\b ritorna una approssimazione della soluzione (non segnala errore!)

% es 3
N=43;
A = diag(7*ones(1,N))-diag(3*ones(1,N-2),-2);
A(1,2:end)=0.1;
b=ones(N,1);

x = A\b

% es 4
A = [4 -2 1;
    -2 5 -2;
    1 -2 6];

[L,U,P] = lu(A);
isequal(P, eye(3))

b = A * ones(3, 1);

y = L\b;
x = U\y

% es 5
A = [-5 8 -7;
    12 -5 -3;
    1 10 14];

[L,U,P] = lu(A);
isequal(P, eye(3))

b = A * ones(3, 1);

y = L\(P*b);
x = U\y

% es 6
N=100;

A=diag(4*ones(1,N))-2*diag(ones(1,N-1),-1)-2*diag(ones(1,N-1),1);
invA=inv(A);

% Modo 1: Risolvendo ogni sistema con \
tic
invA1=zeros(N);
for i=1:N
    ei=zeros(N,1);
    ei(i)=1;
    invA1=A\ei;
end
toc

% Modo 2: Fattorizzare LU una volta, poi risolvere i diversi sistemi
tic
invA2=zeros(N);
[L,U,P] = lu(A);
for i=1:N
    ei=zeros(N,1);
    ei(i)=1;
    y = L\(P*ei);
    invA2(:,i)=U\y;
end
toc

% esempio Cholesky
A = [1 -1 0;
    -1 5 6;
    0 6 10];
b = [3; 1; 1];

R = chol(A);
y = R'\b;
x = R\y

% ESERCIZI RIEPILOGO
% 1
A = [7 0 1 4;
    0 5 10 1;
    1 -3 1 0;
    4 1 1 -9];

b1 = [3; 1; 1; 0];
b2 = [0; 4; 7; 50];

[L,U,P] = lu(A);

y1 = L\(P*b1);
x1 = U\y1;

y2 = L\(P*b2);
x2 = U\y2;

% 2
A = [-5 8 -7 1;
    12 -5 -3 1;
    1 10 14 1;
    1 0 1 2];

b1 = [-43 21 -1 3]';
b2 = [-1 76 -26 3]';

[L,U,P] = lu(A);

y1 = L\(P*b1);
x1 = U\y1;

y2 = L\(P*b2);
x2 = U\y2;

% 3
% Il calcolo dell'inversa tramite fattorizzazione LU prevede che si
% risolvano N sistemi lineari Ax = ei
% Dove ei è un vettore di tutti zeri, tranne per un 1 in posizione i
% Con fattorizzazione diventa LUx = Pei -> Ly = P*ei, Ux = y

A = [-5 8 -7 1;
    12 -5 -3 1;
    1 10 14 1;
    1 0 1 2];

[L,U,P] = lu(A);

invA = zeros(4);

for i=1:4
    ei=zeros(4,1);
    ei(i)=1;
    y = L \ (P*ei);
    x = U \ y;
    invA(:, i)=x;
end

invA;

% 4
N=10;
A=hilb(N) + diag(3*ones(1,N)) - diag(ones(1,N-1), 1) - diag(ones(1,N-1), -1);
[L,U,P] = lu(A);

norm(L,inf)
norm(U,inf)

b=ones(N,1);

y = L\(P*b); 
x = U\y;

norm(y,inf)
norm(x,inf)

% 5
n=8;
b = [1, 2, 3, 4, 5, 6, 7, 26]';

A=diag(5*ones(1,n)) - diag(2*ones(1,n-1), 1) - diag(2*ones(1,n-1), -1);

R = chol(A);
norm(R,inf)

y = R'\b;
x = R\y

norm(y,2)
norm(x,2)