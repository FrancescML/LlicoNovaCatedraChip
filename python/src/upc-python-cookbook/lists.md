# Lists

[Lists](https://docs.python.org/3/tutorial/datastructures.html) are part of the core Python language and probably the most used data structure. Despite their name, lists are implemented as dynamic arrays. This means that elements can be added or removed dynamically and the list will automatically allocate or release memory.

They can be defined with comma-separated values between square brackets.

```python
>>> l = [1, 1, 2, 5, 14, 42, 132]
# Lists have a nice representation by default
>>> print(l)
[1, 1, 2, 5, 14, 42, 132]
```

We can also contain a list inside another list which allows us to easily describe

-   **matrices**: `m = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]`
-   and **trees**: `t = [1, [2, None, None], [3, None, None]]`.

In Python, lists are **heterogeneous**: We can store different kinds of data types in a single list.

```python
>>> l = [0, True, 'two', 3.14]
```

The drawback of the structure being so supple is it that takes up more space since data is less tightly packed and you can no longer expect what to find inside.

## Getting information

-   We can use the [`in`](https://docs.python.org/3/reference/expressions.html#in) operator to check whether a value exists in a list. Its cost is linear on the size of the given list.

-   To get the length of a list we can use the [`len()`](https://docs.python.org/3/library/functions.html#len) function.

-   The built-in functions [`min()`](https://docs.python.org/3/library/functions.html#min), [`max()`](https://docs.python.org/3/library/functions.html#max), [`sum()`](https://docs.python.org/3/library/functions.html#sum) can be applied to lists.

    ```python
    >>> l = [1, 1, 2, 5, 14, 42, 132]
    >>> 17 not in l
    True
    >>> 14 in l
    True
    >>> len(l)
    7
    >>> sum(l)
    197
    ```

-   We can go through all the elements in a list by means of a `for` loop (which will be covered in more detail in the [_Control flow_](/upc-python-cookbook/control-flow.html) and [_Writing loops_](/upc-python-cookbook/looping-lists.html) sections):

    ```python
    >>> for i in [1, 1, 2, 5, 14, 42, 132]:
    ...     print(i, end=' ')                 # To avoid printing a new line
    1 1 2 5 14 42 132
    ```

## Indexing and slicing

As with strings, lists can be indexed and sliced:

```python
>>> l = [1, 6, 15, 28, 45, 66, 91]
>>> l[-1] # Elements at the end can be accessed with negative numbers, starting from -1
91
>>> l[:2]
[1, 6]
>>> l[::-1] # With a negative step, the list is reversed
[91, 66, 45, 28, 15, 6, 1]
```

It is also possible to _unpack_ a list. For instance,

```python
>>> l = ['a', 'b', 'c']
>>> a, b, c, = l
>>> print(a, b, c)
a b c
>>> a, b = l
ValueError: 'too many values to unpack (expected 2)'
```

Here we combine these two capabilities:

```python
>>> l = ['a', 'b', ['x', 'y', 'z']]
>>> x, y = l[2][:2]
>>> print(x, y)
x y
```

## Modifying

Unlike `strings`, Python's `list` objects are **mutable** so it is possible to change their content.

```python
>>> l = [1, 6, 15, 28, 45, 66, 92]
>>> l[-1] = 91
>>> l
[1, 6, 15, 28, 45, 66, 91]
```

Moreover, we can make **assignments to slices** and even change the length of the list while doing so:

```python
>>> l = [1, 6, 15, 28, 45, 66, 91]
>>> l[2:5] = ['a', 'b']
>>> l
[1, 6, 'a', 'b', 66, 91]
```

These are some of the most useful [**methods**](https://docs.python.org/3/tutorial/datastructures.html) available for lists.

| Method                                                                                      | Description                                                                                                            |
| ------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------- |
| `append(item)`                                                                              | Adds an item to the end of the list.                                                                                   |
| `extend(other_list)`                                                                        | Extends the list by appending all the items from the iterable.                                                         |
| `insert(index, item)`                                                                       | Inserts an item at a given position.                                                                                   |
| `remove(item)`                                                                              | Removes the _first_ item from the list whose value is equal to `item`.                                                 |
| `pop()`                                                                                     | Removes and returns the last item in the list.                                                                         |
| [`del statement`](https://docs.python.org/3/tutorial/datastructures.html#the-del-statement) | Removes an item from a list given its index instead of its value. Its syntax is slightly different, `del list[index]`. |
| `sort()`                                                                                    | Sorts the items of the list in place.                                                                                  |

For example,

```python
>>> l = [1, 6, 15, 28, 45, 66]
>>> l.append(91)
>>> l2 = [231, 190, 153, 120]
>>> l.extend(l2)
>>> l
[1, 6, 15, 28, 45, 66, 91, 231, 190, 153, 120]
>>> del l[4]
>>> l.remove(28)
>>> l.pop()
>>> l
[1, 6, 15, 66, 91, 231, 190, 153]
>>> l.sort()
[1, 6, 15, 66, 91, 153, 190, 231]
```

## Creating new lists

We will now take a look at some operators and functions which return new lists instead of modifying them in place.

-   When we slice a list we are returned a new list containing the requested values. For instance, `l[:]` returns _a new copy_ of the list.

    ```python
    >>> l[:]
    [1, 6, 15, 28, 45, 66, 91]
    ```

-   We can concatenate lists with the operator `+`:

    ```python
    >>> l = [1, 2]
    >>> l + [3, 4]
    [1, 2, 3, 4]
    ```

    Note that `l` keeps unmodified, as opposed to `append()`.

-   We can repeat the elements of a list with the operator `*`:

    ```python
    >>> l = ['Mirror']
    >>> l * 4
    ['Mirror', 'Mirror', 'Mirror', 'Mirror']
    ```

-   The [`sorted()`](https://docs.python.org/3/library/functions.html#sorted) function returns a new sorted list while keeping the original unaltered.

<Autors autors="adell"/>
