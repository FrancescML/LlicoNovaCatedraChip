# Reading and Writing: Writing


## Writing with `print`

As we have seen before, `print` is the Python writing instruction and is used to write data to *stdout*.

To write a value, just pass the value as a parameter to `print`:

```python
>>> print('Hello')
Hello
>>> print(2023)
2023
>>> var = 3.1416
>>> print(var)
3.1416
```

By default, `print` adds a newline at the end of the writing.

If you want to write many data items on a single line, you can pass multiple parameters separated by commas:

```python
>>> print('Hello', 'Jordi')
Hello Jordi
>>> print(31, 12, 2023)
31 12 2023
>>> print()

>>> print(2023, 'Carles', 0.5)
2023 Carles 0.5
```

Without any parameter, it writes a blank line.


You can modify the behavior of `print` by specifying two additional parameters:

1. `sep` indicates what text will separate the given elements,

2. `end` indicates what text will be written at the end of the `print`.

By default, `sep` is a space and `end` is a newline.

These examples show how to use `sep`:

```python
>>> print('Hello', 'Jordi', sep='_')
Hello_Jordi
>>> print(31, 12, 2023, sep='_')
31_12_2023
>>> print(31, 12, 2023, sep='')
31122023
>>> print(31, 12, 2023, sep='   ')
31   12   2023
```

And these examples show how to use `end`:

```python
>>> print('Hello', 'Jordi', end='.')
Hello Jordi.>>> print('Hello', 'Jordi', end='\n\n')
Hello Jordi

>>>
```

In the first case, since instead of a newline a period was written, the *prompt* sticks to the text. In the second case, `end` is two newlines (the special text `\n` is a newline), so the writing leaves a blank line of separation.

Obviously, `end` and `sep` can be used together. This example separates the elements with commas and ends with a period:

```python
>>> print('Amalia', 'Maria', 'Emma', end=',', sep='.')
Amalia,Maria,Emma.>>>
```

The *prompt* (`>>>`) is only visible because these examples use the Python interpreter. Rest assured that when we write complete programs, it will not appear.

`print` has more options, but these are the few that we will need.




<Authors authors="jpetit"/>