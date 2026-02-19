# Examples

<img src='./examples.png' style='height: 8em; float: right; margin: 0 0 1em 2em;'/>

This lesson presents different examples of using lists.

## Number of elements equal to the last one

Let's consider that we want to write a program that reads a sequence of integers and writes how many of them are equal to the last one. For example, if the input is the numbers 11 21 11 45 21 13 21, the output should be 3.

This problem cannot be solved with a simple traversal as we had solved many others (well, it could be done with recursion...). However, it is easy to solve with lists.

This is the main idea of the algorithm:

- First, read all the elements of the sequence and store them in a list.

- Then, traverse the list counting the number of elements equal to the last one.

The following program implements this idea:

```python
from yogi import *

# store the entire sequence in a list
L = []
for x in tokens(int):
    L.append(x)

# count occurrences of the last element
c = 0
for x in L:
    if x == L[-1]:
        c += 1
print(c)
```

The list of integers where all the data from the sequence will be stored is `L`, which is created empty. Then, each element `x` of the input sequence is read and added to the end of `L`. Once all elements have been read, they are all in `L`. Then, for each element `x` in `L` that is equal to the last element of `L` (which is `L[-1]`), a counter `c` is incremented.

The previous program can be refactored with two functions to better structure it: one that returns the read data, and another that counts the occurrences of a given element:

```python
from yogi import *

def read_list():
    """Returns the list of all integers from the input."""

    L = []
    for x in tokens(int):
        L.append(x)
    return L

def occurrences(L, elem):
    """Returns the number of elements in L equal to elem."""

    c = 0
    for x in L:
        if x == elem:
            c += 1
    return c

def main():
    L = read_list()
    print(occurrences(L, L[-1]))

main()
```

**Advanced:** In fact, with a bit of magic, we can do the entire program in just two lines:

```python
L = list(tokens(int))  
print(L.count(L[-1]))   
```

The first line reads all the data at once, converting the sequence returned by `tokens` into a list. The second uses the `count` method that lists have to count occurrences. It's good for you to know these tricks, but you should also know how to do it without them.

## Is it a palindrome?

Let's consider that we want to write a function that, given a list of integers, tells whether it is a palindrome or not. A list is **palindromic** if it contains the same elements forwards and backwards. For example, `[7, 5, 6, 5, 7]` is a palindrome but `[3, 4, 2, 2, 5, 3]` is not.

The function header would be:

```python
def palindrome(lst):
    """Indicates whether lst is a palindrome or not."""
```

Using list comparisons and the built-in `reversed` function, the implementation is very clear and simple:

```python
def palindrome(lst):
    """Indicates whether lst is a palindrome or not."""

    return lst == list(reversed(lst))
```

However, the downside of this solution is that when the list is not a palindrome, it needs to reverse all its elements. One way to improve it would be to traverse the symmetric elements of the list from the beginning and the end, checking if they are equal or not. It could be done like this:

```python
def palindrome(lst):
    """Indicates whether lst is a palindrome or not."""

    n = len(lst)
    for i in range(n // 2):
        if lst[i] != lst[n - i - 1]:
            return False 
    return True
```

Check that this algorithm works regardless of whether the list has an even or odd number of elements. Notice carefully how symmetric elements are accessed from the middle of the list through `lst[i]` and `lst[n - i - 1]`.

Also notice how we have taken advantage of direct list access: each time accessing elements that are quite distant.

## Operations with vectors

Now let's consider that we want a function to calculate the dot product of two vectors of real numbers. Remember that the dot product of two vectors \(x=(x_1,...,x_n)\) and \(y=(y_1,...,y_n)\) with \(n\) elements is \(\sum_{i=1}^n x_i y_i\).

The header, specification, and implementation of this function could be like this:

```python
def dot_product(x, y):
    """Returns the dot product of two vectors of the same size."""

    s = 0.0
    for i in range(len(x)):
        s += x[i] * y[i]
    return s
```

Here, we have decided to represent the mathematical concept of a vector through lists of floats. This identification is very common and useful in programming. However, keep in mind that in mathematics vectors usually start at 1, while Python lists start at 0. To implement the program, we only had to translate the summation \(\sum_{i=0}^{n-1} x_i y_i\) into Python by using a loop controlled by \(i\).

Now let's consider that we also want a function to calculate the magnitude of a vector. Remember that the magnitude of a vector \(x=(x_1,...,x_n)\) of \(n\) real numbers is \(\sqrt{\sum_{i=1}^n x_i^2}\).

This would be a possible solution:

```python
import math

def magnitude(x):
    """Returns the magnitude of a vector."""

    m = 0.0
    for i in range(len(x)):
        m += x[i] * x[i]
    return math.sqrt(m)
```

But it is simpler to do it by applying the fact that the magnitude of a vector is the same as the dot product of the vector with itself. This solution reuses the previous function and is much shorter and safer:

```python
import math

def magnitude(x):
    """Returns the magnitude of a vector."""

    return math.sqrt(dot_product(x, x))
```

Isn't it great to be able to reuse code?

Now let's consider that we want a function that tells us if two vectors in \(\mathbb{R}^3\) are perpendicular or not. As you know, two vectors in space are perpendicular if and only if their dot product is zero. We just need to use `dot_product` again:

```python
def perpendicular(a, b):
    """Indicates whether two vectors are perpendicular or not."""

    return dot_product(a, b) == 0
```

However, you know that comparing floats is always risky. This implementation is more tolerant:

```python
def perpendicular(a, b):
    """Indicates whether two vectors are perpendicular or not."""

    return abs(dot_product(a, b)) < 1e-12
```

These could be some tests to check the previous functions:

```python
v1 = [1.1, 2.2, 3.3]
v2 = [0, 4.2, -2.1]
print(dot_product(v1, v2))
print(magnitude(v1))
print(perpendicular(v1, v2))
```

## Searching for a substring in a string

We already know that strings (`str`s) are similar to lists, but they are immutable. Now let's show how to solve a problem about strings by accessing their individual characters. In particular, given two strings, we want to know if the first contains the second or not. For example, `'aprofitament'` contains `'fita'` but `'margarita'` does not contain `'gata'`. This operation is very common: for example, this is what your word processor or web browser has to do when you ask it to search for some text in a document.

As usual, let's start with the function specification:

```python
def contains(text, substring):
    """Says whether text contains substring."""
```

From now on, we will assume that `text` has `n` characters and `substring` has `m` characters.

To implement the `contains` function, it is quite clear that we need to check if `substring` is found in `text` starting at some position `pos`, for some `pos` between 0 and `n - m`. Therefore, we can extract from `text` the characters between position `pos` and `pos + m` and see if any of them matches `substring`. One way to do this would be:

```python
def contains(text, substring):
    """Says whether text contains substring."""

    n, m = len(text), len(substring)
    for pos in range(n - m + 1):
        if text[pos : pos + m] == substring:
            return True
    return False
```

Notice how we have used slicing to extract a part of `text` with `text[pos : pos + m]` starting at position `pos` and with length `m`.

Unfortunately, this solution can be quite slow in practice, because many times it will be necessary to extract this part of `text` of length `m` only to find that its first character is already different from the first of `substring`. Therefore, it would be better to compare the characters one by one directly, without extraction, and stop as soon as a difference is found. This search could be delegated to a function:

```python
def contains_at(text, substring, pos):
    """Says whether text contains substring at position pos."""

    for i in range(len(substring)):
        if substring[i] != text[pos + i]:
            return False
    return True
```

And now, the second version of `contains` uses the auxiliary function we created:

```python
def contains(text, substring):
    """Says whether text contains substring."""

    n, m = len(text), len(substring)
    for pos in range(n - m + 1):
        if contains_at(text, substring, pos):
            return True
    return False
```

In fact, in the worst case, this version is still as slow as the first, but in practice it should be much faster. There are more advanced alternative algorithms that are much more efficient for solving this problem; they are probably implemented in the `in` operator that does exactly this.

<Authors authors="jpetit"/> 
