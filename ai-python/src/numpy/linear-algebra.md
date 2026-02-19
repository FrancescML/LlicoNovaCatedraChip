# Linear Algebra

This lesson covers the basic operations of linear algebra using NumPy.

## Matrix Product

The **matrix product** is one of the fundamental operations. In NumPy, there are two ways to perform it:

-   The function `numpy.dot()` (or the `.dot()` method of an array). Although it can perform dot products and matrix-vector products, its main use for matrix multiplication has been replaced.

-   The `@` operator is the preferred and clearer way to indicate matrix multiplication.

Example:

```python
import numpy as np

A = np.array([[1, 2], [3, 4]])
B = np.array([[5, 6], [7, 8]])

# Using the @ operator (Recommended)
C_at = A @ B
print("A @ B:\n", C_at)

# Using np.dot()
C_dot = np.dot(A, B)
print("np.dot(A, B):\n", C_dot)
```

**Note:** For element-wise multiplication, use the standard multiplication operator `*`.

## Determinant and Rank of Matrices

These operations are performed using functions from the `numpy.linalg` submodule.

The **determinant** of a square matrix is calculated with `numpy.linalg.det()`.

```python
A = np.array([[4, 6], [3, 8]])
det_A = np.linalg.det(A)
print("Determinant of A:", det_A) # 4*8 - 6*3 = 32 - 18 = 14
```

The **rank** of a matrix is the dimension of the column space (or row space), which equals the number of nonzero singular values. It is calculated with `numpy.linalg.matrix_rank()`.

```python
B = np.array([[1, 2, 3], [4, 5, 6], [7, 8, 9]])
rank_B = np.linalg.matrix_rank(B)
print("Rank of B:", rank_B) # This matrix is singular (rank 2)
```

## Matrix Inverse

The **inverse** of a square matrix is calculated with `numpy.linalg.inv()`. If the matrix is singular (zero determinant), the function will raise a `LinAlgError` exception.

```python
A = np.array([[1, 2], [3, 4]])
A_inverse = np.linalg.inv(A)
print("Inverse of A:\n", A_inverse)

# Check: A @ A_inverse should be the identity matrix
identity = A @ A_inverse
print("A @ A_inverse:\n", identity)
```

## Eigenvalues and Eigenvectors

The function `numpy.linalg.eig()` returns a tuple with:

1.  An array of eigenvalues.
2.  A matrix whose columns are the corresponding eigenvectors.

```python
M = np.array([[2, -1], [4, -3]])
eigenvalues, eigenvectors = np.linalg.eig(M)

print("Eigenvalues:", eigenvalues)
print("Eigenvectors (columns):\n", eigenvectors)
```

## Decompositions: SVD, QR, LU

NumPy supports several **fundamental matrix decompositions** in numerical analysis:

-   **SVD (Singular Value Decomposition):** Calculated with `numpy.linalg.svd()`. It decomposes a matrix $A$ into $U \Sigma V^T$. It is an essential tool in data compression and statistics.
-   **QR:** Calculated with `numpy.linalg.qr()`. It decomposes a matrix $A$ into a product of an orthogonal matrix $Q$ and an upper triangular matrix $R$.
-   **LU (or Cholesky Decomposition for positive definite matrices):** LU decomposition is done with `scipy.linalg.lu` (requires SciPy), but NumPy has `numpy.linalg.cholesky()` for symmetric and positive definite matrices, decomposing $A = L L^T$.

**Example (SVD):**

```python
A = np.array([[1, 1], [0, 1], [1, 0]])
U, S, Vh = np.linalg.svd(A)

print("Matrix U:\n", U)
print("Singular values (S):\n", S)
print("Matrix Vh (conjugate transpose of V):\n", Vh)
```

---

## Solving Systems of Linear Equations

To solve a system of linear equations of the form $A x = b$, where $A$ is the coefficient matrix, $x$ is the vector of unknowns, and $b$ is the vector of constants, use the function `numpy.linalg.solve()`.

This function is generally more **efficient** and numerically **stable** than calculating the inverse ($x = A^{-1} b$).

For example, consider the following system of equations:

$$
\begin{cases}
2x + 3y = 8 \\
x - 2y = -3
\end{cases}
$$

This problem can be solved with NumPy as follows:

```python
# Coefficient matrix (A)
A = np.array([[2, 3], [1, -2]])
# Constants vector (b)
b = np.array([8, -3])

# Solve A x = b
x = np.linalg.solve(A, b)

print("The solution (x, y) is:", x)
# The solution is (1.0, 2.0)
```

<Authors authors="jpetit"/>