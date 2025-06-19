# Tuples

[Tuples](https://docs.python.org/3/library/stdtypes.html#tuple) allow to aggregate many values into one single name. They are in many ways similar to lists but there is one key difference: `tuple` objects are **immutable**. They are constructed with parentheses instead of square brackets,

```python
>>> t = (1, 1, 2, 5, 14, 42, 132)
```

or just separating items with commas

```python
>>> t = 1, 1, 2, 5, 14, 42, 132
>>> t
(1, 1, 2, 5, 14, 42, 132)
```

Since tuples are immutable all elements must be defined at creation time and cannot be added or removed dynamically:

```python
>>> t[0] = 0
TypeError: 'tuple object does not support item assignment'
>>> del t[0]
TypeError: 'tuple object does not support item deletion'
>>> t.append(429)
AttributeError: 'tuple object has no attribute append'
```

<Autors autors="adell"/>
