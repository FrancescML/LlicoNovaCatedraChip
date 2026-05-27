# Tuples

This lesson presents a first complex type: tuples. Thanks to tuples, different but related data can be grouped into one. It shows how to pack data into tuples and how to unpack them.

## Tuples for Points

Consider a Cartesian coordinate system where a point in the plane requires two coordinates: its abscissa and its ordinate. Point `p1` could be located at x = 4.5 and y = 3.25 and point `p2` could be located at x = -9.5 and y = 0.1. With what we know now, we could represent this data through four real variables:

```python
p1_x = 4.5
p1_y = 3.25
p2_x = -9.5
p2_y = 0.1
```

But you can already see that this solution is quite clumsy: Only the structure of the variable names gives us information about the data, and they have no relationship to each other. The notion of point is nonexistent!

Tuples are a solution to this problem (there are others). A tuple type value stores, in a single package (the tuple), several values (possibly of different types). The way to write tuples in Python is to write the different values that compose it between parentheses, separated by commas. Like this:

```python
>>> p1 = (4.5, 3.25)
>>> p2 = (-9.5, 0.1)
>>> p1
(4.5, 3.25)
>>> p2
(-9.5, 0.1)
>>> type(p1)
<class 'tuple'>
>>> type(p2)
<class 'tuple'>
```

Now, the variable `p1` is a tuple that groups two reals. Each member of a tuple is called a **field** and, therefore, the first field of `p1` is worth `4.5` and the second field of `p1` is worth `3.25`. If we ask for the value of `p1`, we can verify that it is worth `(4.5, 3.25)`, and if we ask for its type we can verify that it is `tuple`. Specifically, the type of `p1` is `tuple[float, float]`, that is, a tuple with two fields, both of real type. The same happens for `p2`.

Thus, the set of values of a tuple is the Cartesian product of the sets of values of its fields.

## Tuples for Magic Cards

Imagine you have to maintain information about cards from some Magic-type game. Each card has a character name (text type), a price (real type), an attack strength value and a defense value (integers between 1 and 5). We could define three cards with tuples:

```
>>> carta1 = ('Gandalf', 12.50, 3, 5)
>>> carta2 = ('Orc', 0.99, 2, 2)
>>> carta3 = ('Frodo', 50.00, 1, 1)
```

The type of these cards would be `tuple[str, float, int, int]`.

## Accessing Tuple Fields

A tuple can be manipulated as a whole or the information of each of its fields can be consulted individually. For the second case, the indexing operation (`[]`) is used, choosing the desired field:

```python
>>> carta1                      # all the tuple information
('Gandalf', 12.50, 3, 5)
>>> carta1[0]                   # the value of the first field
'Gandalf'
>>> carta1[3]                   # the value of the last field
5
```

The number of fields in a tuple can be obtained with the `len()` function:

```python
>>> len(carta1)
4
>>> len(p1)
2
```

Obviously, asking for the value of a field that doesn't exist produces an error:

```python
>>> p1[4]
IndexError: tuple index out of range
```

Beware: tuples are **immutable**: their fields cannot be modified once created. Therefore, if we want to add one unit to the x coordinate of point `p1` we cannot do

```python
>>> p1[0] = p1[0] + 1
TypeError: 'tuple' object does not support item assignment
```

What needs to be done is to create a new tuple and assign it (all of it) again to `p1` (erasing its old value):

```python
>>> p1 = (p1[0] + 1, p1[1])
>>> p1
(5.5, 3.25)
```

## Tuple Unpacking

When we create a tuple, we say we **pack** different values. For example, this code creates a tuple `p` packing two real values.

```python
>>> p = (12.4, 65.1)
```

Moreover, in Python we can also extract the values of the fields directly into individual variables. This inverse process is therefore called **unpacking**:

```python
>>> p = (12.4, 65.1)       # packing
>>> (x, y) = p             # unpacking
>>> x
12.4
>>> y
65.1
>>> type(y)
<class 'int'>
```

Obviously, to unpack, the tuple on the left must have the same number of fields as the one on the right of the assignment.

## Saving Parentheses

As we said, tuple values are written between parentheses, separated by commas. But in many contexts, the parentheses can be omitted from the code, making it lighter. Notice:

```python
>>> p = 12.4, 65.1    # we can write them without parentheses!
>>> p
(12.4, 65.1)          # but the system always shows them
```

This also applies when unpacking:

```python
>>> p = 12.4, 65.1
>>> x, y = p
>>> x
12.4
>>> y
65.1
```

That's why Pythonistas never write the swap of two variables with an auxiliary variable, but instead do

```python
a, b = b, a
```

Old computer scientists would call it a multiple assignment, but in reality it's a single assignment between tuples.

<Autors autors="jpetit"/>
