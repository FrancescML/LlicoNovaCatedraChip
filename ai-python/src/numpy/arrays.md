# Arrays: creation and properties

A **NumPy array** is a multidimensional data structure that efficiently stores elements of the same type. In this lesson, we will explore how to create arrays and their basic properties.

## Creating arrays

**From lists and tuples:** The most direct way to create an array is to convert a list or tuple with the `array()` function:

```python
import numpy as np

# One-dimensional array
a = np.array([1, 2, 3, 4, 5])
print(a)  # [1 2 3 4 5]

# Two-dimensional array (matrix)
m = np.array([[1, 2, 3], [4, 5, 6]])
print(m)
# [[1 2 3]
#  [4 5 6]]

# From a tuple
t = np.array((10, 20, 30))
print(t)  # [10 20 30]
```

NumPy automatically infers the data type (`dtype`), but it can be specified explicitly:

```python
# Integer array
a = np.array([1, 2, 3], dtype=int)

# Float array
b = np.array([1, 2, 3], dtype=float)
print(b)  # [1. 2. 3.]
```

**Creation functions: `zeros()`, `ones()`, `empty()`, `full()`:** NumPy provides functions to create arrays with predefined values:

```python
# Array of zeros
z = np.zeros(5)
print(z)  # [0. 0. 0. 0. 0.]

# Zero matrix
m = np.zeros((3, 4))  # 3 rows, 4 columns
print(m.shape)  # (3, 4)

# Array of ones
u = np.ones((2, 3))
print(u)
# [[1. 1. 1.]
#  [1. 1. 1.]]

# Empty array (uninitialized, faster)
e = np.empty(4)  # Contains arbitrary values

# Array with a constant value
f = np.full((2, 2), 7)
print(f)
# [[7 7]
#  [7 7]]

# Array with a specific value and type
g = np.full(3, 3.14, dtype=float)
print(g)  # [3.14 3.14 3.14]
```

**Generating sequences with `arange` and `linspace`:** To create sequences of numbers, NumPy offers more powerful alternatives than `range`:

```python
# arange(start, stop, step) - similar to range()
a = np.arange(0, 10, 2)
print(a)  # [0 2 4 6 8]

# Works with floats
b = np.arange(0, 1, 0.1)
print(b)  # [0.0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9]

# linspace(start, stop, num) - num equally spaced points
c = np.linspace(0, 10, 5)
print(c)  # [0.0 2.5  5.0 7.5 10.0]

# linspace includes the stop value by default
d = np.linspace(0, 1, 11)  # Useful for dividing into intervals
```

**Random arrays:** The `numpy.random` module allows generating arrays with random values:

```python
# Uniform random numbers between 0 and 1
a = np.random.random(5)
print(a)  # Example: [0.234 0.891 0.456 0.123 0.789]

# Random matrix
m = np.random.random((3, 3))

# Random integers in a range
b = np.random.randint(0, 10, size=5)
print(b)  # Example: [3 7 1 9 2]

# Normal distribution (mean=0, std=1)
c = np.random.randn(5)
print(c)  # Example: [-0.234 1.456 -0.891 0.123 0.567]

# Normal distribution with custom parameters
d = np.random.normal(loc=10, scale=2, size=5)  # mean=10, std=2

# Random sample from a list
e = np.random.choice([10, 20, 30, 40], size=3)
print(e)  # Example: [30 10 30]

# Shuffle an array
arr = np.arange(10)
np.random.shuffle(arr)
print(arr)  # Example: [3 7 1 9 4 0 2 8 5 6]
```

## Basic properties of arrays

Once a NumPy array is created, we can query various properties that describe its structure and content. Consider the following array:

```python
a = np.array([[1, 2, 3, 4], [5, 6, 7, 8]])
```

Then, these are the most important properties:

-   **`shape`**: A tuple indicating the dimensions of the array. For a matrix, it specifies the number of rows and columns.

    ```python
    a.shape  # (2, 4)
    ```

-   **`ndim`**: The number of dimensions (axes) of the array. A vector has 1 dimension, a matrix has 2, etc.

    ```python
    a.ndim  # 2
    ```

-   **`size`**: The total number of elements in the array, equivalent to the product of the dimensions.

    ```python
    a.size  # 8
    ```

-   **`dtype`**: The data type of the elements in the array. All elements have the same type.

    ```python
    a.dtype  # dtype('int64')
    ```

These properties are read-only (except `shape` in some cases) and allow understanding the structure and characteristics of the arrays we work with.

<Authors authors="jpetit"/>