function  [x, nit]=gs(A, b, x0, toll, nitmax)
%input: A matrice del sistema
%       b termine noto
%       x0 vettore iniziale
%       toll tolleranza nel test d'arresto
%       nitmax  numero massimo di iterazioni consentite
%output: x vettore soluzione
%        nit numero di iterazioni effetuate
D=diag(diag(A));
E=-tril(A,-1);
F=-triu(A,1);
nit=0;
err=toll+1;
nb=norm(b,inf);
while err>toll & nit<nitmax
    x=(D-E)\(b+F*x0);
    err=max(norm(x-x0,inf)/norm(x,inf), norm(b-A*x,inf)/nb);
    nit=nit+1;
    x0=x;
end
if (nit==nitmax & err>toll)
  disp('GS non converge nel numero di iterazioni assegnato');
  return
end
