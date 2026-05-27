# Grouping and Aggregation

This lesson explains how to group and aggregate data in Pandas DataFrames. It covers the use of the `groupby()` operation, standard and custom aggregation functions, as well as techniques to transform and filter groups of data.

## Basics of groupby

The `groupby()` operation allows you to split a DataFrame into groups based on the values of one or more columns, apply a function to each group, and combine the results.

```python
import pandas as pd

df = pd.DataFrame({
    'city': ['Barcelona', 'Madrid', 'Barcelona', 'Madrid', 'Barcelona'],
    'product': ['A', 'A', 'B', 'B', 'A'],
    'sales': [100, 150, 200, 180, 120],
    'quantity': [10, 15, 20, 18, 12]
})

# Group by city
groups = df.groupby('city')
print(groups.size())
```

This code groups the rows by city and shows how many rows there are in each group. The result is a Series with the index formed by the unique values of the `city` column.

```python
# Group by multiple columns
groups = df.groupby(['city', 'product'])
print(groups.size())
```

You can use multiple columns to create more specific groups. In this case, a group is created for each unique combination of city and product.

## Aggregation functions

### Standard aggregations

Aggregation functions combine multiple values from a group into a single value.

```python
# Sum of sales by city
print(df.groupby('city')['sales'].sum())

# Average sales by city
print(df.groupby('city')['sales'].mean())

# Count of rows by city
print(df.groupby('city')['sales'].count())

# Minimum and maximum
print(df.groupby('city')['sales'].min())
print(df.groupby('city')['sales'].max())
```

Each function returns a Series with the index formed by the groups and the corresponding aggregated values.

```python
# Apply aggregation to multiple columns
print(df.groupby('city')[['sales', 'quantity']].sum())
```

You can specify a list of columns to apply the aggregation to all of them simultaneously, obtaining a DataFrame as a result.

### Custom aggregations

```python
# Custom function: range (max - min)
def range_func(x):
    return x.max() - x.min()

print(df.groupby('city')['sales'].agg(range_func))
```

The `agg()` function allows you to use custom functions. The function receives a Series with the group's values and returns a single value.

```python
# Using lambda functions
print(df.groupby('city')['sales'].agg(lambda x: x.max() - x.min()))
```

Lambda functions offer a concise way to define custom functions directly inside `agg()`.

## Multiple aggregations with agg()

```python
# Apply multiple functions to one column
print(df.groupby('city')['sales'].agg(['sum', 'mean', 'count']))
```

This code applies three different functions to the `sales` column of each group, returning a DataFrame with one column per function.

```python
# Different functions for different columns
aggregations = {
    'sales': ['sum', 'mean'],
    'quantity': ['sum', 'max']
}
print(df.groupby('city').agg(aggregations))
```

You can specify a dictionary to apply different sets of functions to different columns, creating a DataFrame with multi-level columns.

```python
# Rename resulting columns
print(df.groupby('city').agg(
    total_sales=('sales', 'sum'),
    average_sales=('sales', 'mean'),
    total_quantity=('quantity', 'sum')
))
```

This syntax allows assigning custom names to the resulting columns, improving readability.

## Transformations with transform()

The `transform()` function returns an object with the same shape as the original, repeating the aggregated value for each row in the group.

```python
# Add the group's average to each row
df['average_sales_city'] = df.groupby('city')['sales'].transform('mean')
print(df)
```

This code creates a new column with the average sales of the corresponding city for each row, maintaining the original length of the DataFrame.

```python
# Normalize values with respect to the group
df['normalized_sales'] = df.groupby('city')['sales'].transform(
    lambda x: (x - x.mean()) / x.std()
)
print(df)
```

Custom transformations allow operations like normalization within each group, useful for comparing values within the same context.

```python
# Calculate percentage over the group's total
df['city_percentage'] = df.groupby('city')['sales'].transform(
    lambda x: x / x.sum() * 100
)
print(df)
```

This example calculates the percentage that each sale represents over the total sales of its city.

## Filtering groups

The `filter()` function allows selecting entire groups based on a condition.

```python
# Keep only groups with more than 2 rows
filtered_df = df.groupby('city').filter(lambda x: len(x) > 2)
print(filtered_df)
```

This code removes all groups that have 2 or fewer rows, returning a DataFrame with only the groups that meet the condition.

```python
# Keep groups where the sum of sales exceeds a threshold
filtered_df = df.groupby('city').filter(lambda x: x['sales'].sum() > 300)
print(filtered_df)
```

You can use conditions based on aggregations to filter groups. In this case, only cities with total sales greater than 300 are kept.

```python
# More complex conditions
filtered_df = df.groupby('city').filter(
    lambda x: x['sales'].mean() > 100 and len(x) >= 2
)
print(filtered_df)
```

You can combine multiple conditions to create more sophisticated filters that evaluate different aspects of each group.

<Authors authors="jpetit"/>