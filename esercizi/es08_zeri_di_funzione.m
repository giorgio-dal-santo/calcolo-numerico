% es 1
f = @(x) exp(x) - x.^2 - sin(x) - 1;
a = -2;
b = 2;
toll = 1e-8;

x = linspace(a,b);
y = f(x);

plot(x,y,'r')
grid on

% Vedo 2 zeri: uno intorno a 0, l'altro intorno a 1.3
% il metodo di bisezione se eseguito troverà uno di questi zeri
[x1, nit1] = bisezione(f, a, b, toll)

% Come trovo il secondo?
% Dovrei accorciare l'intervallo:
[x2, nit2] = bisezione(f, x1+toll, b, toll)

% es 2
f = @(x) exp(-x)-sin(x);
a = -1;
b = 5;
toll = 1e-5;
x = linspace(a,b);
y = f(x);

plot(x,y,'r')
grid on

% Vedo 2 zeri posso dividere:
c = 2;
[x1, nit1] = bisezione(f, a, c, toll)
[x2, nit2] = bisezione(f, c, b, toll)

%
f = @(x) (5*x.^3-8*x.^2+x+2).*sin(x);
a = -1;
b = 2;
toll = 1e-5;
x = linspace(a,b);
y = f(x);

plot(x,y,'r')
grid on

% Vedo 3 zeri
c = -0.3;
[x1, nit1] = bisezione(f, a, c, toll)
[x2, nit2] = bisezione(f, c, b, toll)
% il terzo zero è problematico perchè è un punto di minimo: non esistono
% due valori a e b t.c. f(a)*f(b) < 0 e a < zero3 < b

% es 3
f = @(x) x.^2 - 7;
x0 = 10;
toll = 1e-12;
nitmax = 200;
df = @(x) 2*x;
[x, nit] = newton(f, df, x0, toll, nitmax)

% es 4
nitmax = 100;
toll = 1e-6;
f = @(x) exp(-x) .* sin(x);
x = linspace(-1,5);
y = f(x);
df = @(x) -exp(-x) .* sin(x) + exp(-x) .* cos(x);

plot(x,y);
[x1, nit1] = newton(f, df, 0.5, toll, nitmax)
[x2, nit2] = newton(f, df, 2, toll, nitmax)

% es 5
f = @(x) atan(x);
toll = 1e-12;

% bisezione
a = -15;
b = 20;

zs = a:0.01:b;
plot(zs, f(zs), [a b], [0 0])

[zb, nitb] = bisezione(f, a, b, toll)

% newton
x0 = 20;

df = @(x) 1 ./ (1+x.^2);

[zn, nitn] = newton(f, df, x0, toll, 200)
% newton fallisce -> restituisce NaN -> l'instabilità è perché sono partito
% troppo lontano dalla radice

% combinati:
[zb, nitb] = bisezione(f, a, b, 0.001);
[zn, nitn] = newton(f, df, zb, toll, 200)
% solo 2 iterazioni!