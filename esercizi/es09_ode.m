% es 6
f = @(t,y) -2.*t.*y.^2;
y0 = 1;
t0 = 0;
tmax = 2;
tspan = [t0 tmax];

[T, U] = ode45(f, tspan, y0);
sol = @(t) 1 ./ (1+t.^2);
plot(T,U,'r',T,sol(T),'g');
err = norm(U-sol(T), inf) / norm(sol(T), inf)

f2 = @(t,y) -25.*y;
[T2, U2] = ode45(f2, tspan, y0);
sol2 = @(t) exp(-25.*t);
plot(T2,U2,'r',T2,sol2(T2),'g');
err2 = norm(U2-sol2(T2), inf) / norm(sol2(T2), inf)

% ESERCIZI RIEPILOGO
% 1
f = @(x) x - (1./(sin(x)+2));
a = 0;
b = 5;
alfa = fzero(f, [a,b])

toll = 1e-8;
[x, nit] = bisezione(f, a, b, toll)
err = abs(x-alfa)

nitmax = 200;
x0 = 2;
df = @(x) 1 + 1 ./ (sin(x) + 2).^2 .* (cos(x));
[xn, nitn] = newton(f, df, x0, toll, nitmax);
err = abs(xn-alfa)

% 2
f = @(x) 2*x.^2 - 1 ./ (cos(x.^2) + 3);
a = 0;
b = 5;
alfa = fzero(f, [a,b])

toll_b = 1e-2;
toll_n = 1e-6;

% combinati:
[zb, nitb] = bisezione(f, a, b, toll_b)

df = @(x) 4*x + (1 ./ (cos(x.^2) + 3).^2 .* - 2.*x.*sin(x.^2));
[zn, nitn] = newton(f, df, zb, toll_n, 200)

err = abs(alfa-zn)

% 3
f = @(t,y) (cos(2*pi.*t)-4*t.^2).*y;
y0 = 4;
tspan = [0,5];
sol = @(t) 4 * exp((1/(2*pi))*sin(2*pi*t) - (4/3)*t.^3);

[T, Y] = ode45(f, tspan, y0);
err = norm(Y-sol(T), inf) / norm(sol(T), inf)
ymax = max(Y)

%
I_T_comp = trapz(T, Y)
I_e = integral(sol, 0, 5);
err = abs(I_T_comp - I_e)

% es 1
f = @(t,y) t.*(2+t) - y;
y0 = 1;
T = 0:0.5:2;
sol = @(t) t.^2+exp(-t);

[T, U] = eulero(f, T, y0);
plot(T,U,'r',T,sol(T),'g');

err = max(abs(sol(T)-U));

% es 2
f = @(t, y) -2*t*y.^2;
t0 = 0;
tmax = 2;
y0 = 1;

sol = @(t) 1 ./ (1+t.^2);
H = [0.1 0.01 0.001 0.0001];
errs = zeros(1, length(H));

for i = 1:length(H)
    h = H(i);
    [T, U] = eulero(f, T, y0);
    errs(i) = max(abs(sol(T)-U));
end

% err(h) = O(h^p)
% errs = C*H^p
% log(errs) = log(C) + p*log(H)

polyfit(log(H), log(errs), 1) % p is around 1

%
f = @(t, y) -25 * y;
t0 = 0;
tmax = 2;
y0 = 1;

sol = @(t) exp(-25*t);
H = [0.1 2/25 0.05];
errs = zeros(1, length(H));
for i = 1:length(H)
    h = H(i);
    T = t0:h:tmax;
    [T, U] = eulero(f, T, y0);
    plot(T, U);
    errs(i) = max(abs(sol(T)-U));
end

plot(t0:0.01:tmax, sol(t0:0.01:tmax), 'k');

errs

% err(h) = O(h^p)
% errs = C*H^p
% log(errs) = log(C) + p*log(H)

polyfit(log(H), log(errs), 1) % p is around 1

%
f = @(t, y) -25 * y;
t0 = 0;
tmax = 2;
y0 = 1;

sol = @(t) exp(-25*t);

%
H = [0.01 0.001 0.0001]; % notice all h < 2/25 otherwise "assolutamente instabile"
errs = zeros(1, length(H));
for i = 1:length(H)
    h = H(i);
    T = t0:h:tmax;
    [T, U] = eulero(f, T, y0);
    plot(T, U);
    errs(i) = max(abs(sol(T)-U));
end

plot(t0:0.01:tmax, sol(t0:0.01:tmax), 'k');

errs

% err(h) = O(h^p)
% errs = C*H^p
% log(errs) = log(C) + p*log(H)

polyfit(log(H), log(errs), 1) % p is around 1

% es 3
f = @(t, y) -2*t*y.^2;
t0 = 0;
tmax = 2;
y0 = 1;
sol = @(t) 1 ./ (1+t.^2);
toll = 1e-6;
nitmax = 200;
dfy = @(t, y) -4 * t .* y;

H = [0.1 0.01 0.001 0.0001];
errs = zeros(1, length(H));
for i = 1:length(H)
    h = H(i);
    T = t0:h:tmax;
    [T, U] = eulimp(f, T, y0, dfy, toll, nitmax);
    plot(T, U);
    errs(i) = max(abs(sol(T)-U));
end

plot(t0:0.01:tmax, sol(t0:0.01:tmax), 'k');

errs

% err(h) = O(h^p)
% errs = C*H^p
% log(errs) = log(C) + p*log(H)

polyfit(log(H), log(errs), 1) % p is around 1

% es 4
f = @(t, y) -25 * y;
t0 = 0;
tmax = 2;
y0 = 1;
sol = @(t) exp(-25*t);
toll = 1e-6;
nitmax = 200;
dfy = @(t, y) -25;

H = [0.1 0.01 0.001 0.0001];
errs = zeros(1, length(H));
for i = 1:length(H)
    h = H(i);
    T = t0:h:tmax;
    [T, U] = heun(f, T, y0);
    plot(T, U);
    errs(i) = max(abs(sol(T)-U));
end

plot(t0:0.01:tmax, sol(t0:0.01:tmax), 'k');

[H' errs']

% err(h) = O(h^p)
% errs = C*H^p
% log(errs) = log(C) + p*log(H)

polyfit(log(H), log(errs), 1) % p is expected to be 2

% es 5
f = @(t, y) t.^2 * (1 - 3*y);
t0 = 0;
tmax = 2;
y0 = 2;

sol = @(t) 1/3*(1+5*exp(-t.^3));
toll = 1e-6;
nitmax = 200;

dfy = @(t, y) -3*t.^2;

H = [0.5 0.05 0.005 0.0005];
errs = zeros(1, length(H));
for i = 1:length(H)
    h = H(i);
    T = t0:h:tmax;
    [T, Y] = cranknic(f, T, y0, dfy, toll, nitmax);
    plot(T, Y);
    errs(i) = norm(sol(T)-Y, inf);
end

T = t0:0.01:tmax;
plot(T, sol(T), 'k');

[H' errs']

polyfit(log(H), log(errs), 1) % 2?

% ESERCIZI DI RIEPILOGO
f = @(t, y) t.^2 * (1 - 3*y);
t0 = 0;
tmax = 2;
y0 = 2;

sol = @(t) 1/3 * (1 + 5*exp(-t.^3));

toll = 1e-6;
nitmax = 200;
dfy = @(t, y) -3*t.^2;

H = [0.1 0.01 0.001];
errs = zeros(1, length(H));
for i = 1: length(H)
    h = H(i);
    T = t0:h:tmax;
    [T, Y] = eulero(f, T, y0);
    %[T, Y] = eulimp(f, T, y0, dfy, toll, nitmax);
    %[T, Y] = heun(f, T, y0);
    %[T, Y] = cranknic(f, T, y0, dfy, toll, nitmax);
    plot(T, Y);
    errs(i) = max(abs(Y - sol(T)));
end

[H' errs']