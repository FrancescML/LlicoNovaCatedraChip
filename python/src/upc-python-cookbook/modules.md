# Modules and packages

One interesting feature of Python is that its standard library contains useful tools for a wide range of tasks. On top of this, there is a broad ecosystem of third-party tools and packages that offer more specialized functionality. Here we'll take a look at importing standard library modules and tools for installing third-party modules.

## Loading modules: the [`import`](https://docs.python.org/3/reference/import.html) statement

Python code in one module gains access to the code in another module by the process of importing it. There are a few ways to use the statement, which we will mention briefly here, from most recommended to least recommended.

### Explicit module import

Explicit import of a module preserves the module's content in a namespace. The namespace is then used to refer to its contents with a `.` between them. For example, here we'll import the built-in `math` module and compute the cosine of pi:

```python
>>> import math
>>> math.cos(math.pi)
-1.0
```

As with any other object, we can explore the modules by means of the `help()` function:

```python
>>> help(math)
```

```
Help on built-in module math:

NAME
    math

DESCRIPTION
    This module is always available.  It provides access to the
    mathematical functions defined by the C standard.

FUNCTIONS
    acos(...)
        acos(x)

        Return the arc cosine (measured in radians) of x.

    ...
```

### Explicit module import by alias

For longer module names, it's not convenient to use the full module name each time you access some element. For this reason, we'll commonly use the `import ... as ...` pattern to create a shorter alias for the namespace. For example, the NumPy (Numerical Python) package, a popular third-party package useful for data science, is by convention imported under the alias `np`:

```python
>>> import numpy as np
>>> np.cos(np.pi)
-1.0
```

### Explicit import of module contents

Sometimes rather than importing the module namespace, you would just like to import a few particular items from the module. This can be done with the `from ... import ...` pattern. For example, we can import just the `cos` function and the `pi` constant from the `math` module:

```python
>>> from math import cos, pi
>>> cos(pi)
-1.0
```

### Implicit import of module contents

Finally, it is sometimes useful to import the entirety of the module contents into the local namespace. This can be done with the `from ... import *` pattern:

```python
>>> from math import *
>>> sin(pi)**2 + cos(pi)**2
1.0
```

This **pattern should be used sparingly**, if at all. The problem is that such imports can sometimes overwrite function names that you do not intend to overwrite, and the implicitness of the statement makes it difficult to determine what has changed.

## Importing from Python's standard library

Python's standard library contains many useful built-in modules. Here is an incomplete list of some of the modules you might wish to explore and learn about.

-   `os` and `sys`: Tools for interfacing with the operating system, including navigating file directory structures and executing shell commands,
-   `math` and `cmath`: Mathematical functions and operations on real and complex numbers,
-   `itertools`: Tools for constructing and interacting with iterators and generators,
-   `functools`: Tools that assist with functional programming,
-   `random`: Tools for generating pseudorandom numbers,
-   `pickle`: Tools for object persistence: saving objects to and loading objects from disk,
-   `json` and `csv`: Tools for reading JSON-formatted and CSV-formatted files.,
-   `urllib`: Tools for doing HTTP and other web requests.

You can find information on these, and many more, in the Python [standard library documentation](https://docs.python.org/3/library/).

## Importing from third-party modules

One of the things that makes Python useful is its ecosystem of third-party modules. These can be imported just as the built-in modules, but first the modules must be installed on your system. For convenience, _Anaconda_ comes with a program called _conda_, which will automatically fetch packages listed on its repository. Its basic syntax is

```shell
conda install package_name
```

and needs to be typed either on a terminal or on the _Anaconda Prompt_. For more insight refer to the [conda package manager](https://docs.anaconda.com/anaconda/user-guide/tasks/install-packages/).

Most part of this chapter is taken from Jake Vanderplas' [_A Whirlwind Tour of Python_](https://github.com/jakevdp/WhirlwindTourOfPython).

<Autors autors="adell"/>
