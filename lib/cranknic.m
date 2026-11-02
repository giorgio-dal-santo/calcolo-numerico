function [T,Y] = cranknic(f,T,y0,dfy,toll,nitmax)
% Metodo di Crank-Nicolson associato a Newton per un' EDO
% [T,Y] = crank_nicolson(f,T,y0,dfy,toll,nitmax)
%  
if nargin==4
    toll=1e-6;
    nitmax=20;
elseif nargin==5
    nitmax=20;
end
%
h=T(2)-T(1);
hm=h/2;
Y=y0;
%
for n=1:length(T)-1
	err=toll+1;
	nit=0;
	y=Y(n);
    aux=y+hm*f(T(n),y);
	while (nit<nitmax & err>toll)
		nit=nit+1;
		yp=y-(y-aux-hm*f(T(n+1),y))/(1-hm*dfy(T(n+1),y));
		err=abs(yp-y);
		y=yp;
	end
	if nit==nitmax & err>toll
      	  disp('non converge nel numero di iterazioni assegnato')
	  disp('per t= ',T(n))	
	end
	Y(n+1)=yp;
end          
T=T(:);
Y=Y';
