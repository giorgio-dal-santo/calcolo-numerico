# Polinomi e integrazione numerica

## 1. Rappresentazione dei polinomi

In MATLAB un polinomio è rappresentato da un vettore riga contenente i coefficienti, ordinati dal termine di grado maggiore al termine noto.

I coefficienti nulli dei termini mancanti devono essere comunque inseriti.

```matlab
p = [-3 2 0 1 -5];
% p(x) = -3x^4 + 2x^3 + x - 5
```

## 2. Valutazione di un polinomio

La funzione `polyval` calcola il valore di un polinomio in uno o più punti.

```matlab
w = polyval(p, 2);          % valutazione in x = 2
W = polyval(p, [2 3 4]);    % valutazione in più punti
```

## 3. Operazioni tra polinomi

### Moltiplicazione e divisione per uno scalare

```matlab
a = 3;

z = a * p;    % moltiplicazione per uno scalare
z = p / a;    % divisione per uno scalare
```

### Somma e differenza

```matlab
p = [-3 2 0 1 -5];
q = [2 1 -4];

n = max(length(p), length(q));

p1 = [zeros(1,n-length(p)), p];
q1 = [zeros(1,n-length(q)), q];

s = p1 + q1;    % somma
d = p1 - q1;    % differenza
```

Per sommare o sottrarre due polinomi, i vettori dei coefficienti devono avere la stessa lunghezza.  È possibile allinearli aggiungendo zeri a sinistra:

### Prodotto

La funzione `conv` calcola il prodotto tra due polinomi:

```matlab
z = conv(p, q);
```

### Divisione

La funzione `deconv` calcola il quoziente e il resto della divisione tra polinomi:

```matlab
[quot, rem] = deconv(p, divisor);
```

## 4. Derivata e integrale di un polinomio

### Derivata

La funzione `polyder` restituisce il vettore dei coefficienti della derivata:

```matlab
dp = polyder(p);
```

### Integrale indefinito

La funzione `polyint` restituisce il vettore dei coefficienti di una primitiva del polinomio:

```matlab
ip = polyint(p);
```

## 5. Radici di un polinomio

La funzione `roots` calcola le radici del polinomio, cioè i valori di \(x\) per cui `p(x) = 0`.

```matlab
z = roots(p);
```

Le radici possono essere reali o complesse.

Per ricostruire un polinomio a partire dalle sue radici si può usare `poly`:

```matlab
p = poly(z);
```

## 6. Integrazione numerica

La funzione `integral` calcola numericamente un integrale definito di una funzione:

```matlab
q = integral(f, a, b);
```

dove:
- `f` è una function handle;
- `a` è l'estremo inferiore;
- `b` è l'estremo superiore;

Esempio:

```matlab
f = @(x) sin(x);
q = integral(f, 0, pi);
```

### Tolleranze e accuratezza

Il valore approssimato `q` può essere confrontato con il valore esatto `I`.

**Errore assoluto:** `|q - I|`

**Errore relativo:** `|q - i| / |i|`