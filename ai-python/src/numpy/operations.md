# Operations with arrays

In this lesson, we will explore how to perform arithmetic and mathematical operations with NumPy arrays. We will see how to use basic operators, universal functions, and the concept of broadcasting to work efficiently with numerical data.

## Element-wise arithmetic operations

NumPy allows performing arithmetic operations directly on arrays. These operations are applied **element-wise** (component by component).

The usual arithmetic operators work with arrays:

```python
import numpy as np

a = np.array([1, 2, 3, 4])
b = np.array([10, 20, 30, 40])

print(a + b)  # [11 22 33 44]
print(a - b)  # [-9 -18 -27 -36]
print(a * b)  # [10 40 90 160]
print(a / b)  # [0.1 0.1 0.1 0.1]
print(a ** 2) # [1 4 9 16]
print(a % 3)  # [1 2 0 1]
```

When operating an array with a scalar, the operation is applied to all elements:

```python
a = np.array([1, 2, 3, 4])

print(a + 10)  # [11 12 13 14]
print(a * 2)   # [2 4 6 8]
print(a / 2)   # [0.5 1.  1.5 2. ]
print(a ** 2)  # [1 4 9 16]
```

## Broadcasting

**Broadcasting** is a mechanism that allows NumPy to operate with arrays of different shapes. It automatically "expands" the smaller arrays so that they have compatible shapes with the larger ones, without needing to copy data. These are the broadcasting rules:

NumPy compares the dimensions of the arrays from right to left:

1. If the arrays do not have the same number of dimensions, dimensions of size 1 are added to the left of the smaller array.
2. Dimensions are compatible if they are equal or if one of them is 1.
3. If any dimension is incompatible, an error occurs.

Here are some practical examples:

-   Broadcasting with a scalar:

    ```python
    a = np.array([[1, 2, 3],
                  [4, 5, 6]])
    print(a + 10)
    # [[11 12 13]
    #  [14 15 16]]
    ```

-   Broadcasting with a vector:

    ```python
    a = np.array([[1, 2, 3],
                  [4, 5, 6]])
    b = np.array([10, 20, 30])

    print(a + b)
    # [[11 22 33]
    #  [14 25 36]]
    ```

-   Broadcasting with arrays of different dimensions:

    ```python
    a = np.array([[1],
                  [2],
                  [3]])  # shape (3, 1)
    b = np.array([10, 20, 30])  # shape (3,)

    print(a + b)
    # [[11 21 31]
    #  [12 22 32]
    #  [13 23 33]]
    ```

## Universal mathematical functions

**Universal functions** are functions that operate element-wise on arrays, in a vectorized and efficient way.

Here is an example of trigonometric universal functions:

```python
angles = np.array([0, np.pi/6, np.pi/4, np.pi/3, np.pi/2])

print(np.sin(angles))  # [0.   0.5  0.707... 0.866... 1.]
print(np.cos(angles))  # [1.   0.866... 0.707... 0.5  0.]
print(np.tan(angles))  # [0.   0.577... 1.   1.732... 1.633e+16]
```

Other common mathematical functions include:

-   Inverse trigonometric functions: `np.arcsin()`, `np.arccos()`, `np.arctan()`.

-   Exponentials and logarithms: `np.exp()`, `np.log()`, `np.log10()`, `np.log2()`.

-   Rounding and absolute value: `np.abs()`, `np.floor()`, `np.ceil()`, `np.round()`.

-   Other useful functions: `np.sqrt()`, `np.square()`, `np.power()`, `np.sign()`.

## Comparison operations

Comparison operators return boolean arrays and work element-wise:

```python
a = np.array([1, 2, 3, 4, 5])
b = np.array([5, 4, 3, 2, 1])

print(a == b)  # [False False  True False False]
print(a < b)   # [ True  True False False False]
print(a >= 3)  # [False False  True  True  True]
```

These boolean arrays can be used for indexing:

```python
a = np.array([1, 2, 3, 4, 5])
print(a[a > 3])  # [4 5]
```

The functions `all()` and `any()` allow checking if all or some elements satisfy a condition:

```python
a = np.array([1, 2, 3, 4, 5])

print(np.all(a > 0))   # True (all are positive)
print(np.all(a > 3))   # False (not all are > 3)
print(np.any(a > 3))   # True (some are > 3)
print(np.any(a > 10))  # False (none are > 10)
```

These functions can also be applied along axes:

```python
a = np.array([[1, 2, 3],
              [0, 5, 6]])

print(np.all(a > 0, axis=0))  # [False  True  True]
print(np.any(a > 5, axis=1))  # [False  True]
```

<Authors authors="jpetit"/>