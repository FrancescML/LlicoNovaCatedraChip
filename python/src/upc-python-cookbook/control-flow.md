# Basic control flow

Without control flow a program is just a list of statements that is sequentially executed. In this section we cover how to conditionally or repeatedly execute code blocks by means of the `if`, `while` and `for` statements.

## The [`if`](https://docs.python.org/3/reference/compound_stmts.html#if) statement

For conditional execution we use the `if` statement. In order to get familiar with its syntax let's explore the following function that tells whether a given year is a leap year or not.

```python
# Leap years are those...

# Multiples of 4 that do not end with two zeros.
# And also, the years ending with two zeros such that,
# after removing these two zeros, are divisible by four.

def leap_year(year):
    if year % 4 == 0 and year % 100 != 0:
        return True
    elif year % 100 == 0 and (year//100) % 4 == 0:
        return True
    else:
        return False
```

<!-- Com a funció per estalviar e/s.
     Afegeixo però un exemple de crida a funció. -->

For instance,

```python
>>> leap_year(1800)
False
>>> leap_year(2020)
True
```

In general, `if` statements are compound statements made up of zero or more `elif` clauses and an optional `else` clause. Note that the keyword `elif` is short for _else if_.

The body of each clause needs to be indented since this is Python's way of grouping statements. The [Style Guide for Python Code](https://www.python.org/dev/peps/pep-0008/) suggests using 4 spaces per indentation level.

## The [`while`](https://docs.python.org/3/reference/compound_stmts.html#while) statement

It is used for repeated execution provided that a condition is true. Our first hands-on experience with looping in Python will be computing the greatest common divisor of two natural numbers $a$ and $b$ by means of the [Euclidean algorithm](https://en.wikipedia.org/wiki/Euclidean_algorithm).

```python
def gcd(a, b):
    while b:            # while b != 0: would be equivalent
        a, b = b, a%b
    return a
```

Note that we are taking advantage of **multiple assignment** in Python. In the statement `a, b = b, a%b`, the right-hand side is always evaluated fully before actually setting the values to the left-hand side, which can be quite useful.

## The [`for`](https://docs.python.org/3/reference/compound_stmts.html#for) statement

The `for` statement in Python differs from what you might expect if you come from C-based programming languages.

Rather than giving the programmer the ability to determine both the iteration step and halting condition, `for` loops in Python **iterate over the elements of any sequence**, in the order that they appear.
A sequence may be an iterable object, such as a string, a list, a dictionary etc.

Its readable syntax specifies the variable to be used, the sequence to loop over with the `in` keyword to link them, just as we described in the [Lists section](/upc-python-cookbook/lists.html):

```python
>>> for i in [1, 1, 2, 5, 14, 42, 132]:
...     print(i, end=' ')
1 1 2 5 14 42 132
```

When looping over integer subsequences, the [**`range()`**](https://docs.python.org/3/library/stdtypes.html#range) type is useful. Let's explore it through different examples:

| Syntax                     | Example            | Generates    |
| -------------------------- | ------------------ | ------------ |
| `range(stop)`              | `range(4)`         | [0, 1, 2, 3] |
| `range(start, stop)`       | `range(2, 4)`      | [2, 3]       |
| `range(start, stop, step)` | `range(11, 2, -3)` | [11, 8, 5]   |

Note that the stopping point is never part of the generated sequence. As a sidenote, with `range()` we do not obtain a list _per se_ but another iterable object. Its advantage is that it always takes the same small amount of memory.

If we need to convert it into a list we need to apply the constructor `list()` to it.

```python
>>> range(10)
range(0, 10)
>>> list(range(10))
[0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
```

#### Example: Fibonacci numbers

Each number in the Fibonacci sequence $F_n$ is the sum of the two numbers that precede it, starting from $F_0 = 0$ and $F_1 = 1$. That is, $F\_n = F\_{n-1} + F\_{n-2}$ for $ n > 1$, giving rise to the well-known beginning $\{0, 1, 1, 2, 3, 5, 8, 13, \dots \}$.

Let's write a piece of code such that, given $n$, it prints the $n$-$th$ Fibonacci number:

```python
def fibonacci(n):
    a, b = 0, 1
    for i in range(n):
        a, b = b, a+b
    return a
```

To illustrate some Python particularities, let's consider the following `C++` code

```c++
int main() {
    for (int i = 0; i < 5; ++i) {
        cout << i << endl;
        i = 5;  // In the first loop we force the halting condition
    }
    // cout << i << endl;
    // Would entail an error since 'i' was not declared in this scope
}
```

whose output is

```
0
```

and translate it into Python:

```python
for i in range(5):
    print(i)
    i = 5
print('We can access i:', i)
```

It is apparently equivalent until we actually execute it and dig into its intricacies:

```
0
1
2
3
4
We can access i: 5
```

In Python, any change we make to variable `i` in the suite of the `for` loop is overwritten. Moreover, we can still access `i` once the loop is finished. It is illustrative to remind that the first line of the code is equivalent to

```python
for i in [0, 1, 2, 3, 4]:
```

<!-- On a more advanced level, if you want to get a sense of what is happening behind the scenes with `for` loops you can take a look [here](https://docs.python.org/3/tutorial/classes.html#iterators). -->

### The `break` and `continue` statements

-   The [**`break`**](https://docs.python.org/3/reference/simple_stmts.html#break) statement terminates the nearest enclosing loop.

-   The [**`continue`**](https://docs.python.org/3/reference/simple_stmts.html#continue) statement, comes with no surprise. It continues with the next iteration of the loop.

<!-- Ometo el for...else

#### Example: Prime numbers

Take a look at the following code which looks for prime numbers in the interval $[2, 15]$.

```python
from math import sqrt

for n in range(2, 16):
    for d in range(2, int(sqrt(n))+1):
        if n % d == 0:
            print(n, '=', d, '*', n//d)
            break
    else:
        print(n, 'is a prime number')
```


```
2 is a prime number
3 is a prime number
4 = 2 * 2
5 is a prime number
6 = 2 * 3
7 is a prime number
8 = 2 * 4
9 = 3 * 3
10 = 2 * 5
11 is a prime number
12 = 2 * 6
13 is a prime number
14 = 2 * 7
15 = 3 * 5
```

A loop's `else` clause runs when no `break` occurs. In other words, when the loop terminates through exhaustion of the range. -->

<Autors autors="adell"/>
