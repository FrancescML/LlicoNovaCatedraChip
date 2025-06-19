# Sets

A [`set`](https://docs.python.org/3/library/stdtypes.html#set) is an **unordered collection** of **unique** items. It can be defined in two different manners:

-   Taking all the elements from an iterable such as a string, list or tuple using the built-in `set()` constructor:

```python
    > > > set('hello')
    > > > {'e', 'h', 'l', 'o'}
    > > > set([1, 2, 2, 3])
    > > > {1, 2, 3}
```

-   Placing a comma-separated list of elements between curly braces.

```python
    > > > {2, 2, 3, 5, 7, 7, 7, 11}
    > > > {2, 3, 5, 7, 11}
```

As a sidenote, the empty set must be built with `set()` since Python interprets `{}` as an empty dictionary.

### Operators and methods

Sets support the already familiar `x in set`, `len(set)`, and `for x in set`. Since sets are unordered, there is no way to record the position of an element and thus indexing or slicing is not possible.

The `set` type is **mutable** in such a way that its contents can be changed using methods like `add()` and `remove()`.

The Python translation of fundamental operations is pretty undisguised. Let's consider the following sets,

```python
s1 = {1, 2, 3, 4}
s2 = {3, 4, 5, 6}
```

and we'll take a look at some of the most usual. For a complete outlook refer to the [Python documentation](https://docs.python.org/3/library/stdtypes.html#set). In all cases we have an operator and a method available which return a new set and are in essence equivalent.

-   **Union**: Items appearing in either

```python
    s1 | s2
    s1.union(s2)

# {1, 2, 3, 4, 5, 6}
```

-   **Intersection**: Items appearing in both

```python
    s1 & s2
    s1.intersection(s2)

# {3, 4}

```

-   **Difference**: Items appearing in `s1` but not in `s2`

```python
    s1 - s2
    s1.difference(s2)

# {1, 2}

```

-   **Symmetric difference**: Items appearing in only one set

```python
    s1 ^ s2
    s1.symmetric_difference(s2)

# {1, 2, 5, 6}

```

<Autors autors="adell"/>
