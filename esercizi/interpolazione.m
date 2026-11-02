% es 1
x = [-2 1 2 7];
y = [-4 -1 0.5 3];

n = length(x) - 1;
p = polyfit(x, y, n);

x_int = -3:0.01:10;

plot(x, y, 'or', x_int, polyval(p, x_int), '-b')

x2 = [-5 -3 -1 1 3 5];
y2 = [0.1 -0.5 0.5 1.1 0.9 -2];

n2 = length(x) - 1;
p2 = polyfit(x2, y2, n2);

x_int2 = -6:0.01:6;
plot(x2, y2, 'or', x_int2, polyval(p2, x_int2), '-b')

% es 2
n=4;
f = @(x) exp(x) .* sin(x);
x = linspace(-1,1,n);
y = f(x);

p = polyfit(x, y, length(x) - 1);

x_int = -2:0.1:2;
plot(x_int, f(x_int), '-g', x_int, polyval(p, x_int), '-b', x,y, 'or')
legend('f', 'p', 'nodi di interpolazione')

% es 3

% i
n=20;
f1 = @(x) ((x.^2-5*x+6) .* log(x)) ./ x;

x = linspace(1,4,n+1);
y = f(x);
p = polyfit(x, y, length(x) - 1);

x_int = linspace(1,4,1000);
f_x_int = f(x_int);
p_x_int = polyval(p, x_int);
plot(x_int, f_x_int, 'g', x_int, p_x_int, 'b', x,y, 'or')
legend('f', 'p', 'nodi di interpolazione')

maxerr = max(abs(f_x_int - p_x_int))

% ii
n=32;
f = @(x) 1 ./ (1+x.^2);

x = linspace(-5,5,n+1);
y = f(x);
p = polyfit(x, y, length(x) - 1);

x_int = linspace(-5,5,1000);
f_x_int = f(x_int);
p_x_int = polyval(p, x_int);
plot(x_int, f_x_int, 'g', x_int, p_x_int, 'b', x,y, 'or')
legend('f', 'p', 'nodi di interpolazione')

maxerr = max(abs(f_x_int - p_x_int))

% es 4
n = 10;
k = 1:n;
a = -1;
b = 1;

ck = cos(pi*(2*k - 1)/(2*(n)));
xk = (b-a) / 2 * ck + (a+b) / 2;

plot(xk, zeros(n), 'or');
grid on
title(sprintf('Chebyshev %d nodes', n))

% es 5
n=32;
f = @(x) 1 ./ (1+x.^2);
k = 1:n+1;
a = -5;
b = 5;

ck = cos(pi*(2*k - 1)/(2*(n+1)));
x = (b-a) / 2 * ck + (a+b) / 2;

y = f(x);
p = polyfit(x, y, n);

x_int = linspace(a,b,1000);
f_x_int = f(x_int);
p_x_int = polyval(p, x_int);

plot(x_int, f_x_int, 'g', x_int, p_x_int, 'b', x,y, 'or')
legend('f', 'p', 'nodi di interpolazione')

maxerr = max(abs(f_x_int - p_x_int))

% es 6
f = @(x) (1 ./ (1+x.^2));

a = -5;
b = 5;

mvals = [5, 50, 500];
errs = zeros(size(mvals));

for i = 1:length(mvals)
    figure(i)
    m = mvals(i);
    H = 10/m;

    sp = linspace(a, b, m+1);
    fsp = f(sp);
    s1 = griddedInterpolant(sp, fsp, 'linear');

    xs = linspace(a, b, 10000);
    fxs = f(xs);
    s1xs = s1(xs);

    plot(xs, fxs, '-g', xs, s1xs, '-b', sp, fsp, 'ro')
    hold on
    legend('f(x)', 'linear spline', 'spline points')
    title(sprintf('m = %d', m))
    grid on

    errs(i) = max(abs(fxs - s1xs));
end

table(mvals', 10./mvals', errs', 10./mvals'.^2, 'VariableNames', {'m','H','Error', 'H^2'})

% es 7
% 1
f = @(x) (exp(x) .* cos(4*x));

a = 0;
b = pi;

mvals = [5, 50, 500];
errs = zeros(size(mvals));

for i = 1:length(mvals)
    figure(i)
    m = mvals(i);
    H = 10/m;

    sp = linspace(a, b, m+1);
    fsp = f(sp);
    s1 = griddedInterpolant(sp, fsp, 'linear');

    xs = linspace(a, b, 10000);
    fxs = f(xs);
    s1xs = s1(xs);

    plot(xs, fxs, '-g', xs, s1xs, '-b', sp, fsp, 'ro')
    hold on
    legend('f(x)', 'linear spline', 'spline points')
    title(sprintf('m = %d', m))
    grid on

    errs(i) = max(abs(fxs - s1xs));
end

table(mvals', 10./mvals', errs', 10./mvals'.^2, 'VariableNames', {'m','H','Error', 'H^2'})

% 2
f = @(x) (sqrt(abs(x)));

a = -1;
b = 1;

mvals = [5, 50, 500];
errs = zeros(size(mvals));

for i = 1:length(mvals)
    figure(i)
    m = mvals(i);
    H = 10/m;

    sp = linspace(a, b, m+1);
    fsp = f(sp);
    s1 = griddedInterpolant(sp, fsp, 'linear');

    xs = linspace(a, b, 10000);
    fxs = f(xs);
    s1xs = s1(xs);

    plot(xs, fxs, '-g', xs, s1xs, '-b', sp, fsp, 'ro')
    hold on
    legend('f(x)', 'linear spline', 'spline points')
    title(sprintf('m = %d', m))
    grid on

    errs(i) = max(abs(fxs - s1xs));
end

table(mvals', 10./mvals', errs', 10./mvals'.^2, 'VariableNames', {'m','H','Error', 'H^2'})

% ESERCIZI RIEPILOGO

% 1
f = @(x) (2 * sin(x) .* cos(x)) ./ (1 + x.^2);
a = 0;
b = 2;
n = 10;
x = linspace(a,b,n);
y = f(x);

% 
p = polyfit(x, y, n-1);
z = linspace(a,b,100);
pz = polyval(p, z);
fz = f(z)
err = norm(fz-pz, inf)

% 
dp = polyder(p);
dpz = polyval(dp, z);

plot(z,fz,'g',z,pz,'r',z,dpz,'b');
legend('f', 'p', 'dp');
grid on

xcrit = roots(dp); % punti notevoli di p
xcrit = xcrit(xcrit >= 0 & xcrit <= 2 & imag(xcrit) == 0); % solo punti in [0,2], solo radici reali
xall = [[0] xcrit [2]]; % controllare che il max non sia agli estremi
yall = polyval(p, xall);

[ymax, idx] = max(yall);
xmax = xall(idx)

plot(xmax, ymax, 'ok')

%
s1 = griddedInterpolant(x, y, 'linear');
s1z = s1(z);
err = norm(fz-s1z, inf)

% 2
g = @(x) (x.^2) ./ (1+x.^2);
a = -4;
b = 4;
n = 10;

%
x = linspace(a,b,n+1);
y = g(x);
p = polyfit(x,y,n);

z = linspace(a,b,100);
gz = g(z);
pz = polyval(p, z);

plot(z, gz, 'g', z, pz, 'b', x,y, 'or')
legend('g', 'p', 'nodi')
err = norm(gz-pz, inf)

%
k = 1:n+1;

ck = cos(pi*(2*k - 1)/(2*(n+1)));
xk = (b-a)/2 * ck + (a+b)/2;
yk = g(xk);
p2 = polyfit(xk, yk, n);
p2z = polyval(p2, z);

plot(z, gz, 'g', z, p2z, 'b', xk,yk, 'or')
legend('g', 'p', 'nodi')
err = norm(gz-p2z, inf)

% 3
f = @(x) sin(x+exp(x))-(7/12);
a = 0;
b = 1;

%
x = linspace(a,b);
y = f(x);
x_max = 4/15;
y_max = f(x_max);

plot(x,y,'g',x_max,y_max,'or');

%
h_val = [0.1, 0.01];
s_max = zeros(size(h_val));
errs = zeros(size(h_val));

for i = 1:length(h_val)
    h = h_val(i);
    z = a:h:b;
    fz = f(z);
    s1 = griddedInterpolant(z, fz, 'linear');
    s1_max = s1(x_max);
    s_max(i) = s1_max;
    errs(i) = abs(y_max-s1_max);
end

table(h_val', s_max', errs', 'VariableNames', {'h','s(x_max)','Error'})