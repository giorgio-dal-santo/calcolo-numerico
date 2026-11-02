% es 1
xf = linspace(1, 2, 50);
fx = 2*(log(xf+2)) ./ sqrt(xf+1);

xg = linspace(1, 5, 50);
gx = (xg.^2+2*xg+1) ./ (xg.^2+1);

plot(xf,fx,'r',xg,gx,'g');

% es 2
x1 = linspace(1,2.5);
f1 = sin(exp(x1));

x2 = linspace(-3,1.5);
f2 = (x2.^3 - 3*x2 + 2) .* exp(x2);

figure(1);
plot(x1,f1, 'r');
title('f1');
grid on;

figure(2);
plot(x2,f2, 'b');
title('f2');
grid on;

% es 3
x = linspace(0,1);

figure(1)
for n=0:20
    fx_n = x.^n;
    plot(x,fx_n);
    hold on
end
title('Funzioni x^n tra 0 e 1')
xlabel('x')
ylabel('x^n')

figure(2)
for n=0:20
    gx_n = x.^(1/n);
    plot(x,gx_n);
    hold on
end
title('Funzioni x^(1/n) tra 0 e 1')
xlabel('x')
ylabel('x^(1/n)')

% es 4
x = linspace(1,2);
f = @(x) (2*log(x+2)) ./ (sqrt(x+1)) - (x.^2+2*x+1) ./ (x.^2+1);

plot(x, f(x), 'k--');

% es 5
f = @(x,a) a.^x;

a=[0.1 1 10];
x = linspace(0,1);
Y = f(x,a');

plot(x,Y);
title('f(x)=a^x')
legend('a=0.1', 'a=1', 'a=10')