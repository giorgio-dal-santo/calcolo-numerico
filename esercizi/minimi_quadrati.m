% es 1
xi=[0 1 2 3 4 5 6 7 8 9 10];
yi=[0 1.25 2.27 3.04 3.77 4.71 5.91 7.19 8.29 9.12 9.83];

r = polyfit(xi, yi, 1);
x = linspace(-1,11);
rx = polyval(r,x);

plot(x, rx, 'g', xi, yi, 'or');

% es 2
xi=[-5 -2 0.5 1 1.5 3 6];
yi=[1.5 2 -1 2.5 1 -2 3];

x_med = 1/7*sum(xi);
y_med = 1/7*sum(yi);

r = polyfit(xi, yi, 1);
x = linspace(-6,7);
rx = polyval(r,x);

plot(x, rx, 'g', xi, yi, 'or', x_med, y_med, 'or');

% es 3
f = @(t) 2*exp(-2*t)-t;
x = linspace(0,1,10);
y = f(x);
r = polyfit(x, y, 1);

M = [x' ones(10,1)];
Mt = M';
A = Mt*M;
b = Mt*y';

z=A\b;

% es 4
f = @(x) 5*cos(pi*x.^2)-exp(x);
x = linspace(0,1,5);
y = f(x);

r = polyfit(x, y, 1);
x_med = polyval(r, mean(x));
y_med = polyval(r, mean(y));

p = polyfit(x,y,length(x)-1);
z = roots(p);

% es 5
x=[-3 -2 0 2 4];
y=[3 2 0.5 1 3];
x_mean = mean(x);
y_mean = mean(y);

ks = [-4:0.1:4];
M = 0:4;

plot(x,y,'or',x_mean,y_mean,'xr');
hold on

for m = M
    pm = polyfit(x, y, m);
    pmy = polyval(pm, ks);
    plot(ks, pmy, '-');
end

% es 6
x=[-55:10:55];
y=[3.22, 3.3, 3.32, 3.17, 3.07, 3.02, 3.02, 3.12, 3.2, 3.35, 3.37, 3.25];
ks = [-55:0.1:55];
M = [1, 2, 4, 11];

plot(x,y,'or');
hold on
for m = M
    pm = polyfit(x, y, m);
    pmy = polyval(pm, ks);
    plot(ks, pmy, '-');
end
legend('data', 'deg 1', 'deg 2', 'deg 4', 'deg 11')

% es 7
x = [1, 2, 3, 4, 5];
y = [4.9, 8, 12.3, 23.1, 36.5];
ks = [0:0.1:6];

Y = log(y);
p = polyfit(x, Y, 1);
A = p(1);
C = exp(p(2));
f = @(x) C*exp(A*x);
fks = f(ks);

v = 2.5;
f_v = f(v);

plot(ks, fks, 'r', x,y,'og', v, f_v, 'xb');

% es 8
x = [1 2 3 4 5];
y = [0.6 1.9 4.3 7.6 12.6];
ks = [0:0.1:6];

X = log(x);
Y = log(y);
p = polyfit(X, Y, 1);
A = p(1);
C = exp(p(2));

f = @(x) C*x.^A;
fks = f(ks);

v = 2.5;
f_v = f(v);

plot(ks, fks, 'r', x,y,'og', v, f_v, 'xb');

% es 9
f = @(x) cos(10*x) .* exp(sin(10*x));
a = -10;
b = 10;

i = 1/10 * (exp(sin(100)) - exp(-sin(100)))
q = integral(f, a, b);
i = ((exp(sin(100))-exp(sin(100))) / 10);

err_ass = abs(q-i);
err_rel = abs(q-i) / abs(i);

% ESERCIZI RIEPILOGO
% 1
q = [1, 3, 5, 9, 12, 15];
z = [10.7, 30.9, 41.8, 80.9, 100.5, 129.5];
r = polyfit(q, z, 1);

% 2
T = 0:10:70;
C = [96.4 46.3 21.2 17.89 10.1 6.9 3.5 1.9];
z=0:0.2:70;

r = polyfit(T, C, 1);
rz = polyval(r, z);
s = griddedInterpolant(T, C, 'linear');
sz = s(z);
p = polyfit(T, C, 7);
pz = polyval(p, z);

plot(T,C,'oc', z, rz, 'g', z, pz, 'b');

t = 62;
r_t = polyval(r, t)
s_t = s(t)
p_t = polyval(p, t)

sr = sum(abs(C - polyval(r, T)).^2)
sp = sum(abs(C - polyval(p, T)).^2) 

% 3
f = @(t) (2/3) * log(2*t/3);
a = 3*exp(1) / 2;
b = a + 1;
x = linspace(a,b,10);
y = f(x);

r = polyfit(x, y, 1);
x_med = mean(x);
r_x_med = polyval(r, x_med);

M = [x' ones(length(x), 1)];
Mt = M';
A = Mt*M;
b = Mt*y';

z = A\b

% 4
x = 1:0.15:2.5;
y = [0.1 0.15 0.2 0.3 0.5 0.65 0.78 1 1.2 1.35 1.45];
v = 1.75;

p0 = polyfit(x, y, 2);

X = log(x);
Y = log(y);
p = polyfit(X, Y, 1);
A = p(1);
C = exp(p(2));
yy = @(x) C*x.^A;

polyval(p0, v)
yy(v)

% 5
x = 1:5;
y = [0.35 0.25 0.2 0.15 0.12];
v = 1.5;

ks = 1:0.1:5;

% y = 1/(Ax+B)
% 1/y = Ax+B
p = polyfit(x, 1./y, 1);
A = p(1)
B = p(2)
f = @(x) 1./(A*x+B);

f(1.5)

plot(x,y,'or',ks,f(ks),'g');

% 6
x = 1:5;
y = [0.25 0.31 0.35 0.4 0.41];
v = 4.5;

ks = 1:0.1:5;

% y = x/(A+Bx)
% 1/y = A*1/x+B
p = polyfit(1./x, 1./y, 1);
A = p(1)
B = p(2)
f = @(x) x ./ (A + B*x);

f(v)

plot(x,y,'or',ks,f(ks),'g');
