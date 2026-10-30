# Grafici 2D in MATLAB

## 1. Grafico di una funzione

Per visualizzare una funzione \(y=f(x)\), si genera un vettore di ascisse e si calcolano i corrispondenti valori della funzione.

```matlab
x = linspace(0, pi, 100);       % 100 punti tra 0 e pi
y = 2*sin(x).*cos(x) + 2*x;     % valori della funzione

plot(x,y);                      % grafico della funzione
```

## 2. Visualizzare più grafici nella stessa finestra

```matlab
x = linspace(0, pi, 100);

fx = sin(x) + x;
gx = x.^2 + cos(x);

plot(x,fx);
hold on;
plot(x,gx);
hold off;
```

- `hold on`: mantiene il grafico corrente e permette di aggiungere nuove curve.
- `hold off`: ripristina il comportamento predefinito, in cui un nuovo comando grafico sostituisce il precedente.

È possibile disegnare più funzioni anche con un unico comando `plot`:

```matlab
plot(x,fx,'r',x,gx,'b');
```

## 3. Visualizzare grafici in finestre separate

Si utilizza `figure(n)` per selezionare o creare una finestra grafica identificata dal numero `n`.

```matlab
x = linspace(0, pi, 100);

fx = sin(x) + x;
gx = x.^2 + cos(x);

figure(1);
plot(x,fx);

figure(2);
plot(x,gx);
```

## 4. Grafico di punti senza collegamento

Per visualizzare punti discreti senza unirli con una linea si specifica un marker nel comando `plot`.

```matlab
x = [-5 -4.5 -3 -2.3 -1 0.5 1 2 3 4 5];
y = [-0.9 -0.85 -0.4 -0.2 0.4 0.3 0.7 0.6 0.8 1 1.2];

plot(x,y,'*');       % punti rappresentati con asterischi
```

Alcuni marker disponibili:

| Simbolo | Marker |
|---|---|
| `'o'` | Cerchio |
| `'+'` | Croce |
| `'x'` | X |
| `'s'` | Quadrato |
| `'d'` | Rombo |

## 5. Personalizzazione del grafico

È possibile aggiungere titolo, etichette degli assi, legenda e griglia.

```matlab
x = linspace(0, pi, 100);

fx = sin(x) + x;
gx = x.^2 + cos(x);

plot(x,fx,'r',x,gx,'b');

title('Grafici di funzioni');
xlabel('Asse x');
ylabel('Asse y');
legend('f','g');
grid on;
```

### 5.1 Colori e stili delle linee

Alcuni colori disponibili:

| Simbolo | Colore |
|---|---|
| `'r'` | Rosso |
| `'g'` | Verde |
| `'b'` | Blu |
| `'k'` | Nero |
| `'m'` | Magenta |
| `'c'` | Ciano |
| `'y'` | Giallo |

Stili delle linee:

| Simbolo | Stile |
|---|---|
| `'-'` | Continua |
| `'--'` | Tratteggiata |

È possibile combinare colore, stile e marker:

```matlab
plot(x,fx,'r--o');     % linea rossa tratteggiata con marker circolari
```

### 5.2 Limiti degli assi e proporzioni

```matlab
xlim([0 pi]);          % limiti asse x
ylim([-2 10]);         % limiti asse y
axis([0 pi -2 10]);    % [xmin xmax ymin ymax]

axis equal;            % stessa scala sugli assi
axis tight;            % limiti adattati ai dati
axis square;           % area del grafico quadrata
axis auto;             % limiti automatici
```

## 6. Più grafici nella stessa finestra

Per dividere una finestra grafica in più aree si utilizza `subplot`.

```matlab
x = linspace(0,pi,100);

fx = sin(x);
gx = cos(x);
hx = sin(2*x);

figure;

subplot(2,2,1);        % griglia 2x2, posizione 1
plot(x,fx);
title('sin(x)');

subplot(2,2,2);        % posizione 2
plot(x,gx);
title('cos(x)');

subplot(2,2,3);        % posizione 3
plot(x,hx);
title('sin(2x)');
```

Sintassi:

```matlab
subplot(m,n,p);
```

- `m`: numero di righe;
- `n`: numero di colonne;
- `p`: posizione del grafico, numerata per righe da sinistra a destra.


## 7. Funzioni anonime (anonymous functions)

Le funzioni anonime permettono di definire una funzione direttamente all'interno di una variabile, senza creare un file `.m` separato.

Sintassi:

```matlab
f = @(x) espressione;
```

Esempio:

```matlab
f = @(x) (sin(x) + x).^2;
```

La funzione può essere valutata sia in un singolo punto sia in un vettore di punti.

```matlab
f(1);                  % valutazione in x = 1
f([1 2 3]);            % valutazione in più punti
```

### 7.1 Funzioni con più variabili

```matlab
f = @(x,a) a*sin(x) + x.^2;

x = linspace(0,2*pi,100);
y = f(x,2);

plot(x,y);
```

## 8. Grafici con scale logaritmiche

MATLAB mette a disposizione funzioni specifiche per utilizzare scale logaritmiche sugli assi.

```matlab
plot(x,y);             % scala lineare su entrambi gli assi
semilogy(x,y);         % asse x lineare, asse y logaritmico
semilogx(x,y);         % asse x logaritmico, asse y lineare
loglog(x,y);           % entrambi gli assi logaritmici
```