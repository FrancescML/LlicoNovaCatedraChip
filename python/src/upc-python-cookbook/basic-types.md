# Basic types

In this section we go through the built-in basic types offered by Python: `int`, `float`, `bool`, `NoneType` and `str`.

## Integers

The most basic numerical type is the integer. Python considers any number without a decimal point to be of type `int`:

```python
>>> n = 6
>>> type(n)
<class 'int'>
```

Integers support the usual arithmetic operations `+` (sum), `-` (substraction), `*` (product), `//` (integer division), `%` (remainder of division), `**` (power) and they can be compared with relational operators (`==`, `!=`, `<`, `<=`, `>`, `>=`):

```python
>>> 22 // 7
3
>>> 22 / 7          # By default, division casts to floating-point type
3.142857142857143
```

One remarkable feature is that integers are of variable precision and there is no need to worry about overflow issues:

```python
>>> 2 ** 100
1267650600228229401496703205376
```

## Floating-point numbers

The `float` type represents real numbers and they can be defined either in standard decimal notation or in exponential notation:

```python
>>> n = 1.23
>>> G = 6.67408e-11
```

They support the same arithmetic and relational operators as integers, exchanging the integer division `//` by the real division `/`.

## Boolean

The boolean type has two possible values: `True` and `False`. Relational operators such as `==`, `!=`, `<`, `<=`, `>`, `>=` return booleans and they can be operated by means of `and` (conjunction), `or` (disjunction) and `not` (negation).

## None Type

Python offers one special value [`None`](https://docs.python.org/3/library/constants.html) of type `NoneType` that is frequently used to represent the absence of a value.

## Conversions

In Python you can explicitly convert different types using the desired name of the type as if it were a function. For instance, to convert into integers:

```python
>>> int(6.66)
6
>>> int(9.99)
9
>>> int('23')
23
>>> int('twelve')
ValueError: invalid literal for int() with base 10: 'twelve'
```

Or to convert into floats:

```python
>>> float(12)
12.0
>>> float('12')
12.0
>>> float('12.24')
12.24
```

Most values can be converted into strings using the `str()` function:

```python
>>> str(33)
'33'
>>> str(3.1416)
'3.1416'
>>> str(False)
'False'
>>> str([1, 'one', []])
"[1, 'one', []]"
```

<!-- In fact, when you call the `print()` function it uses `str` (or a similar method called `__repr__`). -->

## Strings

Strings in Python are of type `str` and consist in sequences of Unicode characters (an standard for the representation of text).
Values in strings are immutable: they cannot be modified once they are created. All you can do is create new strings from them.

Note that the character type does not exist in Python.

### Representation

Strings are created with single or double quotes:

-   `"Hello World!"`
-   `"I'm a string"`
-   `'村上 春樹'`
-   `'🎈'`
-   `''`

You can also have multiline strings using three quotation marks:

```python
html = """
    <html>
        <head>
            <title>My title</</title>
        </head>
        <body>
            <h1>Introduction</h1>
            <p>
                Some text
            </p>
        </body>
    </html>
"""
```

### Functions for length, minimum and maximum

The [`len()`](https://docs.python.org/3/library/functions.html#len) function returns the number of characters in a string:

```python
>>> len('Everest')
7
>>> len('A')
1
```

The [`min()`](https://docs.python.org/3/library/functions.html#min)
and [`max()`](https://docs.python.org/3/library/functions.html#max) functions return the smallest and largest character in a string respectively.

```python
>>> min('Everest')
'E'
>>> max('Everest')
'v'
```

### Operators

These are some of the operators that can be applied to strings:

-   Two strings can be concatenated with the operator `+`.

-   A string can be repeated with the operator `*`.

-   The operator `in` can be used to check whether a string is contained inside another one.

-   Relational operators (such as `==`, `!=`, `<`, `<=`, `>`, `>=`) can be used to compare strings.

For instance:

```python
>>> 'Julius' + ' ' + 'Caesar'
'Julius Caesar'
>>> 'spam' * 5
'spamspamspamspamspam'
>>> 'flame' in 'the flame that burns twice as bright burns half as long'
True
>>> 'c' < 'python'
True
```

### Iterating

In order to iterate all the characters in a string, a `for` loop is used:

```python
def number_of_as(text):
    n = 0
    for c in text:
        if c == "A":
            n += 1
    return n
```

More insight on `for` loops is given in the [Control flow](/upc-python-cookbook/control-flow.html) section.

### Substrings

You can create a substring using the indexing operator `[]`, starting from 0:

```python
>>> 'snowing'[0]
's'
>>> 'snowing'[3]
'w'
>>> 'snowing'[7]
IndexError: string index out of range
```

Elements at the end can be accessed using a negative index, starting from -1:

```python
>>> 'snowing'[-1]
'g'
>>> 'snowing'[-7]
'2'
>>> 'snowing'[-8]
IndexError: string index out of range
```

In order to extract the substring between two positions you can use the syntax `s[start:stop]`. Note that stopping point is never part of the generated substring:

```python
>>> 'snowing'[0:4]
'snow'
>>> 'snowing'[1:4]
'now'
>>> 'snowing'[3:4]
'w'
>>> 'snowing'[4:4]
''
```

In case `start` is not given it means "from the beginning". Similarly, if `stop` is not given it means "until the end":

```python
>>> 'snowing'[:4]
'snow'
>>> 'snowing'[4:]
'ing'
```

You can also specify a step by means of `s[start:stop:step]`:

```python
>>> 'snowing'[0:5:2]
'soi'
>>> 'snowing'[::2]  # Equivalent to l[0:len(l):2]
'soig'
>>> 'snowing'[::-1]
'gniwons'
```

As we highlighted before, strings are immutable and their characters cannot be modified:

```python
>>> s = 'snowing'
>>> s[0] = 'k'
TypeError: 'str' object does not support item assignment
```

In order to obtain `'knowing'` you can do something like

```python
>>> s = 'k' + s[1:]
>>> s
'knowing'
```

### Methods

Strings are objects with many available methods. Here are a few of them:

-   The `upper()` and `lower()` methods return a copy of the string with all the characters converted to uppercase or lowercase respectively. Analogously, `isupper()` and `islower()` return true if all the characters are uppercase or lowercase.

    ```python
    >>> name = 'Alan Turing'
    >>> name.upper()
    'ALAN TURING'
    >>> name.lower()
    'alan turing'
    >>> name.islower()
    False
    >>> name.upper().isupper()
    True
    ```

-   The `lstrip()`, `rstrip()` and `strip()` methods are useful to remove leading or trailing characters. With `strip()` both are removed.

    ```python
    >>> ' improve this text '.lstrip()
    'improve this text '
    >>> ' improve this text '.rstrip()
    ' improve this text'
    >>> ' improve this text '.strip()
    'improve this text'
    ```

-   `find(sub)` returns the lowest index in the string where a subsequence `sub` is found.

    ```python
    >>> 'I took the one less traveled by, and that has made all the difference.'.find('the')
    7
    ```

-   `count(x)` returns the total number of occurrences of `x` in the string.

    ```python
    >>> 'I took the one less traveled by, and that has made all the difference.'.count('the')
    2
    ```

-   `split(sep)` returns a list of the words in the string, using `sep` (space by default) as the delimiter string.
    ```python
    >>> '888-564-787-1152'.split('-')
    ['888', '564', '787', '1152']
    >>> 'I am large, I contain multitudes'.split()
    ['I', 'am', 'large,', 'I', 'contain', 'multitudes']
    ```

For a complete outlook of all the available methods refer to the [Python documentation](https://docs.python.org/3/library/stdtypes.html#string-methods) or type

```python
>>> help(str)
```

### Substitutions and format

The [`format()`](https://docs.python.org/3/library/stdtypes.html#str.format) method enables replacements and variable formatting inside a string.
Check [the documentation about formatting](https://docs.python.org/3.7/library/string.html#format-string-syntax)
in Python for much more information details (including the new f*string*s in Python ≥3.6).

This simple example shows how to apply substitutions in a string:

```python
>>> '{} is {}m high'.format('Mount Everest', 8848)
'Mount Everest is 8848m high'
```

In case you want to format a floating point number you can specify additional options:

```python
>>> "{}".format(3.65)
'3.65'
>>> "{:.10f}".format(3.65)      # Adds 10 digits after the decimal point
'3.6500000000'
"{:7.3f}".format(3.65)          # Uses 7 characters, 3 of which are after the decimal point
'  3.650'
```

<Autors autors="adell"/>
