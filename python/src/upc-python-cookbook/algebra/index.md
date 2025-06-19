# ALGEBRA

The aim of this section is to give the resources needed for the use of python in the subject of Algebra 1. This subject will not focus on your programmer skills, but on the knowledge of the tools needed for performing computations using a computer.

## First steps

If you need to install Python, please have a look to [Python Installation](/upc-python-cookbook/installation.html).

To do computations in algebra we will use the packages `SymPy` and `NumPy`.

With `SymPy` we will be able to use mathematical objects such as equations or functions, and work with them. First of all, to use `SymPy` we will need to **import the package**. We can do it importing everything right away:

```python
from sympy import *
```

or keeping it under a key name:

```python
import sympy as sp
```

> 💡 At the begining of each file, we can call the function:
>
> ```python
> init_printing()
> ```
>
> in order to make the output nicer to the eye.

**Mathematical variables** can be defined with the `Symbol` class:

```python
a = symbols('a')
x, y, z = symbols('x y z')
X1, X2, X3, X4, X5 = symbols('X1:6n')
```

**Expressions** can be defined doing operations with numbers and symbols. Examples:

```python
f = 2*x + 3
g = x**2 + y**2 - 2*x*y
h = exp(abs(x)) + sqrt(y) / 0.4
```

**Equations** can be defined like expressions, taking for granted that they are equal to zero. They can be solved used diferent functions such as `solve` or `linsolve` (only for linear systems).

```python
solve(eq(x), x)                            # Solve a single equation
solve( [eq1, eq2, ...], (x1, x2 ... xn) )  # Solve multiple equations
```

**Substitution** in these expressions can be done with the `subs` method. Examples:

```python
>>> f = 2*x + 3
>>> f.subs(x, y)
>>> f
2*y + 3
>>> g = x**2 + y**2 - 2*x*y
>>> g.subs( [(x, 5), (y, 2)] )
>>> g
9
```

The methods `evalf()`, `expand()` and `simplify()` can also be used to **work with expressions**:

```python
>>> sqrt(2)
√2
>>> sqrt(2).evalf()
1.4142135623731
>>> x = symbols('x')
>>> f = (2*x + 2) * (9 - 3*x)
>>> f
(9−3𝑥)(2𝑥+2)
>>> f.simplify()
−6(𝑥−3)(𝑥+1)
>>> f.expand()
−6𝑥**2+12𝑥+18
```

<span id="complex-numbers">**Complex numbers** can be represented natively in Python. To represent the imaginary unit we will use `j`. Some examples:</span>

```python
z = 1j
z = 2 + 2j
z = 4 * exp(pi/2*1j)
```

There are useful functions to work with complex numbers like `im` (imaginary part), `re` (real part), `Abs` (module) and `arg` (angle).

```python
>>> im(3 + 2j)
2
>>> re(3 + 2j)
3
>>> arg(2 + 2j)
pi/4
>>> Abs(3 + 4j)
5
```

There are many other functions and classes included in `SymPy`. To learn more, visit the [official documentation](https://docs.sympy.org/latest/index.html) of the package.

<br />
## Matrices
To work with matrices we will use a class from the `SymPy` package called `Matrix`. It's built to be flexible and useful.

### Creation

Matrices can be created easily:

```python
A = Matrix([
    [a11, a12, ... a1n],
    [a21, a22, ... a2n],
    ...
    [am1, am2, ... amn]
])
```

or in one line:

```python
A = Matrix([[a11, a12, ... a1n], ... [am1, am2, ... amn]])
```

<!--
### Vectors
Vectors can be treated as column matrices, and they can be created even more easily than normal matrices:
```python
C = Matrix([a1, a2, ...])
```
> 💡 We can add all the items of a vector using the function `sum()`:
> ```python
> v = Matrix( [a1, a2, ..., an] )
> S = sum(v)   # S = a1 + a2 + ... + an
> ```
-->

> 💡 Vectors can be treated as column matrices, and they can be created even more easily than normal matrices:
>
> ```python
> C = Matrix([a1, a2, ...])
> ```
>
> We can add all the items of a vector using the function `sum()`:
>
> ```python
> v = Matrix( [a1, a2, ..., an] )
> S = sum(v)   # S = a1 + a2 + ... + an
> ```

There are also ways to create special matrices like:

```
eye(n)              # Identity
zeros((m,n))        # Matrix of zeros
ones((m,n))         # Matrix of ones
diag(d1, d2, ...)   # Diagonal matrix
```

### Operations

#### Basic operations

Sympy Matrices can be operated between them naturally:

```python
A = Matrix(...)
B = Matrix(...)

A+B    # Addition
A-B    # Difference
A*B    # Matrix product
3*A    # Product by scalar
A**2   # Power
A**-1  # Inverse (if the matrix is invertible)
```

#### Matrix operations
The class has also methods for the specific matrix operations.

```python
M = Matrix(...)

M.rank()  # Rank
M.det     # Determinant
M.inv()   # Inverse (if the matrix is invertible)
M.T       # Transposed
```

### Reduced row echelon form

The way to get the reduced row echelon form is using the method `rref()`. It returns the echelon matrix and a list of the independent columns.

> 📝 Example:
> Find the reduced row echelon form of the matrix
>
> $$
> M = \begin{pmatrix}
> 2 & -2 & 4 & -2 \\\
> 2 & 1 & 10 & 7 \\\
> -4 & 4 & -8 & 4 \\\
> 4 & -1 & 14 & 6
> \end{pmatrix}
> $$
>
> ```python
> >>> M = Matrix([
> >>>     [ 2, -2,  4, -2],
> >>>     [ 2,  1, 10,  7],
> >>>     [-4,  4, -8,  4],
> >>>     [ 4, -1, 14,  6]
> >>> ])
> >>> M.rref()
> ```
>
> The output will be: $ \left( \begin{bmatrix} 1 & 0 & 4 & 0 \\\ 0 & 1 & 2 & 0 \\\ 0 & 0 & 0 & 1 \\\ 0 & 0 & 0 & 0 \end{bmatrix}, \left( 0, 1, 3 \right) \right) $

### LU Decomposition

```python
M = Matrix(...)

L, U, P = A.LUdecomposition()
```

The function returns L, U and a list of indices of rows P (which might be empty).P records the indices of the rows that have to be permuted if transformations of type E1 must be used in order to reduce A.

### Manipulating matrices
There are some methods that can be used to manipulate matrices like one could do manually. The most important ones are listed below.

<!-- SIMPLIFICAT
* Accessing a row: row(x)
* Accessing a column: col(x)
* Deleting rows and columns: col_del(x), row_del(x)
* Inserting rows and columns: col_insert(x), row_insert(x)
* (...)
-->

#### Accessing rows and columns

The methods `row` and `col` can be used to get individual rows or columns from a matrix. It's also possible to access a part of a matrix using a double index notation (Matrix[a,b]) just like in lists.

```python
>>> M = Matrix([[1, 2, 3], [-2, 0, 4]])
>>> M
⎡1   2  3⎤
⎢        ⎥
⎣-2  0  4⎦
>>> M.row(0)
[1  2  3]
>>> M.col(1)
⎡2⎤
⎢ ⎥
⎣0⎦
>>> M[0, 2]
3
>>> M[:, :2]
⎡1   2⎤
⎢     ⎥
⎣-2  0⎦
```

> ⚠️ Warning: indexes go from 0 to n-1. Negative indexes can also be used to access the elements starting by the last element (for example, M.row(-1) will return the last row)

#### Deleting and inserting rows and columns

To delete a row on column, one can use `row_del` and `col_del`

```python
>>> M.col_del(0)
>>> M
⎡2  3⎤
⎢    ⎥
⎣0  4⎦
>>> M.row_del(1)
>>> M
[2  3]
```

To insert rows or columns, use `row_insert` and `col_insert`

```python
>>> M
[2  3]
>>> M = M.row_insert(1, Matrix([[0, 4]]))
>>> M
⎡2  3⎤
⎢    ⎥
⎣0  4⎦
>>> M = M.col_insert(0, Matrix([1, -2]))
>>> M
⎡1   2  3⎤
⎢        ⎥
⎣-2  0  4⎦
```

> ⚠️ Warning: deletion methods operate in place but insert methods do not. This means that the delete operations will modify the matrix object while the insert methods will keep the matrix the same and return a new one with the modification. For example
>
> ```python
> >>> M = Matrix([[1, 2, 3], [0, 1, 2]])
> >>> M.row_insert( Matrix([[5, 6, 7]]) )
> >>> M
> ⎡1  2  3⎤
> ⎢       ⎥
> ⎣0  1  2⎦
> ```

### Matrices in numpy

Sometimes we will need functions from `NumPy`, another python package used in mathematics (it stands for numerical python).
In that case, we'll need to use `matrix` (NumPy matrices) instead of `Matrix` (SymPy matrices). They work in a similar way, but NumPy matrices are not prepared for working with symbols.
A NumPy matrix can be created in a single line:

```python
M = matrix([[a11, a12, ... a1n], ... [am1, am2, ... amn]])
```

> 💡 It's also possible to use NumPy `array`s to work with matrices. However, they lack some methods included in the `matrix` class, such as the product using the operator `*`.

Matrices can be converted between numpy and sympy easily:

#### From SymPy to NumPy

```python
A = matrix(sympy_matrix).astype(float64)
```

> 👁️ Note: float64 is part of the numpy package

#### From NumPy to SymPy

```python
B = Matrix(numpy_array)
```

<br />
## Systems of linear equations
To solve systems of linear equations we will use the function `linsolve`. There are 3 different ways of using this function:

1. With all the equations in a list:

```python
linsolve( [eq1, eq2, ...], x1, x2, ... )
```

2. With the system matrix and the independent terms vector $Ax = b$

```python
linsolve( (A, b), (x1, x2 ... xn) )
```

3. With the augmented matrix $ M $

```python
linsolve( M, (x1, x2 ... xn) )
```

> 📝 Example:
> Solve the following system:
>
> $\begin{cases} x + y + z = 1 \\\ x + y + 2x = 3 \end{cases}$
>
> ```python
> >>> x, y, z = symbols('x y z')
> >>> eq1 = x + y + z - 1
> >>> eq2 = x + y + 2*z - 3
> >>> linsolve([eq1, eq2], (x, y, z))
> {(-y - 1, y, 2)}
> ```

\_ \_

> 💡 When solving systems with an infinite number of solutions, one may need to get the solution with some specific variables depending on others. These variables can be chosen by changing the order at the call of the solver function.
>
> Changing the order of the variables in the previous example will give the following solution:
>
> ```python
> >>> linsolve([eq1, eq2], (z, y, x))
> {(2, -x - 1, x)}
> ```

There are other functions like `LUsolve`, which uses the LU decomposition method to solve the equations.

<br />
## Linear maps
To work with linear maps we will also use the `Matrix` class from python.
### Special methods
* `nullspace()`: Returns a list of column vectors that span the nullspace of a matrix.
* `columnspace()`: Returns a list of column vectors that span the space generated by the columns of a matrix.

<br />
## Diagonalization
Diagonalization of matrices can be automated using `SymPy`'s `Matrix` class and the following functions:

-   `charpoly()`: Returns the characteristic polynomial of a matrix. The eigenvalues can be easily found by factorizing the polynomial with `factor()`.

```python
>>> A = Matrix([[1,-3,3],[3,-5,3],[6,-6,4]])
>>> p = A.charpoly()
>>> p
PurePoly(λ3−12λ−16,λ,domain=ℤ)
>>> p.factor()
(λ−4)(λ+2)2
```

-   `eigenvals()`: Returns a list of eigenvalues and corresponding multiplicities.

```python
>>> A.eigenvals()
{−2:2, 4:1}
```

-   `eigenvects()`: Returns a list of tuples with eigenvalues, multiplicity and the corresponding eigenvectors (in that order).

```python
>>> A.eigenvects()
```

Result: $ \left [ \left ( -2, 2\left [ \begin{bmatrix} 1 \\\ 1 \\\ 0 \end{bmatrix}, \begin{bmatrix} -1 \\\ 0 \\\ 1 \end{bmatrix} \right ] \right ), \left( 4, 1, \begin{bmatrix} 0.5 \\\ 0.5 \\\ 1 \end{bmatrix} \right ) \right ] $

-   `diagonalize()`: Returns the changes matrix and the diagonal matrix (in that order).

```python
>>> A.diagonalize()
```

Result: $\left ( \begin{bmatrix} 1 &-1 & 1 \\\ 1 & 0 & 1 \\\ 0 & 1 & 2 \end{bmatrix}, \begin{bmatrix} -2 & 0 & 0 \\\ 0 & -2 & 0  \\\ 0 & 0 & 4 \end{bmatrix} \right )$

> ⚠️ Warning: When using these functions, it's important to take some things into account in order to read properly the output.
>
> 1. Some of the matrices we will work with may have non-real eigenvalues or eigenvectors. In that case, the output will contain **complex numbers**. These numbers will contain the `SymPy` custom imaginary unit `I` instead of the built-in python unit `j` mentioned [above](#complex-numbers). However, it will not make any difference in future computations.
>
>     > 📝 Example:
>     >
>     > ```python
>     > >>> M = M = sp.Matrix([
>     > >>>     [3, -2],
>     > >>>     [4, -1]
>     > >>> ])
>     > >>> print(A.eigenvals())
>     > {1 - 2*I: 1, 1 + 2*I: 1}
>     > ```
>
> 2. Sometimes the output will be too large to be shown on screen and it will be displayed in **scientific notation** and will be noted used the letter `e`. For example, the number `2e20` is the same as $2·10^{20}$.
>
> 3. When working with small or large floating numbers, there could be **precission errors**. These errors can usually be spotted by taking a look at the result and looking for abnormally small numbers. For example, one of the computed eigenvalues of the matrix $ \begin{pmatrix} 1 & 2 & 3 \\\ 2 & 1 & 4 \\\ 3 & 4 & 1 \end{pmatrix} $ is `-3.18788259626475  - 1.e-124*I`, which is actually a real number. To "fix" these numbers we can use the function `re()` and get only the real part of the number.

<br />
## Orthogonality
In this topic we will need to work with **NumPy** and its `matrix` class.
Remember to correctly import it (including the `linalg` package):
```python
import numpy as np
from numpy.linalg import *
```
### Scalar product
The scalar product can be performed with the function `dot(u, v)`.
> 👁️ Note that this differs from the cross product, that can be computed using the function `cross(u, v)`.

### Norms

-   Vector norm: `norm(v, order)`
-   Norm: `norm(matrix, order)`
    The order can also be the infinity value `np.inf`.

### Orthogonalization of vectors
The function `GramSchmidt(list_of_vectors, normalize?)` is used to make vectors orthogonal between them. It takes as parameters a list of vectors and a boolean indicating whether or not return the vectors normalized. It uses the Gram Schmidt algorithm and returns the corrected vectors.

> 📝 Example:
> Apply the Gram Schmidt algorithm to the vectors $v_1 = (1, 0, 0)$, $v_2 = (0, 1, 1)$ and $v_3 = (1, 2, 1)$.
>
> ```
> >>> v1 = Matrix( [1, 0, 0] )
> >>> v2 = Matrix( [0, 1, 1] )
> >>> v3 = Matrix( [1, 2, 1] )
> >>> GramSchmidt( [v1, v2, v3], true )
> ```
>
> The output will be: $\left[ \begin{bmatrix} 1 \\\ 0 \\\ 0 \end{bmatrix}, \begin{bmatrix} 0 \\\ \frac{\sqrt{2}}{2} \\\ \frac{\sqrt{2}}{2} \end{bmatrix}, \begin{bmatrix} 0 \\\ \frac{\sqrt{2}}{2} \\\ -\frac{\sqrt{2}}{2} \end{bmatrix} \right]$

### Singular Value Decomposition

For the SVD we will use the function `svd(matrix)` from NumPy.

This functions takes as a parameter the matrix, and returns the U matrix, a list of singular values and the V matrix transposed.

> 📝 Example:
> Perform the Singular Value Decomposition to the matrix $ A = \begin{pmatrix} 1 & -3 \\\ 2 & 1 \\\ 1 & 6 \end{pmatrix}$
>
> ```python
> >>> A = np.matrix([[1,-3],[2,1],[1,6]])
> >>> U, valssing, Vt = svd(A)
> >>> # D is not square. We create first a matrix with zeros and then we add the singular values
> >>> D = np.zeros( (3,2) )
> >>> D[:2, :2] = np.diag(valssing)
> >>> U*D*Vt == A
> True
> ```

<Autors autors="raul"/>
