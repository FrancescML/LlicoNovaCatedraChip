# Examples of functions

<img src='./examples-functions.png' style='height: 9em; float: right; margin: 2em 0 1em 1em;'/>

This lesson presents several examples of functions. The examples include functions to calculate the factorial, determine if a number is prime, calculate the greatest common divisor, and calculate the least common multiple. Additionally, this lesson shows how to think about test cases to test functions and introduces the concept of a function's precondition.

## Factorial function

Remember ([here](/iterations/factorial.html)) that we have already written a complete program that reads a natural number and prints its factorial. It would be more convenient if the factorial calculation is done inside a function. The header could be as follows:

```python
def factorial(n):
    """Returns the factorial of a natural number n."""
```

That is, the function name is `factorial`, it has a single integer parameter named `n`, and it returns an integer. Additionally, the documentation specifies that `n` must be a natural number, since the factorial of negative integers is not well defined.

The body of the function is easy to write now that we know the algorithm:

```python
def factorial(n):
    """Returns the factorial of a natural number n."""

    f = 1
    for i in range(1, n + 1):
        f = f * i
    return f
```

This function calculates the factorial of `n` by multiplying a variable `f` by `i` for all `i` between 1 and `n` (remember that `range` does not include the last value, hence the `n + 1`). Note that `factorial(0)` returns `1`, as it should.

## Testing the factorial function

To test this function, we can write a main program that reads a number and prints its factorial. This would be enough:

```python
print(factorial(read(int)))
```

To test a single function, this may be useful, but often it is necessary to test a set of functions and perform more specific tests. In these cases, it is better to open the Python interpreter, import the program, and call the functions interactively from the interpreter. Probably the most practical way is to do a `from programa import *` where `programa.py` is the name of the file where the function has been saved.

## Test cases

Which values should we choose to test that `factorial` correctly calculates factorials? Surely we could check if the factorial of a number like 5 is 120, but that is insufficient. It is necessary to get used to also testing **edge cases**. Indeed, while many programs work correctly on "normal" values, errors usually occur on special values. These special values can be identified by considering the problem domain and the calculations of the algorithm used. In the case of factorial, the edge values would be `n` = 0 (because everyone considers the factorial of zero somewhat strange), and `n` = 1 and `n` = 2, because these are the smallest values where the loop initializations may have been chosen incorrectly.

One must develop a "nose" to identify these edge cases. Additionally, it is convenient to prepare **test cases** with a collection of inputs and their associated correct outputs and save them close to the code we have developed.

Based on what we have explained, the test cases for the factorial function would be as follows:

```python
>>> factorial(0)
1
>>> factorial(1)
1
>>> factorial(2)
2
>>> factorial(5)
120
```

## Function to determine if a number is prime or not

Now let's consider an example of a function that returns a boolean.

Remember that a natural number is **prime** if it is greater than 1 and can only be divided by two numbers: 1 and itself. Thus, the first prime numbers are 2, 3, 5, 7, 11, 13, 17, 19, ... In a previous lesson LINK!!! we developed the algorithm to determine if a number is prime or not. To make this piece more independent and reusable, we want to encapsulate that calculation in a function that, given a natural number, indicates whether it is prime or not.

The first step is to write its header:

```python
def is_prime(n):
    """Indicates whether the natural number n is prime or not."""
```

That is, the function name is `is_prime`, it has a single integer parameter named `n`, and it returns a boolean value indicating whether `n` is prime or not. Additionally, we have taken care to specify that the value of `n` must be a natural number, since determining the primality of negative integers makes no sense.

Remember that the algorithm searches for a divisor of `n` between 2 and `√n`. If it finds one, the number is not prime. If it does not find one, the number is prime. There were special cases for 0 and 1 that needed to be explicitly considered. Now, making good use of booleans and `return`, the associated function is written as follows:

```python
def is_prime(n):
    """Indicates whether the natural number n is prime or not."""

    if n <= 1:
        return False
    d = 2
    while d * d <= n:
        if n % d == 0:
            return False
        d = d + 1
    return True
```

Remember that once a `return` statement is reached in a function, it immediately returns the indicated result and does not continue executing more code (even if there is code after it or if it is inside a loop).

What test cases should we use to check the correct behavior of this function? To start, we could check that it works correctly for any prime number, for example 19. Similarly, we could check that it works well for a composite number that is a product of two primes, for example 323 (since 323 = 19·17). These two checks would give some confidence that the program works correctly for "normal" values. The edge cases of the domain should be sought for small values, like 0, 1, and 2. It would not cost anything to add 3 and 4, right? But during the explanation of the algorithm, we also saw that there were some tricky cases that were perfect squares. Therefore, it would be good to test cases like the numbers 25 and 49. Finally, it is easy to find on the Internet the list of prime numbers up to 20, so we could write a loop that prints them and check that they match this external source.

These could be the test cases we have created:

```python
>>> is_prime(19)
True
>>> is_prime(323)
False
>>> is_prime(0)
False
>>> is_prime(1)
False
>>> is_prime(2)
True
>>> is_prime(3)
True
>>> is_prime(4)
False
>>> for i in range(20): 
...     if is_prime(i): 
...         print(i)
2
3
5
7
11
13
17
19
```

Obviously, no finite test case will guarantee that the implementation is error-free, but at least having a good test case like the above gives some confidence.

## Function for the greatest common divisor

Remember that [Euclid's algorithm](/iterations/greatest-common-divisor.html) is a very efficient way to find the greatest common divisor (gcd) of two natural numbers. Since it is not uncommon to need to calculate the gcd when programming, it is convenient to have the code encapsulated inside a function. This function, let's call it `gcd`, should receive as parameters the two integers in question and should return an integer (their gcd). Therefore, we can define its header as follows:

```python
def gcd(x, y):
    ...
```

Remember that the gcd of two numbers is not well defined if any of the numbers is negative (and it is 0 when both are zero). To make it clear that the function `gcd` can only be applied to *non-negative* integers, we will add a *docstring* that specifies this:

```python
def gcd(x, y):
    """Returns the greatest common divisor of two integers x and y, with x ≥ 0 and y ≥ 0."""
```

The conditions that the inputs of a function must satisfy in order to execute correctly are called **preconditions**. It is the programmer's responsibility to verify that the values with which the functions are invoked meet their preconditions. If a precondition is not met, the effect of the function is undefined: it may work, it may not, it may hang, it may crash the program, ... or, jokingly, it may explode the computer, two kittens may die (😿😿️), a nuclear reactor may melt down (💥), ...

When programmers want to emphasize preconditions, they often use a format like the following:

```python
def gcd(x, y):
    """
    Returns the greatest common divisor of two naturals x and y.
    
    Precondition: x ≥ 0 and y ≥ 0.
    """
```

The definition of the body of the `gcd` function implements Euclid's algorithm, as we have seen before, and returns the result:

```python
def gcd(x, y):
    """Returns the greatest common divisor of two integers x and y, with x ≥ 0 and y ≥ 0."""
    
    while y != 0:
        r = x % y
        x = y
        y = r
    return x
```

Note (once again) that this function neither reads the values of `x` and `y` using `read`, nor prints its result `x` with `print`. This is because the values of `x` and `y` are received as parameters, and the result is delivered with a `return`.

Here is a possible test case to test the `gcd` function:

```python
>>> gcd(42, 56)
14
>>> gcd(461952, 116298)
18
>>> gcd(7966496, 314080416)
32
>>> gcd(24826148, 45296490)
526
>>> gcd(12, 0)
12
>>> gcd(1, 1)
1
>>> gcd(0, 0)
0
>>> gcd(0, 9)
9
```

## Function for the least common multiple

Now consider the problem of calculating the least common multiple (lcm) of two natural numbers $x$ and $y$ (assuming they are not both zero). You probably remember that

$$
    \text{lcm}(x,y) = \dfrac{x \cdot y}{\text{gcd}(x,y)}.
$$

Therefore, we can implement a `lcm` function very simply using the `gcd` function we defined earlier, as follows:

```python
def lcm(x, y):
    """Returns the least common multiple of two naturals x and y, with x + y > 0."""

    return x * y // gcd(x, y)
```

But this implementation has a weakness: if `x` and `y` are large, their product will also be large. To avoid operating with potentially large numbers, we can rewrite the previous formula as

$$
    \text{lcm}(x,y) = \dfrac{x \cdot y}{\text{gcd}(x,y)} = \dfrac{x}{\text{gcd}(x,y)} \cdot y
$$

and, taking advantage that the division of `x` by the gcd will surely be an integer (think about why!), we can write the function as follows:

```python
def lcm(x, y):
    """Returns the least common multiple of two naturals x and y, with x + y > 0."""
    
    return (x // gcd(x, y)) * y
```

This way, the numbers in the intermediate calculations do not grow as much.

<Autors autors="jpetit"/> 