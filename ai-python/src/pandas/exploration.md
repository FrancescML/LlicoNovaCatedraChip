# Data Exploration

This lesson explains how to explore and inspect data in a Pandas DataFrame. It presents methods to obtain structural information, descriptive statistics, and techniques to select and filter data.

## Basic Inspection Methods

The `head()`, `tail()`, and `sample()` methods allow viewing subsets of data from a DataFrame.

```python
import pandas as pd

df = pd.DataFrame({
    'name': ['Anna', 'Bernat', 'Carla', 'David', 'Eva'],
    'age': [25, 30, 22, 35, 28],
    'city': ['Barcelona', 'Girona', 'Lleida', 'Tarragona', 'Barcelona']
})

print(df.head(3))   # Shows the first rows (default 5)
print(df.tail(2))   # Shows the last rows
print(df.sample(2)) # Shows random rows
```

The `head()` method returns the first n rows, `tail()` the last ones, and `sample()` a random sample. They are useful for a quick inspection of the content.

The `info()` and `describe()` methods provide summaries of the DataFrame.

```python
df.info()               # Information about the DataFrame structure
print(df.describe())    # Descriptive statistics of numeric columns
```

The `info()` method shows the number of rows, columns, data types, and memory usage. The `describe()` method calculates statistics such as mean, standard deviation, minimum, and maximum for numeric columns.

## Accessing Structural Information

The dimensions and shape of a DataFrame can be queried with the attributes `shape`, `size`, `ndim`, and `columns`.

```python
print(df.shape)              # Dimensions (rows, columns)
print(df.size)               # Total number of elements
print(df.ndim)               # Number of dimensions
print(df.columns)            # Column names
print(df.index)              # Row index
```

The `shape` attribute returns a tuple with the number of rows and columns. The `size` attribute indicates the total number of elements, and `ndim` is always 2 for DataFrames.

The data types of each column can be queried with `dtypes`.

```python
print(df.dtypes)              # Data types of each column
print(df['age'].dtype)        # Data type of a specific column
```

The most common types are `int64`, `float64`, `object` (for text), and `bool`.

To obtain unique values and counts, the methods `unique()`, `nunique()`, and `value_counts()` are used.

```python
print(df['city'].unique())       # Unique values of a column
print(df['city'].nunique())      # Number of unique values
print(df['city'].value_counts()) # Count of each unique value
```

The `unique()` method returns an array with values without repetition, `nunique()` the number of different values, and `value_counts()` counts the occurrences of each value.

## Quick Descriptive Statistics

Pandas offers methods to calculate basic statistics directly.

```python
print(df['age'].mean())        # Mean of ages
print(df['age'].median())      # Median
print(df['age'].std())         # Standard deviation
print(df['age'].min())         # Minimum
print(df['age'].max())         # Maximum
print(df['age'].sum())         # Total sum
```

These methods are applied on numeric columns and return a scalar value with the statistical calculation result.

## Data Selection

The `[]` operator allows selecting columns or rows from a DataFrame.

```python
df = pd.DataFrame({
    'name': ['Anna', 'Bernat', 'Carla'],
    'age': [25, 30, 22],
    'city': ['Barcelona', 'Girona', 'Lleida']
})

print(df['name'])            # Select a column (returns a Series)
print(df[['name', 'age']])   # Select multiple columns
print(df[0:2])               # Select rows by position using slicing
```

With a single label inside `[]`, a column is selected. With a list of labels, multiple columns are selected. With slicing, rows are selected by position.

## Selection with loc

The `loc` indexer selects data using row and column labels.

```python
print(df.loc[0])                 # Select a row by label
print(df.loc[0:1, 'name':'age']) # Select specific rows and columns
print(df.loc[[0, 2]])            # Select rows with a list of indexes
print(df.loc[:, 'city'])         # Select all rows of a column
```

The `loc` operator uses `[rows, columns]`. Ranges with `:` include the end value, unlike usual Python slicing.

## Selection with iloc

Similarly, the `iloc` indexer selects data using integer positions.

```python
print(df.iloc[0])               # Select a row by position
print(df.iloc[0:2, 0:2])       # Select rows and columns by position
print(df.iloc[[0, 2], [0, 2]]) # Select rows and columns with lists
print(df.iloc[:, 1])            # Select all rows of a column
```

Ranges do not include the end value!

## Filtering with Boolean Conditions

Boolean conditions allow filtering rows that meet certain criteria.

```python
# Filter rows where age is greater than 24
print(df[df['age'] > 24])

# Multiple conditions with & (and) and | (or)
print(df[(df['age'] > 24) & (df['city'] == 'Barcelona')])

# Membership condition
print(df[df['city'].isin(['Barcelona', 'Girona'])])

# Negation with ~
print(df[~(df['age'] > 24)])
```

Conditions return a boolean Series used to filter the DataFrame. Parentheses are required with logical operators `&`, `|`, and `~`.

## Query and Advanced Selections

The `query()` method allows filtering with more readable expressions.

```python
# Filtering with query
print(df.query('age > 24'))

# Multiple conditions
print(df.query('age > 24 and city == "Barcelona"'))

# Using external variables with @
threshold = 24
print(df.query('age > @threshold'))
```

The `query()` method accepts expressions as text and is especially useful for complex conditions.

## Selecting Multiple Columns and Rows

Pandas offers various ways to select subsets of data.

```python
# Select columns with select_dtypes
print(df.select_dtypes(include=['int64']))

# Filter columns by name with filter
print(df.filter(items=['name', 'age']))

# Filter columns by pattern
df_extended = df.copy()
df_extended['age_years'] = df_extended['age']
print(df_extended.filter(like='age'))
```

The `select_dtypes()` method filters columns by data type, `filter()` by exact names or patterns.

<Authors authors="jpetit"/>
