# Reading and Writing Data with Pandas

This lesson explains how to read and write data in different formats using the Python Pandas library. Pandas provides simple functions to load data from CSV, Excel, JSON files, and SQL databases, as well as to export data to these formats.

Remember that to use Pandas, it is usually imported with the alias `pd`:

```python
import pandas as pd
```

## Reading Files

Pandas provides functions to load data from various formats. All return a DataFrame.

### CSV

The `read_csv` function reads comma-separated value files:

```python
df = pd.read_csv('data.csv')
```

Some useful parameters:

-   `sep`: separator character (default `,`)
-   `header`: row number with column names (default `0`)
-   `index_col`: column to use as index
-   `usecols`: list of columns to read
-   `dtype`: dictionary with data types of columns
-   `na_values`: values to interpret as NaN

```python
df = pd.read_csv('data.csv', sep=';', index_col=0, usecols=['name', 'age'])
```

### Excel

The `read_excel` function reads Excel files:

```python
df = pd.read_excel('data.xlsx')
```

Relevant parameters:

-   `sheet_name`: name or index of the sheet to read (default is the first)
-   `header`, `index_col`, `usecols`: same as in CSV

```python
df = pd.read_excel('data.xlsx', sheet_name='Sheet1')
```

### JSON

The `read_json` function reads JSON files:

```python
df = pd.read_json('data.json')
```

The `orient` parameter specifies the JSON structure:

-   `'split'`: dictionary with keys `index`, `columns`, and `data`
-   `'records'`: list of dictionaries (one per row)
-   `'index'`: dictionary of dictionaries indexed by rows
-   `'columns'`: dictionary of dictionaries indexed by columns
-   `'values'`: only the values as a 2D array

```python
df = pd.read_json('data.json', orient='records')
```

### SQL

The `read_sql` function reads data from an SQL database (e.g., sqlite3):

```python
import sqlite3

conn = sqlite3.connect('database.db')
df = pd.read_sql('SELECT * FROM table', conn)
conn.close()
```

You can pass an SQL query or the name of a table. A prior connection to the database is required.

## Writing Files

DataFrames can be exported to different formats using specific methods.

### Export to CSV

The `to_csv` method writes a DataFrame in CSV format:

```python
df.to_csv('output.csv')
```

Common parameters:

-   `sep`: separator character
-   `index`: whether to include the index (default `True`)
-   `header`: whether to include column names (default `True`)
-   `columns`: list of columns to export
-   `na_rep`: string to represent NaN values

```python
df.to_csv('output.csv', sep=';', index=False)
```

### Export to Excel

The `to_excel` method writes a DataFrame in Excel format:

```python
df.to_excel('output.xlsx')
```

Relevant parameters:

-   `sheet_name`: sheet name (default `'Sheet1'`)
-   `index`: whether to include the index
-   `columns`: list of columns to export

```python
df.to_excel('output.xlsx', sheet_name='Results', index=False)
```

### Export to JSON

The `to_json` method writes a DataFrame in JSON format:

```python
df.to_json('output.json')
```

The `orient` parameter controls the structure (same as in `read_json`):

```python
df.to_json('output.json', orient='records', indent=2)
```

The `indent` parameter adds indentation to improve readability.

### General Considerations

All export methods accept the `index` parameter to control whether the DataFrame index is written (the index is the label identifying each row of the DataFrame and allows direct access). By default, it is `True`, but it is often convenient to disable it with `index=False`.

```python
df.to_csv('data.csv', index=False)
df.to_excel('data.xlsx', index=False)
df.to_json('data.json', orient='records')
```

<Authors authors="jpetit"/>