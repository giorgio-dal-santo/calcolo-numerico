function int = simpsc(a,b,m,f)
%
%        Formula di Cavalieri-Simpson composita
%        
%        int = simpsc(a,b,m,f)
%        a,b = estremi integrazione
%        m = numero sottointervalli
%            (m=1 formula semplice)
%        f = nome function per la 
%              funzione integranda
% 


x=linspace(a,b,m+1);
H=(b-a)/m;
int=H/6*(f(a)+f(b)+2*sum(f(x(2:end-1)))+4*sum(f(x(1:end-1)+H/2)));