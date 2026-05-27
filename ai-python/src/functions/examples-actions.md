# Examples of actions

<img src='./examples-actions.png' style='height: 9em; float: right; margin: 2em 0 1em 1em;'/>

This lesson presents several examples of actions.

## Action to print all divisors of a number

We have already made a program that prints all the divisors of a number. It was this one:

```python
from yogi import read

n = read(int)
d = 1
while d * d < n:
    if n % d == 0:
        print(d)
        print(n // d)
    d = d + 1
if d * d == n:
    print(d)
```

Remember that this program takes advantage of the "two divisors for the price of one" trick: you only need to search for divisors of a number `n` up to `√n`, because if `d` divides `n`, then `n // d` also divides `n`, and if `d <= √n` then `n // d >= √n`.

Encapsulating this algorithm in an action is not difficult at all:

```python
def print_divisors(n):
    """Prints all the divisors of a number n > 0."""

    d = 1
    while d * d < n:
        if n % d == 0:
            print(d)
            print(n // d)
        d = d + 1
    if d * d == n:
        print(d)
```

But, if we are going to make a subprogram that performs this task, wouldn't it be nice if the numbers were printed in ascending order? Think about how to do it!

A good solution is to use two loops: one for the "small" divisors up to `√n`, and the other for the "large" divisors starting from `√n`. But to avoid losing efficiency, the second loop must search again for the "small" divisors from largest to smallest to recover the "large" ones. This algorithm could be implemented like this:

```python
def print_divisors(n):
    """Prints all the divisors of a number n > 0 in ascending order."""

    d = 1
    while d * d < n:
        if n % d == 0:
            print(d)
        d = d + 1
    if d * d == n:
        print(d)
    d = d - 1
    while d >= 1:
        if n % d == 0:
            print(n // d)
        d = d - 1
```

To test this action, it would be good to create a test set with small numbers that can present edge cases such as from 1 to 5, normal cases such as 56, and cases where the number is a perfect square such as 25 and 49, to check that its root is not repeated in the output.

## Action to print all prime factors of a number

Now consider a problem related to the previous one but with a slightly different solution: Given an integer `n` with `n` ≥ 2, print, in ascending order and without repetitions, all its prime factors. For example, for the number 42 you should print 2, 3, 7 and for the number 2772 you should print 2, 3, 7, 11 because 2772 = 2²·3²·7·11.

The header of the action that performs this task could be this:

```python
def print_prime_factors(n):
    """Prints all prime factors of a number n > 1 in strictly ascending order."""
```

A first algorithm to solve this task consists of trying to divide the number `n` by numbers `d` starting from 2. When we find that `d` divides `n`, we print `d` because it is one of its prime factors (you will soon see why) and divide `n` by `d` as many times as necessary to remove all powers of `d`. This process must be repeated until `n` is 1 (because then no more prime factors can be found), after incrementing `d`. The fact that potential divisors are handled from smallest to largest and that they are removed from the number `n` guarantees that only prime factors are printed.

This algorithm can be implemented like this inside the proposed action:

```python
def print_prime_factors(n):
    """Prints all prime factors of a number n > 1 in strictly ascending order."""

    d = 2
    while n != 1:
        if n % d == 0:
            print(d)
            while n % d == 0:
                n = n // d
        d = d + 1
```

The algorithm gives the expected results, but try it with the number 200000014: It immediately prints its prime factor 2 but takes a long time to print its other prime factor 100000007. On my computer it takes about 13 seconds (yes: 13 seconds on a computer is a lot 🐌). Couldn't it be faster?

Once again, we can use the fact that we will not find any divisor of `n` greater than its square root if we have already removed all divisors less than or equal to the square root. Therefore, instead of letting the loop search for very large divisors `d` until `n` is 1, the loop can end when `d > √n`. But be careful, the current value of `n` may still be a prime number and must be printed. This is the new version of the action with this improvement.

```python
def print_prime_factors(n):
    """Prints all prime factors of a number n > 1 in strictly ascending order."""

    d = 2
    while d * d <= n:
        if n % d == 0:
            print(d)
            while n % d == 0:
                n = n // d
        d = d + 1
    if n != 1:
        print(n)
```

Now, my computer takes 0.05 seconds to print the prime factors of 200000014. A good improvement over the previous 13 seconds!

<Authors authors="jpetit"/>