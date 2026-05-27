# Best Practices and Optimization

As data grows in volume and complexity, it is essential to adopt best practices to write efficient code and optimize memory usage. This lesson presents techniques and tips to improve the performance and readability of code with Pandas.

## Method chaining

_Method chaining_ consists of chaining multiple operations in a single expression, improving readability and reducing the need for intermediate variables.

```python
import pandas as pd

df = pd.DataFrame({
    'name': ['Anna', 'Bernat', 'Carla', 'David', 'Elena'],
    'age': [25, 30, 22, 35, 28],
    'city': ['Barcelona', 'Madrid', 'Barcelona', 'Madrid', 'Barcelona'],
    'salary': [30000, 45000, 28000, 52000, 38000]
})

# Without method chaining
df_temp = df[df['age'] > 25]
df_temp = df_temp.sort_values('salary', ascending=False)
result = df_temp[['name', 'salary']]

print(result)
```

This code uses intermediate variables for each operation, occupying more memory and reducing the clarity of the overall process.

```python
# With method chaining
result = (df[df['age'] > 25]
          .sort_values('salary', ascending=False)
          .reset_index(drop=True)
          [['name', 'salary']])

print(result)
```

Chaining allows seeing all transformations in a single block, facilitating understanding of the data flow. Parentheses allow splitting the expression into multiple lines to improve readability.

```python
# Method chaining with assign()
result = (df
          .assign(annual_salary=lambda x: x['salary'] * 12)
          .assign(category=lambda x: pd.cut(x['age'],
                                            bins=[0, 25, 30, 100],
                                            labels=['young', 'middle', 'senior']))
          .groupby('category')['annual_salary']
          .mean())

print(result)
```

The `assign()` function allows creating new columns within the chain without modifying the original DataFrame, maintaining a functional style.

## Memory and efficiency

### Memory usage check

```python
# Check memory usage
print(df.memory_usage(deep=True))
print(f"Total: {df.memory_usage(deep=True).sum() / 1024**2:.2f} MB")
```

This code shows how much memory each column occupies and the total of the DataFrame. The `deep=True` parameter includes the memory usage of objects like strings.

### Data type optimization

```python
# Original types
print(df.dtypes)
print(f"Initial memory: {df.memory_usage(deep=True).sum()} bytes")

# Optimize numeric types
df_optimized = df.copy()
df_optimized['age'] = df_optimized['age'].astype('int8')
df_optimized['salary'] = df_optimized['salary'].astype('int32')

print(f"Optimized memory: {df_optimized.memory_usage(deep=True).sum()} bytes")
```

Using smaller data types when possible significantly reduces memory usage. For example, `int8` can represent values from -128 to 127, sufficient for ages.

```python
# Convert strings to categories
df_optimized['city'] = df_optimized['city'].astype('category')
print(df_optimized['city'].memory_usage(deep=True))
```

Columns with repeated values benefit from conversion to `category` type, which internally stores numeric codes instead of repeating strings.

### Selective data loading

```python
# Load only necessary columns
df_partial = pd.read_csv('data.csv', usecols=['name', 'salary'])

# Specify data types on load
df_types = pd.read_csv('data.csv',
                       dtype={'age': 'int8', 'city': 'category'})
```

Loading only the necessary columns and specifying data types from the start saves memory and processing time.

## Avoid loops: vectorized thinking

Pandas vectorized operations are orders of magnitude faster than Python loops.

```python
import numpy as np

# Create test data
df_large = pd.DataFrame({
    'value': np.random.randint(1, 100, 10000)
})

# Inefficient way: loop
import time

start = time.time()
results = []
for value in df_large['value']:
    if value > 50:
        results.append(value * 2)
    else:
        results.append(value)
df_large['loop_result'] = results
print(f"Time with loop: {time.time() - start:.4f} seconds")
```

Python loops are slow because they process each element individually and do not take advantage of vectorized operation optimizations.

```python
# Efficient way: vectorized operations
start = time.time()
df_large['vectorized_result'] = np.where(df_large['value'] > 50,
                                         df_large['value'] * 2,
                                         df_large['value'])
print(f"Vectorized time: {time.time() - start:.4f} seconds")
```

The `np.where()` function applies the condition to the entire vector simultaneously, leveraging optimized C operations.

```python
# Multiple conditions with np.select()
conditions = [
    df_large['value'] < 30,
    df_large['value'] < 70,
    df_large['value'] >= 70
]
choices = [
    df_large['value'] * 0.5,
    df_large['value'] * 1.5,
    df_large['value'] * 2
]
df_large['complex_result'] = np.select(conditions, choices)
```

For more complex conditions, `np.select()` allows defining multiple cases and their corresponding results in a vectorized way.

```python
# Apply functions with apply() only when needed
# Less efficient than vectorized operations but better than loops
df_large['apply_result'] = df_large['value'].apply(lambda x: x**2 if x % 2 == 0 else x**3)
```

The `apply()` function is a compromise when no direct vectorized operation exists, but it is still slower than native Pandas operations.

## Tips for large data volumes

### Processing in chunks

```python
# Read large file in chunks
chunks = []
for chunk in pd.read_csv('large_file.csv', chunksize=10000):
    # Process each chunk
    processed_chunk = chunk[chunk['value'] > 100]
    chunks.append(processed_chunk)

df_final = pd.concat(chunks, ignore_index=True)
```

Processing data in chunks avoids loading the entire dataset into memory, allowing work with files larger than available RAM.

### Use appropriate indexes

```python
# Set index for frequent queries
df_indexed = df.set_index('name')

# Fast lookup by index
result = df_indexed.loc['Anna']
```

Indexes speed up search and join operations, especially in large DataFrames.

### Avoid unnecessary copies

```python
# Inefficient: creates copies
df_copy = df.copy()
df_copy['new_column'] = df_copy['salary'] * 1.1

# More efficient: direct modification (when possible)
df['new_column'] = df['salary'] * 1.1

# Use views instead of copies when possible
view = df[['name', 'salary']]  # This is a view, not a copy
```

Copies of large DataFrames consume a lot of memory. It is preferable to modify directly or use views when preserving the original is not necessary.

### Query and eval for complex expressions

```python
# Use query() for complex filters
result = df.query('age > 25 and salary > 35000')

# Use eval() for numeric expressions
df['bonus'] = df.eval('salary * 0.1 + age * 100')
```

The `query()` and `eval()` functions use optimized evaluation engines that are faster and more memory-efficient than traditional operations, especially with large DataFrames.

### Consider alternative formats

```python
# Save in Parquet (more efficient than CSV)
df.to_parquet('data.parquet', compression='gzip')

# Load from Parquet
df_loaded = pd.read_parquet('data.parquet')
```

The Parquet format is columnar and compressed, offering better read/write performance and lower space usage than CSV, especially for large data volumes.

<Authors authors="jpetit"/>