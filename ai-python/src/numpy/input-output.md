# Input and Output

This lesson presents the basic NumPy functions for saving and loading arrays to and from files.

## Saving and loading binary arrays

NumPy offers a binary file format called **NPY** which is the standard for efficiently saving NumPy arrays.

- The function `numpy.save(file, arr)` saves an array to a binary file with the extension **.npy**. Here, `file` is the filename (or a file object) where the array will be saved and `arr` is the array to save.

- The function `numpy.load(file)` loads data from a **.npy** file (or another NumPy binary format) and returns the array it contains. Here, `file` is the filename (or a file object) from which to load the array.

Here is a basic usage example:

```python
import numpy as np

# Create an array
arr = np.arange(5)

# Save the array to a binary file
np.save('my_array.npy', arr)

# Load the array
loaded_arr = np.load('my_array.npy')
print(loaded_arr)  # [0 1 2 3 4]
```

## Compressed format

When you need to save **multiple arrays** in a single file, NumPy provides a format based on a ZIP archive containing several **.npy** files, one for each array.

- The function `numpy.savez(file, *args, **kwds)` saves multiple arrays into an **uncompressed archive file** with the extension **.npz**. Arrays can be passed as positional arguments (unnamed) or as keyword arguments (named). If no name is provided, default names like 'arr_0', 'arr_1', etc. are assigned.

- The function `numpy.savez_compressed(file, *args, **kwds)` is similar to `savez()`, but **compresses** the arrays inside the archive, which is useful for large or sparse data.

To load **.npz** files, you also use the function `numpy.load(file)`. This function returns an `NpzFile` object that acts like a dictionary, where keys are the names of the arrays.

```python
# Create two arrays
a = np.array([1, 2, 3])
b = np.array([4, 5, 6])

# Save the two arrays in a .npz file
np.savez('two_arrays.npz', array_a=a, array_b=b)

# Load the .npz file
data = np.load('two_arrays.npz')

# Access arrays by their name
print(data['array_a'])  # Output: [1 2 3]
print(data['array_b'])  # Output: [4 5 6]
```

## Text formats

NumPy also allows exchanging data with plain text files (such as CSV or TSV), although it is less efficient than binary formats. In this case, the following functions are useful:

- `numpy.savetxt(fname, X, fmt='%.18e', delimiter=' ')` saves an array (or a sequence of 1D arrays) to a text file.

    - `fname`: Filename.
    - `X`: 1D or 2D array to save.
    - `fmt`: Format of the number to write (default scientific notation).
    - `delimiter`: Character separating columns (default a space).

- `numpy.loadtxt(fname, dtype=float, delimiter=None)` loads data from a text file.

    - `fname`: Filename.
    - `dtype`: Data type of the elements in the resulting array.
    - `delimiter`: Column separator character.

- `numpy.genfromtxt(fname, dtype=float, delimiter=None, missing_values=None)` is a more robust function to load data from text files.

The main advantage of `genfromtxt()` over `loadtxt()` is its ability to handle **missing data**, allowing you to specify how these values should be represented (by default, they are converted to NaN). It can also infer the data type for each column independently.

## Summary of formats

| Format                      | Function                                | Use                                           | Advantages                                                                     | Disadvantages                                                                               |
| :-------------------------- | :------------------------------------- | :-------------------------------------------- | :----------------------------------------------------------------------------- | :------------------------------------------------------------------------------------------ |
| **Binary (.npy)**           | `save()`, `load()`                     | Save a single array                           | Fast, space-efficient, preserves exact `dtype` and array shape.                | Not human-readable, requires NumPy to load.                                                |
| **Compressed binary (.npz)**| `savez()`, `savez_compressed()`        | Save multiple arrays                          | Fast, allows grouping arrays, compression available.                           | Not human-readable.                                                                         |
| **Text (.csv, .txt)**       | `savetxt()`, `loadtxt()`, `genfromtxt()` | Interoperability with other tools/programs. | Human-readable, easy to inspect.                                               | Slower, less space-efficient, data type conversion can be ambiguous or inaccurate.          |

<Authors authors="jpetit"/>