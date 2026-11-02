function [x,nit]=newton(f,df,x0,toll,nitmax)
%input:     f       funzione definita con @
%           df      derivata di f definita con inline
%           x0      valore iniziale
%           toll    precisione
%           nitmax  numero massimo iterazioni consentite
%output:    x       soluzione approssimata
%           nit     iterazioni effettuate
nit=0;
err=1+toll;
while nit<nitmax & err>toll
    x=x0-f(x0)/df(x0);
    err=abs(x-x0);
    nit=nit+1;
	x0=x;
end
if nit==nitmax & err>toll
        disp('non converge nel numero di iterazioni assegnato');
      return
end
