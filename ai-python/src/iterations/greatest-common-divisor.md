# Application: Greatest Common Divisor

<img src='./greatest-common-divisor.png' style='height: 8em; float: right; margin: 2em 0 1em 1em;'/>

This lesson shows several solutions to calculate the greatest common divisor of two numbers. All of them use iterations and require the use of conditions a bit more elaborate than those used so far.


## Definition

Given two natural numbers $x$ and $y$, their greatest common divisor $\text{gcd}(x, y)$, as the name indicates, is the largest number that divides both $x$ and $y$ exactly. For example, if $x$ is $78$ and $y$ is $66$, the common divisors are $1$, $2$, $3$, and $6$. Therefore, their greatest common divisor is $6$.

As a special case, and by definition, the greatest common divisor of $x$ and $0$ is $x$, for any $x$. In particular, the greatest common divisor of $0$ and $0$ is $0$.

One application of the greatest common divisor is fraction reduction: For example, since the greatest common divisor of $78$ and $66$ is $6$, we have

$$
    \frac{78}{66}=\frac{13·6}{11·6}=\frac{13}{11}.
$$


## First solution

How to make a program that finds the greatest common divisor of any two numbers `x` $ > 0$ and `y` $ > 0$? Notice that this number cannot be greater than `x`. Therefore, one possible method consists of checking if `x` also divides `y`; if so, we already have the result: it is `x`. Otherwise, we check if `x - 1` divides both `x` and `y`; if so, `x - 1` is the result. Otherwise, we check if `x - 2` divides both `x` and `y`; if so, `x - 2` is the result. And so on:

```python
x = read(int)
y = read(int)
d = x
while not (x % d == 0 and y % d == 0):
    d = d - 1
print(d)
```

Let's study this program carefully. The line

```python
    d = x
```

copies the value of `x` to a variable `d`, which at the end of execution will contain the greatest common divisor of `x` and `y`. Then, repeatedly, we will check if the current value of `d` is a divisor of `x` and also a divisor of `y`. If not, we subtract $1$ from the value of `d` and try again. So, what condition must the `d` we are looking for satisfy? This one:

```python
    x % d == 0 and y % d == 0
```

The operator `%` returns the remainder (what is left over) of the integer division. For example, `42%10` is $2$, because if we divide $42$ by $10$, the quotient is $4$ and $2$ remains. Consequently, the condition `x%d == 0` tells us that if we divide `x` by `d`, nothing remains. In other words, it tells us that the division is exact and, therefore, `d` divides `x`.

But we need to check that `d` divides `x` _and_ (`and` in English) also that `d` divides `y`. The operator `and` is true only when both conditions are true. For example, the condition

```python
    a % 2 == 0 and a >= 100
```

indicates whether a variable `a` contains an even number that is at least $100$.

Let's continue. When should the `while` stop? When the condition on `d` is true. Conversely, the `while` must continue _while_ the stopping condition is _not_ true. For this reason, in the `while` we use the negated condition:

```python
while not (x % d == 0 and y % d == 0): ...
```

The operator `not` is true only when the condition it applies to is false. For example,

```python
    (not a >= b)
```

and

```python
    (a < b)
```

are equivalent (although the second is more concise and therefore better).

Logically, the line

```
    d = d - 1
```

decrements the value of `d` by $1$, symmetrically to how `i = i + 1;` increments the value of `i` by $1$.

Finally, now we can understand how the whole program works. Suppose we read $78$ for `x` and $66$ for `y`. If we simulate the execution, `d` will start at $78$, then $77$, ..., until it reaches $6$, the first number that divides both $78$ and $66$. At this moment, the `while` condition will no longer hold, a $6$ will be printed, and the program will end.

This program works correctly because the loop stops when it finds the first `d` (that is, the largest `d`) that satisfies the required condition. And it will always find one, because in the worst case it will reach `d` $= 1$, which satisfies the stopping condition for any combination of `x` and `y`.

Finally, note that this code would not work if `x` could be $0$. The variable `d` would initially be $0$, and the `%` operation with second parameter $0$ would cause the program to stop with an error code, because it makes no sense to ask for the remainder of a division by $0$.


## A simplification

The `while` condition

```python
    not (x % d == 0 and y % d == 0)
```

can be simplified: Let `c1` and `c2` be two logical conditions. A fundamental law of logic, due to the mathematician De Morgan [$\small[\mathbb{W}]$](https://en.wikipedia.org/wiki/Augustus_De_Morgan), states that `not (c1 and c2)` is equivalent to `(not c1) or (not c2)`, where the operator `or` is true when at least one of its two conditions is true. In our case, `c1` is `x % d == 0` and `c2` is `y % d == 0`, so `not c1` is `x % d != 0` and `not c2` is `y % d != 0`.

Altogether, the code becomes:

```python
x = read(int)
y = read(int)
d = x
while x % d != 0 or y % d != 0:
    d = d - 1
print(d)
```



## Second solution: Euclid's algorithm

### Algorithm

<img src='./euclides.png' style='height: 8em; float: right; margin: 2em 0 1em 1em;'/>

Next, we will see how to calculate the greatest common divisor of two numbers using **Euclid's algorithm**, discovered by the classical Greeks and described by Euclid [$\small[\mathbb{W}]$](https://en.wikipedia.org/wiki/Euclid) in the book _Elements_ around 300 BC. Many historians consider it the first true algorithm. Although Euclid formulated the algorithm geometrically, here we will interpret it numerically. Essentially, the algorithm says:

> Subtract the smaller of the two numbers from the larger until they are equal; that is the solution.

Let's try this algorithm to calculate the greatest common divisor of $78$ and $66$. We will use a table with two columns. In the first row, we place the two numbers. Then, repeatedly, we look at which of the two is larger and, in the next row, subtract the smaller from the larger, leaving the smaller as is. When we reach a row with the two numbers equal, that number will be the solution:

```text
     78  66
    ---------
     12  66
     12  54
     12  42
     12  30
     12  18
     12   6
      6   6
    ---------
        6
```

### Correctness

The correctness of Euclid's algorithm is based on two properties. The first, trivial, states that $\text{gcd}(x, x) = x$. The next is more interesting:

**Property.** If $x$ and $y$ are strictly positive integers such that $x > y$, then $\text{gcd}(x,y) = \text{gcd}(x-y, y)$.

**Proof.** Any integer that divides $x$ and $y$ must also divide $x-y$. Therefore, $\text{gcd}(x,y) \le \text{gcd}(x-y, y)$. On the other hand, any integer that divides $x-y$ and $y$ must also divide $x$ and $y$. Therefore, $\text{gcd}(x-y,y) \le \text{gcd}(x, y)$.


### Implementation

This is an implementation of Euclid's algorithm in Python:

```python
# read inputs
x = read(int)
y = read(int)
# until they are equal (⟺ while they are different)
while x != y:
    # subtract the smaller number from the larger
    if x < y:
        y = y - x
    else:
        x = x - y
# print the result
print(x)
```

After reading the inputs `x` and `y`, we have a loop that stops when `x == y`. Inside the loop, where the numbers cannot be equal, we subtract the smaller number from the larger, using the comparison `x < y` to know which is which. After the loop, when the two numbers are equal, we print one of them (`x`, for example).

It should be noted that this program also does not work when one of the numbers is $0$ and the other is not, because the variables do not change and the loop runs indefinitely. When this happens, computer scientists say the program "hangs".


### Comparison

Compared to the first solution, the main advantage of Euclid's algorithm is that it generally performs fewer iterations because it advances more at each step. For example, for $78$ and $66$, the first solution makes $72$ iterations, from $78$ down to $6$, while Euclid's algorithm only makes eight (one per row in the previous table).

Nevertheless, Euclid's algorithm can still be slow for some inputs. For example, what is the greatest common divisor of $123456789$ and $1$? Try calculating it by hand with Euclid's algorithm. Or better not. Read the next section...


## Third solution: Euclid's algorithm with modulo

Consider this part of the execution table of Euclid's algorithm:

```text
     12  66
     12  54
     12  42
     12  30
     12  18
     12   6
```

How many times do we subtract $12$ from $66$? As many as the result of dividing (without decimals) $66$ by $12$, that is, $5$. Even more interesting: What final result do we get? That is, what is in the last row of the second column? It is the remainder of the integer division of $66$ by $12$, in this case $6$. This means we can go from the pair $12$ $66$ to $12$ $6$ in a single step, instead of five, if we use the remainder instead of the subtraction. This fact inspires a new, more efficient version of the algorithm:

```python
# read inputs
x = read(int)
y = read(int)
# until they are equal (⟺ while they are different)
while x != y:
    # use % to save steps
    if x < y:
        y = y % x
    else:
        x = x % y
# print the result
print(x)
```


☠️ Be careful with this program! Let's try it with $78$ and $66$, see what happens:

```text
     78  66
    ---------
     12  66
     12   6
      0   6
    error, %0
```

This is a very common phenomenon: Trying to improve a program to make it more efficient, we have broken it. Indeed, the new program quickly reaches a situation where one of the variables is $0$, tries to perform the `%` operation with $0$, and stops with an error. The program is incorrect.

So, should we settle for the slow but correct program? No: what we must do is fix the fast program. This is one possible solution:


```python
x = read(int)
y = read(int)
while y != 0:
    r = x % y
    x = y
    y = r
print(x)
```

Let's try it with $78$ and $66$:

```text
     78  66
    ---------
     66  12
     12   6
      6   0
    ---------
        6
```

To understand how it works, first suppose that `x` is the larger of the two numbers. To keep this true at each step of the program, we use an auxiliary variable `r` to store the current remainder `x%y`. Note that $0 \le $ `r` $ < $ `y`. Then, we assign the old `y` to the new `x`, and assign the remainder `r` as the new `y`. When we reach a situation where `y` is $0$, we can stop: the result is the current `x`.

And what if the initial `x` is smaller than `y`? No problem. Let's check with $66$ and $78$:

```text
     66  78
    ---------
     78  66
     66  12
     12   6
      6   0
    ---------
        6
```

The program only does one more iteration, in which it puts the two numbers in order. The rest of the execution is identical to when the numbers are given in the "correct order".

And if one of the two numbers is initially $0$ (or both)? Recall that the previous programs failed in this situation. Well, this program works perfectly, even in this case. You can easily check it yourself.

We finish this lesson with some comments about the efficiency of this last program. It can be shown that the number of iterations of the loop is bounded by five times the number of digits of the minimum between `x` and `y`. For example, if the smaller number of the two is $6789$, there will never be more than $20$ iterations, regardless of the other number. Moreover, this is a pessimistic measure: generally, the program takes even fewer steps. As an example, with the $123456789$ and $1$ example mentioned earlier, for which the subtraction algorithm would take $123456788$ steps, now the loop only executes once!


<Authors authors="jpetit roura"/>