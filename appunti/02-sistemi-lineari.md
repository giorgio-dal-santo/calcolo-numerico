# Sistemi lineari

Dato il sistema lineare Ax = b

## 1. Risoluzione diretta con MATLAB

```matlab
x = A\b;             % risolve A*x = b
```

L'operatore `\` risolve il sistema senza calcolare esplicitamente l'inversa di \(A\).

**Nota numerica:** preferire `A\b` a `inv(A)*b`, perché è generalmente più efficiente e numericamente affidabile.

---

## 2. Metodi diretti

I metodi diretti calcolano la soluzione mediante un numero finito di operazioni aritmetiche, trascurando gli effetti degli errori di arrotondamento.

### 2.1 Metodo di eliminazione di Gauss (MEG)

Il metodo di eliminazione di Gauss trasforma il sistema in un sistema equivalente triangolare superiore, risolto poi mediante sostituzioni all'indietro.

### 2.2 Metodo delle sostituzioni in avanti e all'indietro

```matlab
y = L\b;             % sostituzione in avanti (L triangolare inferiore)
x = U\y;             % sostituzione all'indietro (U triangolare superiore)
```

Queste operazioni richiedono che le matrici triangolari abbiano diagonale non nulla per ottenere una soluzione unica.

### 2.3 Fattorizzazione LU

La fattorizzazione LU con pivoting parziale decompone la matrice nella forma PA=LU, dove:

- \(P\) è una matrice di permutazione;
- \(L\) è triangolare inferiore;
- \(U\) è triangolare superiore.

In MATLAB:

```matlab
[L,U,P] = lu(A);     % PA = LU

y = L\(P*b);         % risolve L*y = P*b
x = U\y;             % risolve U*x = y
```

**Derivazione:** da \(PA=LU\) e \(Ax=b\) si ottiene LUx=Pb.

Si risolvono quindi due sistemi triangolari consecutivi:

1. \(Ly=Pb\);
2. \(Ux=y\).

**Quando conviene:** se si devono risolvere più sistemi con la stessa matrice \(A\) e termini noti diversi, si può riutilizzare la fattorizzazione LU.

```matlab
[L,U,P] = lu(A);

y1 = L\(P*b1);
x1 = U\y1;

y2 = L\(P*b2);
x2 = U\y2;
```

### 2.4 Fattorizzazione di Cholesky

Si applica a matrici **simmetriche definite positive** (SPD, *Symmetric Positive Definite*).

Per una matrice reale SPD: A=R^T * R, dove (R) è triangolare superiore.

In MATLAB:

```matlab
R = chol(A);         % A = R' * R

y = R'\b;            % risolve R' * y = b
x = R\y;             % risolve R * x = y
```

**Vantaggi rispetto a LU:**

- sfrutta la simmetria e la definita positività;
- richiede generalmente meno operazioni aritmetiche;
- è spesso preferibile a LU quando le ipotesi sono soddisfatte.

Se la matrice non è definita positiva, `chol(A)` può restituire un errore.

---

## 3. Metodi iterativi

I metodi iterativi generano una successione di approssimazioni x_0, x_1, x_2, ... a partire da un vettore iniziale x_0. Il procedimento si arresta quando viene soddisfatto un criterio di convergenza oppure quando viene raggiunto il numero massimo di iterazioni.

Input:

| Parametro | Significato |
|---|---|
| `A` | matrice del sistema |
| `b` | termine noto |
| `x0` | approssimazione iniziale |
| `toll` | tolleranza del criterio di arresto |
| `nitmax` | numero massimo di iterazioni |

Output:

| Output | Significato |
|---|---|
| `x` | soluzione approssimata |
| `nit` | numero di iterazioni effettuate |

### 3.1 Metodo di Jacobi (lib)

```matlab
[x,nit] = jacobi(A,b,x0,toll,nitmax);
```

### 3.2 Metodo di Gauss-Seidel (lib)

```matlab
[x,nit] = gs(A,b,x0,toll,nitmax);
```