# Data Manipulation

This lesson explains how to modify and transform data in Pandas DataFrames. It covers operations such as adding and deleting columns and rows, modifying values, reordering data, and other techniques for manipulating tabular information.

## Adding and Deleting Columns

New columns can be added by assigning values directly or deleted using `drop()`.

```python
df = pd.DataFrame({
    'name': ['Anna', 'Bernat', 'Carla'],
    'age': [25, 30, 22]
})

# Add a new column
df['city'] = ['Barcelona', 'Girona', 'Lleida']

# Add a calculated column
df['age_doubled'] = df['age'] * 2

# Delete a column
df = df.drop('age_doubled', axis=1)

# Delete multiple columns
df = df.drop(['city'], axis=1)
```

Direct assignment creates new columns. The `drop()` method with `axis=1` deletes columns. By default, `drop()` returns a copy, so you need to reassign the result or use `inplace=True`.

## Adding and Deleting Rows

Rows can be added with `concat()` or `loc`, and deleted with `drop()`.

```python
# Add a row with loc
df.loc[3] = ['David', 35]

# Add multiple rows with concat
new_rows = pd.DataFrame({
    'name': ['Eva', 'Francesc'],
    'age': [28, 33]
})
df = pd.concat([df, new_rows], ignore_index=True)

# Delete a row by index
df = df.drop(0)

# Delete multiple rows
df = df.drop([1, 2])
```

The `concat()` method joins DataFrames vertically. The argument `ignore_index=True` resets the index numbering.

## Modifying Values

Values can be modified using indexing or specific methods.

```python
# Modify a specific value with loc
df.loc[3, 'age'] = 36

# Modify multiple values
df.loc[df['name'] == 'Eva', 'age'] = 29

# Modify with at (faster for single values)
df.at[3, 'name'] = 'Daniel'

# Replace values with replace
df['name'] = df['name'].replace('Daniel', 'David')
```

The `loc` and `at` methods allow assigning new values. The `replace()` method substitutes specific values throughout the column.

## Renaming Columns and Indexes

The `rename()` method allows changing column and index names.

```python
# Rename columns
df = df.rename(columns={'name': 'nombre', 'age': 'edad'})

# Rename indexes
df = df.rename(index={3: 'three', 4: 'four'})

# Rename multiple elements
df = df.rename(columns={'nombre': 'name'}, index={'three': 3})
```

The `columns` parameter accepts a dictionary mapping old names to new names. The same applies to `index`.

## Reordering Columns and Rows

Columns and rows can be reordered by changing the order or sorting the values.

```python
df = pd.DataFrame({
    'age': [25, 30, 22],
    'name': ['Anna', 'Bernat', 'Carla'],
    'city': ['Barcelona', 'Girona', 'Lleida']
})

# Manually reorder columns
df = df[['name', 'age', 'city']]

# Sort rows by a column
df = df.sort_values('age')

# Sort in descending order
df = df.sort_values('age', ascending=False)

# Sort by multiple columns
df = df.sort_values(['city', 'age'])

# Sort by index
df = df.sort_index()
```

The `sort_values()` method sorts rows according to the values of one or more columns. The `sort_index()` method sorts by the row index.

<Autors autors="jpetit"/>