# Zeri di funzione

La ricerca degli zeri di una funzione consiste nel determinare un valore `a` tale che: `f(a) = 0`.

I metodi numerici restituiscono generalmente un'approssimazione della radice, non il suo valore esatto.

## 1. Funzione `fzero`

MATLAB mette a disposizione la funzione `fzero` per determinare uno zero di una funzione:

```matlab
alfa = fzero(f, [a,b]);
```

Dove:
- `f` è la funzione di cui si vuole trovare uno zero;
- `a` e `b` sono gli estremi di un intervallo iniziale;
- `alfa` è l'approssimazione della radice trovata.

È opportuno scegliere un intervallo in cui la funzione sia continua e assuma valori di segno opposto agli estremi. In queste condizioni, per il teorema degli zeri, esiste almeno una radice nell'intervallo `[a,b]`.

Esempio:

```matlab
f = @(x) x.^2 - 2;

alfa = fzero(f, [1, 2]);
```

## 2. Metodo di bisezione

```matlab
[x, nit] = bisezione(f, a, b, toll); % (lib)
```

**Input:**
- `f`: funzione di cui si cerca lo zero;
- `a`, `b`: estremi dell'intervallo iniziale;
- `toll`: tolleranza richiesta.

**Output:**
- `x`: approssimazione della radice;
- `nit`: numero di iterazioni effettuate.

## 3. Metodo di Newton

```matlab
[x, nit] = newton(f, df, x0, toll, nitmax); % (lib)
```

**Input:**
- `f`: funzione di cui si cerca lo zero;
- `df`: derivata della funzione;
- `x0`: valore iniziale, detto valore di innesco;
- `toll`: tolleranza richiesta nel test d'arresto;
- `nitmax`: numero massimo di iterazioni consentite.

**Output:**
- `x`: approssimazione della radice;
- `nit`: numero di iterazioni effettuate.