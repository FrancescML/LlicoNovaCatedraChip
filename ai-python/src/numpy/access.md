# Arrays: Access

In this lesson, we will learn how to access and manipulate elements within a NumPy array using different indexing and slicing techniques.

## Basic Indexing

Indexing one-dimensional arrays in NumPy works the same way as with Python lists: indices start at 0 and negative indices can be used to access elements from the end.

```python
import numpy as np

a = np.array([10, 20, 30, 40, 50])
print(a[0])    # 10
print(a[2])    # 30
print(a[-1])   # 50
print(a[-2])   # 40
```

To access elements of multidimensional arrays, multiple indices separated by commas are used. Each index corresponds to a dimension of the array.

```python
b = np.array([[1, 2, 3],
              [4, 5, 6],
              [7, 8, 9]])

print(b[0, 0])    # 1
print(b[1, 2])    # 6
print(b[2, 1])    # 8
print(b[-1, -1])  # 9
```

You can also access progressively:

```python
print(b[1])       # [4 5 6] (second row)
print(b[1][2])    # 6 (equivalent to b[1, 2])
```

## Slicing

_Slicing_ allows selecting subsets of arrays. As with lists, the syntax is `start:stop:step` and can be applied independently to each dimension.

```python
a = np.array([0, 1, 2, 3, 4, 5, 6, 7, 8, 9])

print(a[2:7])      # [2 3 4 5 6]
print(a[::2])      # [0 2 4 6 8]
print(a[1:8:2])    # [1 3 5 7]
print(a[:5])       # [0 1 2 3 4]
print(a[5:])       # [5 6 7 8 9]
```

In multidimensional arrays, each dimension can be sliced independently:

```python
b = np.array([[1, 2, 3, 4],
              [5, 6, 7, 8],
              [9, 10, 11, 12]])

print(b[0:2, 1:3])   # [[2 3]
                     #  [6 7]]

print(b[:, 2])       # [ 3  7 11] (third column)
print(b[1, :])       # [5 6 7 8] (second row)
print(b[:2, ::2])    # [[1 3]
                     #  [5 7]]
```

Be careful! Unlike Python lists, slicing in NumPy **does not create copies** but **views** of the original array. This means modifying the view also modifies the original array.

```python
a = np.array([1, 2, 3, 4, 5])
b = a[1:4]         # b is a view, not a copy
b[0] = 99
print(a)           # [ 1 99  3  4  5] (the original has changed!)
```

To get an independent copy, use the `copy()` method:

```python
a = np.array([1, 2, 3, 4, 5])
b = a[1:4].copy()  # b is a copy
b[0] = 99
print(a)           # [1 2 3 4 5] (the original does not change)
```

## Boolean Indexing (Masks)

Boolean masks allow selecting elements that satisfy a condition. A boolean array with the same shape as the original array is created, where `True` indicates the elements to select.

```python
a = np.array([10, 15, 20, 25, 30])

mask = a > 18
print(mask)           # [False False  True  True  True]
print(a[mask])        # [20 25 30]

# Directly:
print(a[a > 18])         # [20 25 30]
print(a[a % 2 == 0])     # [10 20 30]
```

Multiple conditions can be combined with the operators `&` (and), `|` (or), and `~` (not):

```python
a = np.array([5, 12, 18, 23, 30, 45])

print(a[(a > 10) & (a < 25)])   # [12 18 23]
print(a[(a < 10) | (a > 40)])   # [ 5 45]
print(a[~(a % 3 == 0)])         # [ 5 23]
```

Masks also work with multidimensional arrays:

```python
b = np.array([[1, 2, 3],
              [4, 5, 6],
              [7, 8, 9]])

print(b[b > 5])          # [6 7 8 9] (one-dimensional array)
b[b % 2 == 0] = 0        # modifies even elements
print(b)                 # [[1 0 3]
                         #  [0 5 0]
                         #  [7 0 9]]
```

## Advanced Indexing with Integer Arrays

Integer arrays can be used to select elements at specific positions. This always returns a **copy**, not a view.

```python
a = np.array([10, 20, 30, 40, 50])

indices = np.array([0, 2, 4])
print(a[indices])         # [10 30 50]

print(a[[1, 3, 1]])      # [20 40 20]
```

In multidimensional arrays, you can specify an index array for each dimension:

```python
b = np.array([[1, 2, 3],
              [4, 5, 6],
              [7, 8, 9]])

rows = np.array([0, 1, 2])
columns = np.array([2, 1, 0])
print(b[rows, columns])    # [3 5 7]

# Select complete rows:
print(b[[0, 2]])           # [[1 2 3]
                           #  [7 8 9]]
```

## The `where()` Function

The function `np.where()` has two main uses:

-   **Find indices** where a condition is met:

    ```python
    a = np.array([10, 25, 30, 15, 40])

    indices = np.where(a > 20)
    print(indices)            # (array([1, 2, 4]),)
    print(a[indices])         # [25 30 40]
    ```

-   **Conditional selection** between two values (equivalent to a ternary operator):

    ```python
    a = np.array([1, 2, 3, 4, 5])

    # where a > 2, return a*10, otherwise return 0
    result = np.where(a > 2, a * 10, 0)
    print(result)          # [ 0  0 30 40 50]

    # Classify elements:
    b = np.array([-2, 5, 0, -8, 3])
    classification = np.where(b > 0, 'positive',
                            np.where(b < 0, 'negative', 'zero'))
    print(classification)     # ['negative' 'positive' 'zero' 'negative' 'positive']
    ```

In multidimensional arrays, `where()` returns a tuple of arrays with the indices for each dimension:

```python
b = np.array([[1, 2, 3],
              [4, 5, 6],
              [7, 8, 9]])

rows, columns = np.where(b > 5)
print(rows)              # [1 2 2 2]
print(columns)           # [2 0 1 2]
print(b[rows, columns])  # [6 7 8 9]
```

<Authors authors="jpetit"/>