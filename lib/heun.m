function  [T,Y] =heun(f,T,y0)
% 	 [T,Y] = heun(f,T,y0)
%
% Heun  - passo fisso
%
% Parametri di ingresso:
% f   stringa che contiene il nome di una funzione F(t,y) con t e y scalari
% T   vettore riga di tipo [t0:h:tmax] che contiene gli istanti di approssimazione 
% y0   valore iniziale
%
% Parametri di uscita:
% T   vettore colonna che contiene gli istanti di approssimazione
% Y   vettore colonna che contiene il valore della soluzione al tempo contenuto
%     nella stessa riga di T
%
h=T(2)-T(1);
hm=h/2;
Y=y0;
%
for n=1:length(T)-1
   K1=f(T(n),Y(n));
   K2=f(T(n+1),Y(n)+h*K1);
   Y(n+1)=Y(n)+hm*(K1+K2);
end
%
T=T(:);
Y=Y';
