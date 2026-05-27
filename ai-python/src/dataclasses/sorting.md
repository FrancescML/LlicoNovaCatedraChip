# Sorting Dataclasses

<img src='./sorting.png' style='height: 8em; float: right; margin: 0 0 1em 2em;'/>

This lesson shows how to sort lists of dataclasses.

## Sorting with `key`

Consider this simple dataclass to store a clock time:

```python
@dataclass
class Time:
    h: int
    m: int
    s: int
```

If we try to sort a list of times, Python gives an annoying error:

```python
>>> L = [Time(15,30,0), Time(14,49,59), Time(15,30,0), Time(9,0,0)]
>>> sorted(L)
TypeError: "'<' not supported between instances of 'Time' and 'Time'"
```

The reason is that dataclasses can be compared with `==` and `!=` but not with `<`, `>`, `>=`, or `<=`. Since `sorted` internally calls `<`, the error occurs.

Therefore, a first way to sort dataclasses is to use the `key` parameter of `sorted` as we had already seen in !!!Link to sort each element according to the value returned by a function. For example:

```python
def number_of_seconds(time):
    """Returns the total number of seconds in a time."""
    return time.s + time.m * 60 + time.h * 60 * 60

>>> sorted(L, key=number_of_seconds)
[Time(h=9, m=0, s=0), Time(h=14, m=49, s=59), Time(h=15, m=30, s=0), Time(h=15, m=30, s=0)]
```

## Sorting with `cmp_to_key`

Many times, projecting a value to a number to sort values is unfeasible but, given two values, it is easy to determine which should come first. In these cases, the `key` parameter of `sorted` or `sort` can be passed a comparison function through `functools.cmp_to_key`. Specifically, this comparison function must return zero if the two elements are equal, a negative value if the first is less than the second, and a positive value if the first is greater than the second.

Let's see an example (which essentially corresponds to problem [P33147](https://jutge.org/problems/P33147) from Jutge):

We need to sort a list of rectangles, each defined by its width and height. As the first criterion, rectangles should be sorted from smallest to largest by area. In case of a tie, rectangles should be sorted from largest to smallest by perimeter. In case of another tie, the rectangle with the smaller width comes first.

In the following program, the function `comparison`, given two rectangles, returns:

- a negative value if the first is less than the second,
- zero if the first is equal to the second,
- a positive value if the first is greater than the second.

The professional way to do this is to follow the order of criteria, leaving ties for later.

Then, the desired sorting is achieved with `sorted(L, key=cmp_to_key(comparison))`.

```python
from dataclasses import dataclass
from functools import cmp_to_key

@dataclass
class Rectangle:
    width: int
    height: int

def comparison(r1, r2):
    a1 = r1.width * r1.height
    a2 = r2.width * r2.height
    if a1 != a2:
        return a1 - a2
    p1 = r1.width + r1.height
    p2 = r2.width + r2.height
    if p1 != p2:
        return p2 - p1
    return r1.width - r2.width

def main():
    L = [
        Rectangle(20, 1),
        Rectangle(2, 4),
        Rectangle(6, 6),
        Rectangle(4, 9),
        Rectangle(20, 1),
        Rectangle(9, 4),
    ]
    print(sorted(L, key=cmp_to_key(comparison)))
```

<Authors authors="jpetit"/>
