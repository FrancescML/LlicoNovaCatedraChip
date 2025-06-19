# Dictionaries

[Dictionaries](https://docs.python.org/3/library/stdtypes.html#dict) are extremely flexible data structures. They store pairs of elements where a **key** is mapped to a **value**.

Any type of object is supported as a value but, due to the implementation of dictionaries, keys must be _immutable_ (_hashable_ to be more precise). On that account, we cannot use a list as a key for instance.

As with lists, both keys and values can be heterogeneous.

### Representation

Dictionaries can be constructed in many different ways. This example taken from the Python documentation builds the exact same dictionary and is pretty self-explanatory.

```python
a = dict(one=1, two=2, three=3)
b = {'one': 1, 'two': 2, 'three': 3}
c = dict([('two', 2), ('one', 1), ('three', 3)])
d = dict({'three': 3, 'one': 1, 'two': 2})
```

<!-- Obvio l'opció del zip.
`c = dict(zip(['one', 'two', 'three'], [1, 2, 3]))` -->

### Access and update

Given a key we can efficiently access its associated value with the indexing operator `[]`:

```python
>>> d = {'a': 1, 'b': [2, 3], 'c': 'four'}
>>> d['c']
'four'
>>> d['c'] += ' hundred'
>>> d['c']
'four hundred'
```

When iterating a dictionary it is important to keep in mind that the _order_ in a dictionary is _not determined_ (but it keeps the same until we modify it). This is the most direct way to iterate it,

```python
for key in d:
    print(key, d[key])
```

which will print

```
a 1
b [2, 3]
c four
```

With the `get()` method, we can return a default value in case the key is not in the dictionary:

```python
>>> d['f']
KeyError: 'f'
>>> d.get('f', 'some default')
'some default'
```

With `del` we can erase a key, together with its information:

```python
>>> del d['c']
>>> d
{'a': 1, 'b': [2, 3]}
```

Imagine we wanted to count the number of occurrences of each word in a given text. A possible solution that uses dictionaries is

```python
text = 'some text with words and some repeated words'
d = {}
for word in text.split():
    if word in d:
        d[word] += 1
    else: # First occurrence of word
        d[word] = 1
print(d)
```

which will output

```
{'some': 2, 'text': 1, 'with': 1, 'words': 2, 'and': 1, 'repeated': 1}
```

To make our code even simpler, we can rely on the `get()` method:

```python
for word in text.split():
    d[word] = d.get(word, 0) + 1
```

<Autors autors="adell"/>
