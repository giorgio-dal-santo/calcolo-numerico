% es 1
p = [1 -1 4 -1];
q = [1 -3 -1];

q2 = [0 1 -3 -1];

a = p-q2;
b = 3*p + 5*q2;
c = conv(p,q);
d = 2*conv(p,p)-3*conv(conv(q,q),q);
[quot, rem] = deconv(p, q);
dp = polyder(p);
e = polyval(p, 3) - polyval(q, 3);

% es 2
p = [1 0 -1 4];
zp = roots(p)

q = [1 6 0 -24 -1 -30];
zq = roots(q)

x1 = linspace(-2,1);
x2 = linspace(-6,3);

y_p = polyval(p, x1);
y_q = polyval(p, x2);

figure(1)
plot(x1, y_p)
title("p")
grid on

figure(2)
plot(x2, y_q)
title("q")
grid on

% es 3
f = [1 -2 -1];
g = [4 5 5 0 -1 0];

P = polyint(f);
polyval(P, 3) - polyval(P, 0)

Q = polyint(g);
polyval(Q, 7) - polyval(Q, -1)

% es 4
p = [3 -1 -15 5];
x_p = linspace(-2,2);
y_p = polyval(p, x_p);
dp = polyder(p);
mp = roots(dp) % max and mins of dp

q = [12 -15 -40 0 0 0];
x_q = linspace(-1.5,2.5);
y_q = polyval(q, x_q);
dq = polyder(q);
mq = roots(dq)

figure(1)
plot(x_p, y_p)
title("p")

figure(2)
plot(x_q, y_q)
title("q")