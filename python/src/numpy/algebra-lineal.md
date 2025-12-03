# Àlgebra lineal

Aquesta llicó cobreix les operacions bàsiques d'àlgebra lineal utilitzant NumPy.

## Producte matricial

El **producte matricial** és una de les operacions fonamentals. En NumPy, hi ha dues maneres d'efectuar-lo:

-   La funció `numpy.dot()` (o el mètode `.dot()` d'un _array_). Tot i que pot fer productes escalars i productes de matriu per vector, el seu ús principal per al producte matricial s'ha vist reemplaçat.

-   L'operador `@` és la forma preferida i més clara d'indicar el producte matricial.

Exemple:

```python
import numpy as np

A = np.array([[1, 2], [3, 4]])
B = np.array([[5, 6], [7, 8]])

# Usant l'operador @ (Recomanat)
C_at = A @ B
print("A @ B:\n", C_at)

# Usant np.dot()
C_dot = np.dot(A, B)
print("np.dot(A, B):\n", C_dot)
```

**Nota:** Per al producte element a element, cal utilitzar l'operador de multiplicació estàndard `*`.

## Determinant i rang de matrius

Aquestes operacions es realitzen utilitzant funcions del submòdul `numpy.linalg`.

El **determinant** d'una matriu quadrada es calcula amb `numpy.linalg.det()`.

```python
A = np.array([[4, 6], [3, 8]])
det_A = np.linalg.det(A)
print("Determinant de A:", det_A) # 4*8 - 6*3 = 32 - 18 = 14
```

El **rang** d'una matriu és la dimensió de l'espai columna (o l'espai fila), que és igual al nombre de valors singulars diferents de zero. Es calcula amb `numpy.linalg.matrix_rank()`.

```python
B = np.array([[1, 2, 3], [4, 5, 6], [7, 8, 9]])
rang_B = np.linalg.matrix_rank(B)
print("Rang de B:", rang_B) # Aquesta matriu és singular (rang 2)
```

## Inversa de matrius

La **inversa** d'una matriu quadrada es calcula amb `numpy.linalg.inv()`. Si la matriu és singular (determinant zero), la funció llançarà una excepció `LinAlgError`.

```python
A = np.array([[1, 2], [3, 4]])
A_inversa = np.linalg.inv(A)
print("Inversa de A:\n", A_inversa)

# Comprovació: A @ A_inversa ha de ser la matriu identitat
identitat = A @ A_inversa
print("A @ A_inversa:\n", identitat)
```

## Valors i vectors propis

La funció `numpy.linalg.eig()` retorna una tupla amb:

1.  Un _array_ dels valors propis.
2.  Una matriu on les columnes són els vectors propis corresponents.

```python
M = np.array([[2, -1], [4, -3]])
valors_propis, vectors_propis = np.linalg.eig(M)

print("Valors propis:", valors_propis)
print("Vectors propis (columnes):\n", vectors_propis)
```

## Descomposicions: SVD, QR, LU

NumPy suporta diverses **descomposicions matricials** fonamentals en anàlisi numèrica:

-   **SVD (Descomposició en Valors Singulars):** Es calcula amb `numpy.linalg.svd()`. Descompon una matriu $A$ en $U \Sigma V^T$. És una eina essencial en la compressió de dades i l'estadística.
-   **QR:** Es calcula amb `numpy.linalg.qr()`. Descompon una matriu $A$ en un producte d'una matriu ortogonal $Q$ i una matriu triangular superior $R$.
-   **LU (o Descomposició de Cholesky per a matrius definides positives):** La descomposició LU es fa amb `scipy.linalg.lu` (requereix SciPy), però NumPy té `numpy.linalg.cholesky()` per a matrius simètriques i definides positives, descomponent $A = L L^T$.

**Exemple (SVD):**

```python
A = np.array([[1, 1], [0, 1], [1, 0]])
U, S, Vh = np.linalg.svd(A)

print("Matriu U:\n", U)
print("Valors singulars (S):\n", S)
print("Matriu Vh (V transposada conjugada):\n", Vh)
```

---

## Resolució de sistemes d'equacions lineals

Per resoldre un sistema d'equacions lineals de la forma $A x = b$, on $A$ és la matriu de coeficients, $x$ és el vector d'incògnites i $b$ és el vector de termes independents, s'utilitza la funció `numpy.linalg.solve()`.

Aquesta funció és generalment més **eficient** i numèricament **estable** que calcular l'inversa ($x = A^{-1} b$).

Per exemple, considerem el següent sistema d'equacions:

$$
\begin{cases}
2x + 3y = 8 \\
x - 2y = -3
\end{cases}
$$

Aquest problema es pot resoldre amb NumPy de la manera següent:

```python
# Matriu de coeficients (A)
A = np.array([[2, 3], [1, -2]])
# Vector de termes independents (b)
b = np.array([8, -3])

# Resoldre A x = b
x = np.linalg.solve(A, b)

print("La solució (x, y) és:", x)
# La solució és (1.0, 2.0)
```

<Autors autors="jpetit"/>
