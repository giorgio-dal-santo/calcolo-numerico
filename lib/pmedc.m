function int = pmedc(a,b,m,f)
%
%        Formula del punto medio composita
%        int = pmedioc(a,b,m,fun)
%        a,b = estremi integrazione
%        m = numero sottointervalli
%            (m=1 formula semplice)
%        f = nome function per la 
%              funzione integranda
%
%
x=linspace(a,b,m+1);
H=(b-a)/m;
int=H*sum(f(x(1:end-1)+H/2));

