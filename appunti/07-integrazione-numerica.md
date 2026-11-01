# Integrazione numerica

L'integrazione numerica permette di approssimare il valore di un integrale definito.

Le formule di quadratura approssimano l'integrale utilizzando i valori della funzione in un numero finito di punti, detti **nodi di quadratura**.

## 1. Formule di quadratura semplici

### Formula del punto medio

Approssima l'integrale utilizzando il valore della funzione nel punto medio dell'intervallo.

```matlab
I_PM = (b-a)*f((a+b)/2);
```

È esatta per polinomi di grado al massimo 1.

### Formula del trapezio

Approssima l'integrale mediante l'area del trapezio avente come basi i valori \(f(a)\) e \(f(b)\).

```matlab
I_T = (b-a)/2 * (f(a)+f(b));
```

È esatta per polinomi di grado al massimo 1.

### Formula di Cavalieri-Simpson

Utilizza i valori della funzione agli estremi e nel punto medio dell'intervallo.

```matlab
I_CS = (b-a)/6 * (f(a) + 4*f((a+b)/2) + f(b));
```

È esatta per polinomi di grado al massimo 3.

## 2. Formule di quadratura composite

Le formule composite si ottengono dividendo l'intervallo \([a,b]\) in \(m\) sottointervalli di uguale ampiezza.

La suddivisione permette di applicare la formula semplice su ogni sottointervallo, ottenendo generalmente un'approssimazione più accurata.

### Formula composita del punto medio

Si applica la formula del punto medio a ciascun sottointervallo.

```matlab
I_PM_comp = pmedc(a, b, m, f); % (lib)
```

### Formula composita del trapezio

Si applica la formula del trapezio su ciascun sottointervallo.

```matlab
x = linspace(a, b, m+1);
y = f(x);

I_T_comp = trapz(x, y);
```

Errore assoluto: `|I - I_T_comp|` dove I è il valore esatto dell'integrale.

### Formula composita di Cavalieri-Simpson

Si applica la formula di Simpson su ciascuna coppia di sottointervalli.

```matlab
I_S_comp = simpsc(a, b, m, f); % (lib)
```