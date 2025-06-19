# Quadratic Forms and Extrema

## Quadratic forms

**Quadratic forms** in Python can be represented by an equation or a matrix.

$$q(x,y) = a x^2 + bxy + cy^2$$

and

$$
\begin{pmatrix}
a & b \\\
c & d
\end{pmatrix}
$$

```python
x, y = symbols('x y')
q1 = a*x**2 + b*x*y + c*y**2
q2 = Matrix([
    [  a, b/2],
    [b/2,   c]
])
```

### Signature

One way to get the signature of a quadratic form is to diagonalize its matrix and then check the sign of the values in the diagonal (the eigenvals).

> 📝 Example:
>
> Get the signature of the quadratic form $q(x_1, x_2, x_3, x_4, x_5) = -2x_1^2 + x_2^2 - \sqrt{2}x_4^2$
>
> ```python
> >>> x1, x2, x3, x4, x5 = symbols('x1:6')
> >>> q = -2*x1**2 + x2**2 - sqrt(2)*x4**2
> >>> Q = Matrix([
>         [-2, 0, 0,        0, 0],
>         [ 0, 1, 0,        0, 0],
>         [ 0, 0, 0,        0, 0],
>         [ 0, 0, 0, -sqrt(2), 0],
>         [ 0, 0, 0,        0, 0]
>     ])
> >>> Q.eigenvals()
> {-2: 1, 1: 1, 0: 2, -sqrt(2): 1} # 1 +, 2 - and 2 0s
> ```

<p></p>

> ⚠️ Warning: The diagonalization functions in SymPy can give results with precission issues. This means that sometimes the program will return as positive or negative an eigenvalue that is actually zero. It's suggested to have a function that checks when numbers are small enough to be considered zero and treat them like that.

### Definiteness

For forms in **two variables** $f(x,y) = ax^2 + 2bxy + cy^2$ we can use the **discriminant** of the quadratic form for characterizing definiteness. The discriminant of a quadratic form is the determinant of its matrix.

```python
M = Matrix( ... )       # Matrix of the quadratic form
discriminant = M.det()
```

## Extrema

### Gradient and Hessian

The **gradient** of a function $\nabla f$ is the vector of partial derivatives.

```python
x = symbols('x1 x2 ... xn')
grad = [f.diff(xi) for xi in x]
```

The **hessian** of a function $\boldsymbol{H}f$ is the following matrix

```python
varlist = symbols('x1 x2 ... xn')

# It can be done manually
hess = [[f.diff(x).diff(y) for x in varlist] for y in varlist]

# Or with a SymPy built-in function
hess = hessian(f, varlist)
```

### Getting critical points
$\boldsymbol{x} \in \Omega$ is a **critical point** of $f$ if $\nabla f (\boldsymbol{x}) = \boldsymbol{0}$. In python, **critical points** can be found solving the equation:

```python
varlist = symbols('x1 x2 ... xn')
grad = [f.diff(xi) for xi in x]
solve(grad, varlist, dict=True)
```

> 👁️ Note: the `dict=True` parameter in the `solve` function is not necessary. It will only make the function return the solutions in a list of dictionaries with the pair variable-value. It will make things easier to work with.

### Study of critical points
After finding all the critical points of a function, it's time to decide if there's any **local maximum or minimum** (or saddle point).

One way to decide is to follow the **Hessian criterion for extrema**, which consists in evaluating the signature if the Hessian matrix at each critical point. In Python, we will be using the `subs` function and the [computation of the signature](#signature).

```python
critical_points = solve(grad, varlist, dict=True)
for point in critical_points:
    hess_evaluated = hess.subs(point)
    # Get signature and decide
    # ...
```

## Constrained optimization

### Lagrangian formalism

The **Lagrangian function** $L(\boldsymbol{\lambda}, \boldsymbol{x})$ can be generated using a loop:

```python
x = symbols('x1 x2 ... xn')
f        # function to optimize
glist    # list of restrictions

L = f
for i in range(len(glist)):
    lamda = symbols('lamda'+i)
    L += glist[i]*lamda
```

> 👁️ Notice that `lamda` is misspelled (the name for $\lambda$ is "lambda"). That's not a typo. The word `lambda` is reserved by Python and it can't be used.

The second order sufficient conditions can be stated in terms of the **Lagrangian Hessian matrix** looking at its minor determinants. In Python we can check the condition by listing all the minor determinants.

```python
HL = hessian(L, varlist)
n, m = hess.shape
minor_dets = [HL[:i,:i].det() for i in range(1, n+1)]
# Check condition ...
```

> ⚠️ Warning: Here `varlist` includes the variables in the function and the variables used for creating the lagrangian with the restrictions ($\lambda_1, \lambda_2, ..., \lambda_m$)

## External links

-   [Tutorial: Linear Algebra (scipy.linalg)](https://docs.scipy.org/doc/scipy/reference/tutorial/linalg.html)
-   [Reference: Linear Algebra (scipy.linalg)](https://docs.scipy.org/doc/scipy/reference/linalg.html)
-   [Reference: Linear Algebra (numpy.linalg)](https://docs.scipy.org/doc/numpy/reference/routines.linalg.html)
-   [Reference: Matrices (sympy)](https://docs.sympy.org/latest/modules/matrices/index.html)
-   [Reference: Solvers (sympy)](https://docs.sympy.org/latest/modules/solvers/solvers.html)

<Autors autors="raul"/>
