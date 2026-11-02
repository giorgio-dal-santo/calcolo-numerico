function [x,nit]=bisezione(f,a,b,toll)
%input:     f       funzione definita con @
%           a, b    estremi intervallo tali che f(a)*f(b)<0
%           toll    precisione
%output:    x       soluzione approssimata
%           nit     iterazioni effettuate
%

fa=f(a);
fb=f(b);
if fa*fb >= 0
    nit=0;
	disp('intervallo non accettabile')
    x=[];
	return
end
err=(b-a)/2;
x=(a+b)/2; 
nit=1;
while err>toll
    fx=f(x);
    if fx==0
        return;
    end
	if fx*fa<0;
        	b=x;
            fb=fx;
	else
	        a=x;
            fa=fx;
    end
    x=(a+b)/2;
    err=err/2;
    nit=nit+1;
end



