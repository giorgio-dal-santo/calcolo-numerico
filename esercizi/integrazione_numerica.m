% es 1

%
f = @(x) 7*x-5;
a = -2;
b = 5;

% Usando 'integral'
integral(f, a, b)

% Usando 'polyint'
p = [7 -5]
P = polyint(p);
polyval(P, b) - polyval(P, a)

% Usando formula di quadratura (grado 1, dunque bastano PM opppure T)
I_PM = (b-a)*f((a+b)/2)

%
f = @(x) 5*x.^2-3*x+8;
a = -2;
b = 5;

p = [5 -3 8];
P = polyint(p);
polyval(P, b) - polyval(P, a)

% Usando formula di quadratura (grado 2, per esattezza serve CS)
I_CS = (b-a)/6 * (f(a) + 4*f((a+b)/2) + f(b))

%
f = @(x) 3*x.^3 - 2*x.^2 + 5*x - 1;
a = -2;
b = 5;

p = [3 -2 5 -1];
P = polyint(p);
polyval(P, b) - polyval(P, a)

(b-a)/6 * (f(a) + 4*f((a+b)/2) + f(b))

% es 2
f = @(x) sin(x);
a = 0;
b = pi/2;
m_val = [20 200 2000 20000];
h_res = zeros(1,4);
err_res = zeros(1,4);
I = integral(f, a, b);

for i = 1:length(m_val)
    m = m_val(i);
    H = (b-a)/m;
    h_res(i) = H;
    x = linspace(a, b, m+1);
    y = f(x);
    I_T_comp = trapz(x, y);
    err_res(i) = abs(I-I_T_comp);
end

table(m_val', h_res', err_res', 'VariableNames', {'m','H','Error'})

% Verifica che err = O(H^2)
% devo vedere se err = C*H^2
% idea: log(err) = log(C*H^2); log(err) = log(C) + 2*log(H)
% dunque posso trovare l'interpolante tra i punti log(H), log(err)
% e verificare che abbia una pendenza 2
p = polyfit(log(h_res), log(err_res), 1);
slope = p(1);

% plot:
loglog(h_res, err_res)

%
g = @(x) cos(x) * exp(sn(x));
a = -10;
b = 10;
m_val = [20 200 2000 20000];
h_res = zeros(1,4);
err_res = zeros(1,4);
I = integral(f, a, b);

for i = 1:length(m_val)
    m = m_val(i);
    H = (b-a)/m;
    h_res(i) = H;
    x = linspace(a, b, m+1);
    y = f(x);
    I_T_comp = trapz(x, y);
    err_res(i) = abs(I-I_T_comp);
end

table(m_val', h_res', err_res', 'VariableNames', {'m','H','Error'})

% es 3
a = -10;
b = 10;
f = @(x) cos(x) .* exp(sin(x));

toll = 1e-6;

m = 1;
x = linspace(a, b, m+1);
y = f(x);
I_old = trapz(x, y);

while 1
    m = 2*m;
    x = linspace(a, b, m+1);
    y = f(x);
    I_new = trapz(x, y);
    if abs(I_new - I_old) < toll
        break
    end
    I_old = I_new;
end

I_new
I = integral(f, a, b)

% es 4
f = @(x) 1./x + exp(x);
a = 1;
b = 2;
m_val = [20 200 2000 20000];
h_res = zeros(1,4);
err_res = zeros(1,4);
I = integral(f, a, b);

for i = 1:length(m_val)
    m = m_val(i);
    H = (b-a)/m;
    h_res(i) = H;
    x = linspace(a, b, m+1);
    y = f(x);
    I_PM_comp = pmedc(a, b, m, f);
    err_res(i) = abs(I-I_PM_comp);
end

table(m_val', h_res', err_res', 'VariableNames', {'m','H','Error'})

% Con PM, dovrebbe essere err = O(H^2) = C*H^2
% log(err) = log(C) + 2*log(H)
polyfit(log(h_res), log(err_res), 1) %ok

% ESERCIZI RIEPILOGO
% 1
n = 7;
a = n + 2;
f = @(x) (a*x.^5 - 1) ./ (x.^5 + 1);
x = linspace(0,1,10);
y = f(x);

I_T_comp = trapz(x, y)
I = integral(f, 0, 1)
s1 = griddedInterpolant(x, y, 'linear');
z = nthroot(1/a, 5)
s1(z)

% 2
f = @(x) 1./cos(x);
a = 0;
b = pi/4;
m_val = [10 100 1000 10000];
h_res = zeros(1,4);
I_pmc = zeros(size(m_val));
I_tc = zeros(size(m_val));
I_csc = zeros(size(m_val));
I = integral(f, a, b);

for i = 1:length(m_val)
    m = m_val(i);
    H = (b-a)/m;
    h_res(i) = H;
    x = linspace(a, b, m+1);
    y = f(x);
    I_pmc(i) = pmedc(a, b, m, f);
    I_tc(i) = trapz(x, y);
    I_csc(i) = simpsc(a, b, m, f);
end
h_res
err_pmc = abs(I - I_pmc)
polyfit(log(h_res), log(err_pmc), 1) % first value should be around 2

err_tc = abs(I - I_tc)
polyfit(log(h_res), log(err_tc), 1) % first value should be around 2

err_csc = abs(I - I_csc)
polyfit(log(h_res), log(err_csc), 1) % first value should be around 4