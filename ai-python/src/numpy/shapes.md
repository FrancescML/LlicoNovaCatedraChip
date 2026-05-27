# Manipulating Shapes and Dimensions

NumPy provides several functions to manipulate the shape and dimensions of arrays without modifying the underlying data.

## Reshaping

The `reshape()` function allows changing the shape of an array while keeping the same number of elements:

```python
import numpy as np

a = np.arange(12)
print(a)  # [ 0  1  2  3  4  5  6  7  8  9 10 11]

b = a.reshape(3, 4)
print(b)
# [[ 0  1  2  3]
#  [ 4  5  6  7]
#  [ 8  9 10 11]]

c = a.reshape(2, 2, 3)
print(c.shape)  # (2, 2, 3)
```

We can use `-1` to indicate that NumPy should automatically calculate one dimension:

```python
d = a.reshape(3, -1)  # 3 rows, automatic columns
print(d.shape)  # (3, 4)
```

The functions `ravel()` and `flatten()` convert a multidimensional array into a one-dimensional array. The first returns a view, while the second returns a copy:

```python
e = b.ravel()    # returns a view
f = b.flatten()  # returns a copy

print(e)  # [ 0  1  2  3  4  5  6  7  8  9 10 11]
```

## Transposing Arrays

Transposition swaps rows and columns:

```python
a = np.array([[1, 2, 3], [4, 5, 6]])
print(a.T)
# [[1 4]
#  [2 5]
#  [3 6]]
```

`a.transpose()` is equivalent to `a.T` and allows specifying the order of axes:

```python
c = np.arange(24).reshape(2, 3, 4)
d = c.transpose(1, 0, 2)  # swaps the first two axes
print(d.shape)  # (3, 2, 4)
```

## Adding and Removing Dimensions

`np.newaxis` adds a new dimension of size 1:

```python
a = np.array([1, 2, 3, 4])
print(a.shape)  # (4,)

b = a[np.newaxis, :]  # adds dimension at the beginning
print(b.shape)  # (1, 4)

c = a[:, np.newaxis]  # adds dimension at the end
print(c.shape)  # (4, 1)
```

`expand_dims()` is a more explicit alternative:

```python
d = np.expand_dims(a, axis=0)  # (1, 4)
e = np.expand_dims(a, axis=1)  # (4, 1)
```

`squeeze()` removes dimensions of size 1:

```python
f = np.array([[[1], [2], [3]]])
print(f.shape)  # (1, 3, 1)

g = f.squeeze()
print(g.shape)  # (3,)
```

## Concatenation and Stacking

`concatenate()` joins arrays along an existing axis:

```python
a = np.array([[1, 2], [3, 4]])
b = np.array([[5, 6]])

c = np.concatenate([a, b], axis=0)
print(c)
# [[1 2]
#  [3 4]
#  [5 6]]
```

`vstack()` and `hstack()` are shortcuts for vertical and horizontal stacking:

```python
d = np.vstack([a, b])  # equivalent to concatenate with axis=0
e = np.hstack([a, a])  # stacks horizontally
print(e)
# [[1 2 1 2]
#  [3 4 3 4]]
```

`stack()` creates a new dimension:

```python
f = np.stack([a, a], axis=0)
print(f.shape)  # (2, 2, 2)

g = np.stack([a, a], axis=2)
print(g.shape)  # (2, 2, 2)
```

## Splitting Arrays

`split()` divides an array into multiple subsets:

```python
a = np.arange(12).reshape(3, 4)

# Split into 3 equal parts along axis 0
parts = np.split(a, 3, axis=0)
print(len(parts))  # 3
print(parts[0])    # [[0 1 2 3]]

# Split at specific positions
parts2 = np.split(a, [1, 3], axis=1)
print(parts2[0].shape)  # (3, 1)
print(parts2[1].shape)  # (3, 2)
```

`hsplit()` and `vsplit()` are shortcuts for horizontal and vertical splitting:

```python
h1, h2 = np.hsplit(a, 2)  # split into 2 parts horizontally
print(h1.shape)  # (3, 2)

v1, v2, v3 = np.vsplit(a, 3)  # split into 3 parts vertically
print(v1.shape)  # (1, 4)
```

<Authors authors="jpetit"/>