# Minimi quadrati

## 1. Retta di regressione

La retta di regressione è un polinomio di primo grado che approssima un insieme di punti `(x_i, y_i)` nel senso dei minimi quadrati.

In MATLAB si utilizza la funzione `polyfit`:

```matlab
% Dati
x = [-5 -2 0.5 1 1.5 3 6];
y = [1.5 2 -1 2.5 1 -2 3];

% Retta di regressione (grado 1)
r = polyfit(x, y, 1);
```

---

## 2. Polinomi di approssimazione ai minimi quadrati di grado generico

È possibile approssimare un insieme di punti mediante un polinomio di grado \(m\).

La funzione MATLAB `polyfit` permette di calcolare i coefficienti del polinomio approssimante.

La sintassi è:

```matlab
p = polyfit(x, y, m);
```

Dove:
- `x`: vettore delle ascisse;
- `y`: vettore delle ordinate;
- `m`: grado del polinomio.

### Esempio: polinomi di grado da 0 a 4

```matlab
% Dati
x = [-3 -2 0 2 4];
y = [3 2 0.5 1 3];

% Gradi dei polinomi
M = 0:4;

for m = M

    % Calcolo del polinomio ai minimi quadrati
    pm = polyfit(x, y, m);

end
```

Il ciclo calcola i polinomi approssimanti di grado:

\[
m=0,1,2,3,4
\]

---

## 3. Metodi di linearizzazione

I metodi di linearizzazione permettono di trasformare alcuni modelli non lineari in modelli lineari, applicando opportune trasformazioni matematiche.

In questo modo è possibile utilizzare la regressione lineare per stimare i parametri del modello.

### 3.1 Modello esponenziale

**Codice MATLAB**

```matlab
% Trasformazione dei dati
Y = log(y);

% Regressione lineare
p = polyfit(x, Y, 1);

% Recupero dei parametri
A = p(1);
C = exp(p(2));

% Funzione esponenziale approssimante
f = @(x) C*exp(A*x);
```

---

### 3.2 Modello di potenza

**Codice MATLAB**

```matlab
% Trasformazione dei dati
X = log(x);
Y = log(y);

% Regressione lineare
p = polyfit(X, Y, 1);

% Recupero dei parametri
A = p(1);
C = exp(p(2));

% Funzione di potenza approssimante
f = @(x) C*x.^A;
```