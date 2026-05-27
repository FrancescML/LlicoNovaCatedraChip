# Series and DataFrames

This lesson introduces the fundamental data structures of Pandas, explaining what Series and DataFrames are and how to create, index, and perform basic operations on them. It also provides code examples and details attributes, conversions between Series and DataFrame, and techniques to manipulate and analyze tabular data.

## Series

A **Series** is a one-dimensional data structure similar to an array or a list, but with labels associated with each element. It is the basic structure of Pandas and can contain any data type.

A Series can be created in several ways:

```python
import pandas as pd

# From a list
s1 = pd.Series([10, 20, 30, 40])

# From a dictionary
s2 = pd.Series({'a': 10, 'b': 20, 'c': 30})

# Specifying the index explicitly
s3 = pd.Series([10, 20, 30], index=['x', 'y', 'z'])

# With a constant value
s4 = pd.Series(5, index=[0, 1, 2, 3])
```

If an index is not specified, Pandas automatically assigns consecutive integers starting from 0.

The index of a Series provides labels that allow access to elements in various ways:

```python
s = pd.Series([10, 20, 30, 40], index=['a', 'b', 'c', 'd'])

# Access by label
print(s['b'])  # 20

# Access by position
print(s[1])  # 20

# Multiple access
print(s[['a', 'c']])  # Series with elements 'a' and 'c'

# Slicing by labels (inclusive)
print(s['a':'c'])  # Elements from 'a' to 'c' included

# Slicing by positions (exclusive)
print(s[0:2])  # Elements at positions 0 to 1
```

Labels allow more readable and less error-prone access than numeric indices.

Series support arithmetic, statistical, and filtering operations:

```python
s = pd.Series([10, 20, 30, 40], index=['a', 'b', 'c', 'd'])

# Arithmetic operations (element-wise)
print(s + 5)      # Add 5 to each element
print(s * 2)      # Multiply each element by 2
print(s ** 2)     # Square each element

# Operations between Series (alignment by index)
s2 = pd.Series([1, 2, 3], index=['a', 'b', 'e'])
print(s + s2)     # Sum only where labels match

# Statistical functions
print(s.sum())    # Sum of all elements
print(s.mean())   # Mean
print(s.max())    # Maximum value
print(s.min())    # Minimum value
print(s.std())    # Standard deviation

# Filtering
print(s[s > 20])  # Elements greater than 20
```

## DataFrames

A **DataFrame** is a two-dimensional data structure similar to a table or spreadsheet, with labeled rows and columns. It is the most used structure in Pandas for working with tabular data.

DataFrames can be created in several ways:

```python
import pandas as pd

# From a dictionary of lists
df1 = pd.DataFrame({
    'name': ['Anna', 'Bernat', 'Carla'],
    'age': [25, 30, 22],
    'city': ['Barcelona', 'Girona', 'Tarragona']
})

# From a list of dictionaries
df2 = pd.DataFrame([
    {'name': 'Anna', 'age': 25},
    {'name': 'Bernat', 'age': 30},
    {'name': 'Carla', 'age': 22}
])

# From a two-dimensional array
import numpy as np
df3 = pd.DataFrame(
    np.array([[1, 2], [3, 4], [5, 6]]),
    columns=['A', 'B'],
    index=['x', 'y', 'z']
)

# From a CSV file
df4 = pd.read_csv('data.csv')
```

A DataFrame has three main components:

-   **Index**: row labels
-   **Columns**: column labels
-   **Values**: data as a two-dimensional array

```python
df = pd.DataFrame({
    'name': ['Anna', 'Bernat', 'Carla'],
    'age': [25, 30, 22]
}, index=['x', 'y', 'z'])

print(df.index)     # Index(['x', 'y', 'z'])
print(df.columns)   # Index(['name', 'age'])
print(df.values)    # Two-dimensional numpy array
```

The most used attributes provide information about the structure of the DataFrame:

```python
df = pd.DataFrame({
    'A': [1, 2, 3],
    'B': [4.5, 5.5, 6.5],
    'C': ['x', 'y', 'z']
})

# Dimensions of the DataFrame (rows, columns)
print(df.shape)  # (3, 3)

# Data types of each column
print(df.dtypes)
# A      int64
# B    float64
# C     object

# Column names
print(df.columns)  # Index(['A', 'B', 'C'])

# Row index
print(df.index)  # RangeIndex(start=0, stop=3, step=1)

# Number of rows
print(len(df))  # 3

# General information
df.info()  # Summary with types and memory usage
```

## Differences and conversions between Series and DataFrames

Series and DataFrames are related but have key differences:

| Feature       | Series               | DataFrame                  |
| ------------- | -------------------- | -------------------------- |
| Dimensions    | 1D                   | 2D                         |
| Structure     | Labeled vector       | Table with rows and columns |
| Columns       | None                 | Multiple columns           |
| Typical use   | Data of a single variable | Complete dataset          |

It is easy to convert between both structures:

```python
# Series to DataFrame
s = pd.Series([10, 20, 30], index=['a', 'b', 'c'], name='values')
df = s.to_frame()  # DataFrame with one column
# or
df = pd.DataFrame(s)

# DataFrame to Series (selecting one column)
df = pd.DataFrame({'A': [1, 2, 3], 'B': [4, 5, 6]})
s = df['A']  # Returns a Series

# DataFrame to Series (if it has only one column)
df_one_column = pd.DataFrame({'A': [1, 2, 3]})
s = df_one_column.squeeze()  # Converts to Series
```

Each column of a DataFrame is internally a Series, sharing many common operations and methods.

<Authors authors="jpetit"/>