# Reading Data with `yogi`

<img src='./reading.png' style='height: 10em; float: right; margin: 2em 0 1em 1em;'/>

Reading data in Python is, let's admit it, too difficult for beginners. To solve this, you can use the [`yogi`](https://github.com/jutge-org/yogi) module. This small module offers simple yet powerful functions to read data from Python and is very useful for solving problems on [Jutge.org](https:/jutge.org).

This lesson explains how to install and use the `yogi` module.

## Installation

-   Install with `pip install yogi` or `pip3 install yogi` (depending on your system).

## Basic Usage

The `read()` function from `yogi` returns the next element (_token_) from the input.  
The type of this element must be given as a parameter and can be one of these three:

-   `read(int)` returns the next integer,
-   `read(float)` returns the next real number, and
-   `read(str)` returns the next word.

Elements are separated by words. Whitespaces and newlines cannot be obtained since `read()` ignores them. If the input has no more elements, `read()` raises an unpleasant exception.

The `scan()` function from `yogi` also returns the next element (_token_) from the input, but if the input ends (or the read value is not compatible with the requested type), it returns `None`. Like `read()`, you must specify what you want to read with `scan()`:

-   `scan(int)` returns the next integer or `None` if none is available,
-   `scan(float)` returns the next real number or `None` if none is available, and
-   `scan(str)` returns the next word or `None` if none is available.

Additionally, you can use the `tokens()` generator to get the next element from the input or end the loop when there are no more.

## Examples

### Program that greets

```python
from yogi import read

print('What is your name?')
name = read(str)
print('Hello', name)
```

Notice that this program captures the first word typed by the user, regardless of the whitespaces or newlines before or after it. This could not have been done simply with `input()`!

### Program that reads two numbers and prints their sum

```python
from yogi import read

x = read(int)
y = read(int)
print(x + y)
```

### Program that reads a sequence of real numbers and prints their sum (using `scan()`)

```python
from yogi import scan

s = 0.0
x = scan(float)
while x is not None:
    s = s + x
    x = scan(float)
print(s)
```

Note that when using a terminal, you must signal the end of input with  
<kbd>Control</kbd> + <kbd>d</kbd> on Linux and Mac or <kbd>Control</kbd> + <kbd>z</kbd> on Windows.

### Program that reads a sequence of real numbers and prints their sum (using `tokens()`)

The previous program would be easier to write using `tokens()`:

```python
from yogi import tokens

s = 0.0
for x in tokens(float):
    s = s + x
print(s)
```

## Additional Information

More comprehensive information about this module can be found in [its documentation](https://github.com/jutge-org/yogi/blob/master/README.md).

<Autors autors="jpetit"/>