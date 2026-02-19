# Introduction to NumPy

<img src='./numpy.svg' style='height: 8em; float: right; margin: 2em 0em 0em 2em;' />

NumPy (Numerical Python) is a fundamental library for scientific computing in Python. The great advantage of NumPy is that it allows performing mathematical operations on multidimensional arrays extremely quickly thanks to its implementation in C and the elimination of explicit loops.

NumPy is essential for any programmer working with numerical data, as it offers:

-   Efficient data structures to store and manipulate numerical data.
-   Optimized mathematical functions for vector operations.
-   Tools for linear algebra, Fourier transforms, and random number generation.
-   Interoperability with other scientific libraries such as Pandas, SciPy, Matplotlib, and scikit-learn.

NumPy is widely used in fields such as machine learning, data science, signal processing, and scientific simulation. This lesson introduces the basic concepts of NumPy.

## Installation and Import

To install NumPy, we use the pip package manager:

```bash
python3 -m pip install numpy
```

Once installed, we can import NumPy in our programs. The standard convention is to import it with the alias `np`:

```python
>>> import numpy as np
>>> np.__version__
'2.3.5'
```

## Differences Between Python Lists and NumPy Arrays

Although Python lists are very versatile, NumPy arrays offer significant advantages for numerical operations. A **NumPy array** is a multidimensional data structure that stores elements of the same type efficiently.

**Homogeneous data types:** Generally, Python lists can contain elements of different types, whereas NumPy arrays always store elements of the same type:

```python
# Python list: heterogeneous types
python_list = [1, 2.5, "text", True]

# NumPy array: homogeneous type
numpy_array = np.array([1, 2, 3, 4])
print(numpy_array.dtype)  # dtype('int64')
```

**Element-wise operations:**
Operations with Python lists require explicit loops, while NumPy allows vectorized operations:

```python
# Python lists
list1 = [1, 2, 3, 4]
list2 = [5, 6, 7, 8]
list_result = [list1[i] + list2[i] for i in range(len(list1))]

# NumPy arrays
array1 = np.array([1, 2, 3, 4])
array2 = np.array([5, 6, 7, 8])
array_result = array1 + array2
print(array_result)  # [6 8 10 12]
```

**Dimensions and shape:** NumPy arrays have properties like `shape` and `ndim` that facilitate working with multidimensional data:

```python
matrix = np.array([[1, 2, 3], [4, 5, 6]])
print(matrix.shape)  # (2, 3)
print(matrix.ndim)   # 2
```

## Performance Advantages

Vectorization is one of NumPy's most powerful features. It allows applying operations to entire arrays without the need for explicit loops, resulting in cleaner and significantly faster code.

Let's see an example comparing execution time between Python lists and NumPy arrays:

```python
import numpy as np
import time

# Create data
size = 10_000_000
list1 = list(range(size))
list2 = list(range(size))
array1 = np.arange(size)        # like range but returns a NumPy array
array2 = np.arange(size)

# Sum with lists
start = time.time()
list_result = [list1[i] + list2[i] for i in range(size)]
list_time = time.time() - start

# Sum with NumPy
start = time.time()
array_result = array1 + array2
numpy_time = time.time() - start

print(f"List time: {list_time:.4f} seconds")
print(f"NumPy time: {numpy_time:.4f} seconds")
print(f"NumPy is {list_time/numpy_time:.1f}x faster")
```

On my computer, running this code produces results similar to these:

```text
List time: 0.3046 seconds
NumPy time: 0.0077 seconds
NumPy is 39.4x faster
```

A 40-fold performance increase is quite impressive!

NumPy achieves this superior performance thanks to several factors:

-   Operations are implemented in C instead of Python, reducing execution overhead.
-   It uses vectorization to leverage SIMD instructions of the processor.
-   It stores data contiguously in memory.
-   It avoids the overhead of Python loops.

To extract maximum performance, it is important to take advantage of vectorized operations and avoid explicit loops whenever possible.

## Vectorized Operations

NumPy allows writing complex mathematical operations elegantly and compactly using **vectorized operations**:

```python
# Arithmetic operations
x = np.array([1, 2, 3, 4, 5])
print(x * 2)          # [2 4 6 8 10]
print(x ** 2)         # [1 4 9 16 25]
print(np.sqrt(x))     # [1. 1.41421356 1.73205081 2. 2.23606798]

# Conditional operations
temperatures = np.array([15, 22, 18, 30, 25])
hot_days = temperatures > 20
print(hot_days)  # [False True False True True]
```

As we see, vectorized operations allow applying functions and operations to the entire array at once, making the code more readable and efficient.

## Broadcasting

NumPy also implements _broadcasting_, a feature that allows operating with arrays of different shapes:

```python
# Adding a scalar to an array
array = np.array([1, 2, 3, 4])
print(array + 10)  # [11 12 13 14]

# Operation between arrays of different dimensions
matrix = np.array([[1, 2, 3], [4, 5, 6]])
vector = np.array([10, 20, 30])
print(matrix + vector)
# [[11 22 33]
#  [14 25 36]]
```

The combination of vectorization, optimized operations, and broadcasting makes NumPy indispensable for any work with numerical data in Python.

The following lessons delve deeper into NumPy functionalities, including array creation and manipulation, advanced operations, linear algebra, and much more.

<Authors authors="jpetit"/>