# Interpolazione polinomiale

## 1. Interpolazione polinomiale globale

L'interpolazione polinomiale consiste nel determinare un polinomio `p_n(x)` di grado al più `n` che passi per `n+1` punti assegnati, detti **nodi di interpolazione**.

Dati i vettori delle ascisse `x` e delle ordinate `y`, MATLAB permette di calcolare i coefficienti del polinomio interpolante tramite `polyfit`.

```matlab
x = [-2 1 2 7];
y = [-4 -1 0.5 3];

n = length(x) - 1;
p = polyfit(x, y, n);
```

dove:
- `x` contiene le ascisse dei nodi;
- `y` contiene i valori della funzione nei nodi;
- `n` è il grado del polinomio interpolante;
- `p` contiene i coefficienti del polinomio, ordinati dal grado maggiore al termine noto.

## 2. Nodi di Chebyshev

I nodi di Chebyshev sono punti scelti in modo particolare per ridurre gli effetti dell'errore di interpolazione, soprattutto il fenomeno di Runge, che può verificarsi utilizzando nodi equidistanti.

I nodi di Chebyshev di prima specie nell'intervallo `[-1,1]`, per un polinomio di grado `n`, sono:

```matlab
n = 10;
k = 1:n;

ck = cos(pi*(2*k - 1)/(2*(n)));
```

Per ottenere i nodi in un intervallo generico `[a,b]`, si applica una trasformazione affine:

```matlab
a = -2;
b = 3;

xk = (b-a)/2 * ck + (a+b)/2;
```

I nodi così ottenuti sono distribuiti più densamente vicino agli estremi dell'intervallo.

## 3. Interpolazione polinomiale composita lineare

Una seconda possibile soluzione al problema evidenziato dal controe-
sempio di Runge consiste nell'interpolazione polinomiale composita lineare che consiste nel costruire un polinomio di primo grado su ciascun intervallo delimitato da due nodi consecutivi.

Dati i punti `x_i, y_i`, tra due nodi consecutivi l'interpolante è il segmento che li congiunge. L'interpolante è quindi una funzione definita a tratti, continua sui nodi.

```matlab
x = [-1 1 2 3 5];
y = [0 -1 5 2 1];

s1 = griddedInterpolant(x, y, 'linear'); % spline lineare interpolante
```

Per valutare l'interpolante in uno o più punti:

```matlab
s1_z = s1(1.5);
s1_zz = s1([0 1.5 2.5 4]);
```

L'opzione `'linear'` specifica l'interpolazione lineare tra nodi consecutivi.