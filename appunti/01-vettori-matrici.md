# Vettori e matrici

## Indice

1. [Numeri complessi](#1-numeri-complessi)
2. [Funzioni matematiche](#2-funzioni-matematiche)
3. [Vettori](#3-vettori)
4. [Matrici](#4-matrici)
5. [Norme](#5-norme)

---

## 1. Numeri complessi

```matlab
z = 5 + 3i;          % numero complesso

real(z);             % parte reale: 5
imag(z);             % parte immaginaria: 3
conj(z);             % coniugato: 5 - 3i
abs(z);              % modulo: sqrt(5^2 + 3^2)
```

**Nota:** MATLAB usa `i` e `j` per indicare l'unità immaginaria, ma questi simboli possono essere sovrascritti da variabili. `1i` e `1j` evitano ambiguità.

## 2. Funzioni matematiche

```matlab
abs(x);              % valore assoluto
sqrt(x);             % radice quadrata principale
nthroot(x,n);        % radice n-esima reale
exp(x);              % esponenziale e^x
log(x);              % logaritmo naturale
log10(x);            % logaritmo in base 10

sin(x);              % seno (radianti)
cos(x);              % coseno (radianti)
tan(x);              % tangente
asin(x);             % arcoseno
acos(x);             % arcocoseno
atan(x);             % arcotangente

```

Le funzioni elementari operano elemento per elemento quando l'argomento è un vettore o una matrice.

## 3. Vettori

### 3.1 Creazione

```matlab
v = [1 2 3];         % vettore riga 1x3
w = [1; 2; 3];       % vettore colonna 3x1

v = 1:8;             % [1 2 3 4 5 6 7 8]
v = 1:2:9;           % [1 3 5 7 9]: inizio:passo:fine
v = 8:-1:1;          % sequenza decrescente

v = linspace(a,b,N); % N valori equispaziati tra a e b, estremi inclusi

zeros(n,1);          % vettore colonna di n zeri
ones(n,1);           % vettore colonna di n uni
```

### 3.2 Dimensioni

```matlab
length(v);           % dimensione maggiore
size(v);             % dimensioni [righe, colonne]
size(v,1);           % numero di righe
size(v,2);           % numero di colonne
```

Per vettori e matrici, `size` è preferibile quando occorre conoscere una dimensione specifica.

### 3.3 Indicizzazione

```matlab
v(1);                % primo elemento
v(end);              % ultimo elemento
v(2:4);              % elementi dalla posizione 2 alla 4
v([4 2 1]);          % elementi nelle posizioni 4, 2, 1
v(1:2:end);          % elementi in posizione dispari
v(end:-1:1);         % vettore in ordine inverso
```

MATLAB usa l'indicizzazione **a partire da 1**.

#### Indicizzazione logica

```matlab
v = [2 -1 4 0 -3];

v(v > 0);            % seleziona gli elementi positivi
v(v == 0);           % seleziona gli elementi nulli
v(v < 0) = 0;        % sostituisce gli elementi negativi con zero
find(v > 0);         % restituisce gli indici degli elementi positivi
```

Operatori di confronto:

| Operatore | Significato |
|---|---|
| `==` | uguale |
| `~=` | diverso |
| `<`, `>` | minore, maggiore |
| `<=`, `>=` | minore o uguale, maggiore o uguale |

Operatori logici: `&` (AND), `|` (OR), `~` (NOT).

### 3.4 Operazioni

```matlab
v + 5;               % somma uno scalare a ogni elemento
2 * v;               % prodotto per uno scalare
v + w;               % somma tra vettori di dimensioni compatibili
v - w;               % sottrazione
v .* w;              % prodotto elemento per elemento
v ./ w;              % divisione elemento per elemento
v .^ 2;              % quadrato di ogni elemento

v';                  % trasposta

v(3:4) = [];         % elimina gli elementi in posizione 3 e 4
z = [v w];           % concatenazione orizzontale
z = [v; w];          % concatenazione verticale
```

Le concatenazioni richiedono dimensioni compatibili: `[v w]` richiede lo stesso numero di righe; `[v; w]` richiede lo stesso numero di colonne.

### 3.5 Funzioni e riduzioni

```matlab
sum(v);              % somma degli elementi
prod(v);             % prodotto degli elementi
min(v);              % minimo
max(v);              % massimo
sort(v);             % ordinamento crescente
diff(v);             % differenze tra elementi consecutivi
```

Le funzioni matematiche si applicano direttamente agli elementi:

```matlab
v.*sin(v);           % v_i*sin(v_i)
exp(v);              % exp(v_i) per ogni elemento
sqrt(abs(v));        % sqrt(abs(v_i)) per ogni elemento
```

### 3.6 Prodotto scalare

```matlab
dot(v,w);            % prodotto scalare
```

I vettori devono avere lo stesso numero di elementi.

---

## 4. Matrici

### 4.1 Creazione

```matlab
A = [1 2 3; 4 5 6; 7 8 9]; % matrice 3x3

zeros(n,m);          % matrice n x m di zeri
ones(n,m);           % matrice n x m di uni
eye(n);              % matrice identità n x n
diag([1 2 3]);       % matrice diagonale
```

### 4.2 Dimensioni e indicizzazione

```matlab
size(A);             % [numero righe, numero colonne]
size(A,1);           % numero righe
size(A,2);           % numero colonne

A(2,3);              % elemento in riga 2, colonna 3
A(:,2);              % seconda colonna
A(1,:);              % prima riga
A(3:4,2:3);          % righe 3-4, colonne 2-3
A(end,:);            % ultima riga
A(:,end);            % ultima colonna

A(1,1) = 0;          % modifica di un elemento
A(1,:) = [];         % elimina la prima riga
A(:,2) = [];         % elimina la seconda colonna
```

### 4.3 Operazioni matriciali ed elemento per elemento

```matlab
A + B;               % somma matriciale
A - B;               % sottrazione matriciale
A * B;               % prodotto matriciale
A .* B;              % prodotto elemento per elemento
A ./ B;              % divisione elemento per elemento
A.^2;                % quadrato di ogni elemento

A';                  % trasposta
```

Il prodotto matriciale `A*B` richiede che il numero di colonne di `A` coincida con il numero di righe di `B`. Le operazioni elemento per elemento richiedono dimensioni compatibili.

### 4.4 Diagonali e matrici triangolari

```matlab
diag(A);             % vettore della diagonale principale
diag(A,1);           % diagonale sopra quella principale
diag(A,-1);          % diagonale sotto quella principale

tril(A);             % triangolare inferiore
triu(A);             % triangolare superiore
tril(A,-1);          % parte strettamente inferiore
triu(A,1);           % parte strettamente superiore
```

### 4.5 Inversa, determinante, rango e traccia

```matlab
inv(A);              % matrice inversa, se A è quadrata e invertibile
det(A);              % determinante
rank(A);             % rango numerico
trace(A);            % traccia: somma degli elementi diagonali
```

---

## 5. Norme

### 5.1 Norme vettoriali

```matlab
norm(v,1);           % norma 1: somma dei moduli
norm(v,2);           % norma euclidea
norm(v,inf);         % norma infinito: massimo dei moduli
```

### 5.2 Norme matriciali

```matlab
norm(A,1);           % massimo della somma dei moduli per colonna
norm(A,inf);         % massimo della somma dei moduli per riga
```