# Comprehensions

Imagine we wanted a list comprising even squares such as `[0, 4, 16, 36, 64]`. One natural way to tackle this problem is the following:

```python
even_squares = []
for n in range(10):
    if n % 2 == 0:
        even_squares.append(n**2)
```

But here again, Python offers a convenient and concise feature to create lists whose syntax resembles the mathematical definition of sets:

```python
even_squares = [n**2 for n in range(10) if n % 2 == 0]
```

Multiple levels of nesting are also possible:

```python
>>> [(x, y) for x in range(3) for y in range(3) if x != y]
[(0, 1), (0, 2), (1, 0), (1, 2), (2, 0), (2, 1)]
```

We can define sets by comprehension as well. For instance, given a list we might want to generate a set of its duplicate elements.

```python
>>> input_list = ['a', 'b', 'c', 'a', 'd', 'd', 'g']
>>> duplicates = {c for c in input_list if input_list.count(c) > 1}
>>> duplicates
{'a', 'd'}
```

Another illustrative example is the generation of the set of prime numbers up to 100.

```python
>>> {x for x in range(2, 101) if all(x%y for y in range(2, min(x, 11)))}
{2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97}
```

We are taking advantage of the [`all()`](https://docs.python.org/3/library/functions.html#all) function which returns `True` if all the elements in an iterable are true. In this case, if all the modulos of `x%y` are different from 0.

Finally, in dictionaries:

```python
>>> {x: 2*x for x in range(10)}
{0: 0, 1: 2, 2: 4, 3: 6, 4: 8, 5: 10, 6: 12, 7: 14, 8: 16, 9: 18}
```

All in all, comprehensions are the quintessential example of Python principles.

> **[_The Zen of Python_](https://www.python.org/dev/peps/pep-0020/), by Tim Peters**

> Explicit is better than implicit.

> Flat is better than nested.

> Readability counts.

<Autors autors="adell"/>
