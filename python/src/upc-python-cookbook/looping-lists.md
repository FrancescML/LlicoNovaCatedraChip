# Writing loops

The aim of this section is to provide with several techniques to keep your code readable, concise and _Pythonic_ when writing loops over lists and dictonaries.

## Over lists

Let's say we have the following list `items = [1, 2, 3]` and we want to print each individual item on a separate line. If you come from Java or C++ you will probably gravitate towards indexes and come up with a solution like this one

```python
i = 0
while i < len(items):
    print(items[i])
    i += 1
```

or maybe this other one

```python
for i in range(len(items)):
    print(items[i])
```

However, Python offers simplified, more readable and more efficient loops. As we mentioned before, `for` iterates directly over the elements of a sequence, so we can take advantage of that and forget about keeping track of any index.

```python
for item in items:
    print(item)
```

But, **what if we really need the index?** The [`enumerate()`](https://docs.python.org/3/library/functions.html#enumerate) function comes in handy. At each step it yields a tuple containing an automatic counter and the values obtained from the list.

```python
for info in enumerate(items):
    print(info)
```

The output will be

```
(0, 1)
(1, 2)
(2, 3)
```

We can tweak our loop a little further by means of unpacking `info` at each iteration. What is more, `enumerate()` accepts an optional argument which tells from where to start the counter.

```python
for index, item in enumerate(items, start=1):
    print(index, '->', item)
```

In this case, the output will be

```
1 -> 1
2 -> 2
3 -> 3
```

**What if we need to loop backwards?** Our first thought might be to gradually decrease the index

```python
for i in range(len(items)-1, -1, -1):
    print(items[i])
```

Nonetheless, Python offers yet another useful function [`reversed()`](https://docs.python.org/3/library/functions.html#reversed), which returns a reverse iterator and does not take up any more space than our previous less-elegant solution.

```python
for item in reversed(items):
    print(item)
```

**What if we want to loop over two lists?** Python allows us to do so with the [`zip()`](https://docs.python.org/3.3/library/functions.html#zip) function. For instance,

```python
countries = ["France", "Italy", "Germany"]
capitals = ["Paris", "Rome", "Berlin"]

for country, capital in zip(countries, capitals):
    print('{0} is the capital of {1}.'.format(capital, country))
```

will produce

```
Paris is the capital of France.
Rome is the capital of Italy.
Berlin is the capital of Germany.
```

All of these techniques are **analogous for strings and tuples** so we encourage you to try them out for yourself.

## Looping and modifying

Let's say we have the following list `l = [1, 2, 3]` and, for every number greater than 2, we want to duplicate it at the end of the list and hence obtain `l = [1, 2, 3, 2, 3]`. Find below the code that intends to do so:

```python
l = [1, 2, 3]
for n in l:
    if n >= 2:
        l.append(n)
```

<!-- ⚡ -->

The **key message** is to never modify a list while you are iterating over it! In this case, a good idea might be to loop over a copy of `l`.

## Over dictionaries

The most direct way to iterate over

```python
d1 = {'a': 1, 'b': [2, 3], 'c': 'four'}
```

is the following:

```python
for k in d1:
    print(k, ':', d[k])
```

However, to avoid looking for each value twice we can iterate directly over the key-value pairs by means of the `items()` method:

```python
for info in d1.items():
    print(info)
```

and obtain

```
('a', 1)
('b', [2, 3])
('c', 'four')
```

It is usual to unpack the tuple `info` at each iteration, just as we did with `enumerate()` when looping over lists:

```python
for k, v in d1.items():
    print(k, ':', v)
```

Similarly, if we just want to iterate over keys or values, the elegant solution is to use the `keys()` and `values()` methods:

```python
for k in d1.keys(): # for v in d1.values()
    print(k)
```

These two are in fact [views](https://docs.python.org/3/library/stdtypes.html#dict-views), which means that they are dynamic and reflect all modifications on the dictionary:

```python
>>> my_keys = d2.keys()
>>> my_keys
dict_keys(['b', 'f'])
>>> d2['g'] = 8
>>> my_keys
dict_keys(['b', 'f', 'g'])
```

As a curiosity, `keys()` and `items()` are _set-like_ since their entries are unique and we can do something like this:

```python
>>> d2 = {'b': True, 'f': (5, 6)}
>>> d1.keys() & d2.keys()
{'b'}
```

<Autors autors="adell"/>
