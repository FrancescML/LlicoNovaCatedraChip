# Functions that return more than one value

This lesson shows how functions can return more than one value and how these returned values can be used. In fact, Python functions can only return a single value, but when a tuple is returned, it can be treated as if multiple values are returned.


## Function for the minimum and maximum of two integers

In some situations, it is desirable for a function to return more than one value as a result. For example, one might want a function that, given two integers, returns both the minimum *and* the maximum. Unfortunately, functions can only return a single result. Therefore, it seems that such a function that should return two integers cannot be made.

However, although functions can only return one value, this value can be of any type, and we have already seen that some types, like tuples, allow us to store two values in just one. Therefore, the trick to returning more than one value is to return a single value, and make that value a tuple.

Then, the way to write the function that returns the minimum and maximum of two integers is as follows:

```python
def min_and_max(a, b):
    """Function that returns the minimum and maximum of two integers."""
    if a <= b:
        return (a, b)
    else:
        return (b, a)
```

The header of `min_and_max` thus reflects that the result is a tuple of two integers, and the `return`s return the pair of integers needed after comparing the two parameters.

In fact, in many contexts, Python allows omitting the parentheses to create tuples, which slightly simplifies the code:

```python
def min_and_max(a, b):
    """Function that returns the minimum and maximum of two integers."""
    if a <= b:
        return a, b     # parentheses are not needed here
    else:
        return b, a     # parentheses are not needed here
```

In the interpreter, we can check that the result of the function is a tuple:

```python
>>> min_and_max(4, 5)
(4, 5)
>>> type(min_and_max(4, 5))
<class 'tuple'>
```

But the best way to collect the result of a function that returns a tuple is to unpack it directly into variables that have the same structure. For example, it can be done like this:

```python
>>> (min_val, max_val) = min_and_max(4, 5)
>>> print(min_val)
4
>>> print(max_val)
5
```

Here, the parentheses for tuple creation can also be omitted:

```python
>>> min_val, max_val = min_and_max(4, 5)
```

In short, to make a function return multiple values, it must return a tuple. To collect the results of a function that returns a tuple, it is enough to put the names of the variables where each of these values will be assigned, separated by commas.


## Time decomposition

Remember that one of the first programs we made was the [time decomposition](/getting-started/time-decomposition.html)? The problem consisted of converting a (positive) amount of seconds `n` into hours, minutes, and seconds.

Now we can encapsulate this calculation in a function that, given the number of seconds, returns the equivalent number of hours, minutes, and seconds:

```python
def time_decomposition(n):
    """Function that converts a given number of seconds into hours, minutes, and seconds."""

    h = n // 3600
    m = (n // 60) % 60
    s = n % 60
    return h, m, s
```

Unpacking the result is easy:

```python
hours, minutes, seconds = time_decomposition(4376)
>>> print(hours, minutes, seconds)
1 12 56
```


## Adding one second to a time

Remember also that one of the first programs we made was [adding one second to a time](/conditionals/add-one-second.html)? This task can now also be turned into an independent and reusable piece of code through a function:

```python
def add_one_second(h, m, s):
    s = s + 1
    if s == 60:
        s = 0
        m = m + 1
        if m == 60:
            m = 0
            h = h + 1
            if h == 24:
                h = 0
    return h, m, s
```

Here is one possible way to use it:

```
h, m, s = 23, 59, 59                    # parentheses for tuples are not needed either
h, m, s = add_one_second(h, m, s)
print(h, m, s)
```



<Autors autors="jpetit"/> 
