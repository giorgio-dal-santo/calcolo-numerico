# Metodi numerici per equazioni differenziali ordinarie

## 1. Risoluzione tramite `ode45`

MATLAB mette a disposizione la funzione `ode45` per risolvere numericamente problemi ai valori iniziali.

```matlab
[T, U] = ode45(fun, tspan, y0);
```

**Input:**
- `fun`: funzione che definisce l'equazione differenziale, ovvero \(f(t,y)\);
- `tspan`: intervallo di integrazione `[t0, tmax]`;
- `y0`: condizione iniziale.

**Output:**
- `T`: vettore colonna contenente i tempi in cui viene calcolata la soluzione;
- `U`: matrice contenente le approssimazioni della soluzione nei tempi indicati.

Per un problema scalare, `U` è un vettore colonna. Per un sistema di equazioni differenziali, ogni colonna di `U` rappresenta una componente della soluzione.

## 2. Metodo di Eulero esplicito

```matlab
[T, U] = eulero(fun, T, y0); % (lib)
```

**Input:**
- `fun`: funzione \(f(t,y)\);
- `T`: vettore riga dei nodi `[t0, t1, ..., tN]`;
- `y0`: condizione iniziale.

**Output:**
- `T`: vettore colonna dei nodi;
- `U`: vettore colonna delle approssimazioni della soluzione.

## 3. Metodo di Eulero implicito

```matlab
[T, U] = eulimp(fun, T, y0, dfy, toll, nitmax); % (lib)
```

**Input:**
- `fun`: funzione \(f(t,y)\);
- `T`: vettore riga dei nodi;
- `y0`: condizione iniziale;
- `dfy`: derivata parziale di \(f\) rispetto a \(y\);
- `toll`: tolleranza del metodo di Newton;
- `nitmax`: numero massimo di iterazioni consentite a Newton.

**Output:**
- `T`: vettore colonna dei nodi;
- `U`: vettore colonna delle approssimazioni della soluzione.

## 4. Metodo di Heun

```matlab
[T, U] = heun(fun, T, y0); % (lib)
```

**Input:**
- `fun`: funzione \(f(t,y)\);
- `T`: vettore riga dei nodi;
- `y0`: condizione iniziale.

**Output:**
- `T`: vettore colonna dei nodi;
- `U`: vettore colonna delle approssimazioni della soluzione.

## 5. Metodo di Crank-Nicolson

```matlab
[T, U] = cranknic(fun, T, y0, dfy, toll, nitmax); % (lib)
```

**Input:**
- `fun`: funzione \(f(t,y)\);
- `T`: vettore riga dei nodi;
- `y0`: condizione iniziale;
- `dfy`: derivata parziale di \(f\) rispetto a \(y\);
- `toll`: tolleranza del metodo di Newton;
- `nitmax`: numero massimo di iterazioni consentite a Newton.

**Output:**
- `T`: vettore colonna dei nodi;
- `U`: vettore colonna delle approssimazioni della soluzione.