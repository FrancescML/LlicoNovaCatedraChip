# Best Practices and Optimization

Despite NumPy's ease of use, it is important to know certain best practices to make the most of its performance and write efficient and readable code.

## Vectorization: the key to performance

Vectorization consists of applying operations over entire arrays instead of using explicit loops. This is the main difference between fast and slow code with NumPy.

```python
import numpy as np

# Bad: using loops
a = np.arange(1000000)
result = np.zeros(1000000)
for i in range(len(a)):
    result[i] = a[i] ** 2

# Good: vectorization
result = a ** 2
```

The vectorized version is tens of times faster because the operations run in optimized C code instead of interpreting Python for each iteration.

## Avoid unnecessary copies

NumPy allows working with views of the original arrays, which saves memory and copying time.

```python
# Creating a view (not a copy)
a = np.arange(10)
b = a[2:7]  # b is a view of a
b[0] = 999  # also modifies a

# Explicit copy when needed
c = a[2:7].copy()
c[0] = 111  # does not modify a
```

It is important to know when you are working with views to avoid unwanted modifications of the original array.

## Correct use of broadcasting

Broadcasting allows operating with arrays of different dimensions without explicitly replicating data.

```python
# Automatic broadcasting
matrix = np.array([[1, 2, 3],
                   [4, 5, 6],
                   [7, 8, 9]])
vector = np.array([10, 20, 30])

# Column-wise addition without loops
result = matrix + vector  # vector is applied to each row
```

Broadcasting saves memory and improves performance because there is no need to create temporary copies of the data.

## Choosing the appropriate data type

Using the minimal necessary data type reduces memory usage and can speed up operations.

```python
# Default: float64 and int64 (8 bytes)
a = np.array([1, 2, 3])  # int64

# Optimization: use smaller types when possible
b = np.array([1, 2, 3], dtype=np.int8)  # 1 byte
c = np.linspace(0, 1, 100, dtype=np.float32)  # 4 bytes
```

This is especially relevant when working with large volumes of data.

## Preallocating arrays

When the final size of an array is known, it is better to preallocate it than to keep appending elements.

```python
# Bad: appending elements
result = np.array([])
for i in range(1000):
    result = np.append(result, i ** 2)  # very inefficient

# Good: preallocation
result = np.empty(1000)
for i in range(1000):
    result[i] = i ** 2

# Better: full vectorization
result = np.arange(1000) ** 2
```

Each call to `np.append` creates a new copy of the array, resulting in quadratic performance.

## Universal functions (ufuncs)

NumPy's universal functions are optimized and preferable to equivalent Python functions.

```python
import math

a = np.random.rand(1000000)

# Slow: Python function
result = np.array([math.sqrt(x) for x in a])

# Fast: NumPy ufunc
result = np.sqrt(a)
```

Ufuncs also support element-wise operations transparently.

## _In-place_ operations

When the original array does not need to be preserved, _in-place_ operations save memory.

```python
a = np.random.rand(1000000)

# Creates a new array
b = a * 2

# _In-place_ operation (modifies a directly)
a *= 2
```

_In-place_ operations are especially useful with large arrays.

## Using aggregate functions with axis

Aggregate functions allow specifying the axis over which to operate, avoiding manual loops.

```python
matrix = np.random.rand(1000, 1000)

# Sum by columns
col_sums = np.sum(matrix, axis=0)

# Sum by rows
row_sums = np.sum(matrix, axis=1)

# Global mean
mean = np.mean(matrix)
```

Correct use of the `axis` parameter makes the code clearer and more efficient.

## Calculations with boolean masks

Boolean masks allow selecting and operating on subsets of arrays efficiently.

```python
a = np.array([1, -2, 3, -4, 5, -6])

# Selection with mask
positives = a[a > 0]

# Conditional modification
a[a < 0] = 0  # set negatives to zero

# Counting elements
num_positives = np.sum(a > 0)
```

This is much more efficient than iterating with loops and conditionals.

## Measuring performance

It is important to measure performance to identify bottlenecks.

```python
import time

a = np.random.rand(10000000)

start = time.time()
result = np.sqrt(a)
end = time.time()
print(f"Time: {end - start:.4f} seconds")
```

Systematic measurement of execution time helps validate optimizations.

## Final considerations

Here are some general recommendations for writing code with NumPy:

-   Prioritize vectorization over explicit loops
-   Know the difference between views and copies
-   Use data types appropriate to the needs
-   Take advantage of broadcasting to simplify code
-   Preallocate arrays when possible
-   Use NumPy universal functions

Following these practices allows writing NumPy code that is both efficient and maintainable.

<Autors autors="jpetit"/>