# Reading and Writing


# TODO: Improve


## Reading

As mentioned earlier, the Python `input` statement is used to read data from *stdin* (possibly with a prompt previously shown on *stdout*).

However, using `input` has limitations, as it only allows reading one line of text. To address these issues and obtain a more precise and efficient way to read data, in this course we will use the `yogi` package. This way, we can overcome the limitations of input and improve the data reading process. To use the `yogi` package, it must be installed beforehand (with `pip3 install yogi`).

To use the `yogi` package, you need to do an `import yogi` (similar to `import turtle`). `yogi` offers a `read` function that allows reading integer, real, or textual data. You must specify which type of data you want to read as a parameter: `int` for integers, `float` for real numbers, or `str` for texts (words, specifically):

```python
>>> import yogi
>>> i = yogi.read(int)
12
>>> i
12
>>> f = yogi.read(float)
3.14
>>> f
3.14
>>> s = yogi.read(str)
September
>>> s
'September'
```

Thanks to `yogi`, data can be read even if they are on the same or different lines. For example, the following statement reads two integers and writes their sum.

```python
>>> print(yogi.read(int) + yogi.read(int))
3 4
7
```

And it also works with data separated by many spaces or lines:

```python
>>> print(yogi.read(int) + yogi.read(int))


3



          4
7
```

Achieving this with `input` is practically impossible.

If data of a type not prescribed is read, an error will occur. For example:

```python
>>> i = yogi.read(int)
23.56
ValueError: invalid literal for int() with base 10: '23.56'
```

`yogi` offers more operations, which we will see later, but before finishing, note that you can import a function directly from a package so you don't have to prefix it with the package name every time:

```python
>>> from yogi import read
>>> print(read(int) + read(int))
```

In long programs, it is not advisable to use the `from ... import ...` form, but for short or throwaway programs, it is worth it.



<Authors authors="jpetit"/>