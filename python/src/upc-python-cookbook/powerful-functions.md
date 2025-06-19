# Powerful functions

In this section we will take our first `fibonacci()` function and enhance it little by little as we indulge ourselves with Python features.

### Functions are **objects**

We can treat our functions as if they were any other object like a list, a string or any other. In fact, everything in Python is an object! This means we can take our `fibonacci()` function,

```python
def fibonacci(n):
    """Returns the n-th Fibonacci number."""
    a, b = 0, 1
    for i in range(n):
        a, b = b, a+b
    return a
```

and assign it to another variable

```python
>>> fib = fibonacci
>>> fib(8)
21
>>> fib is fibonacci
True
```

A good practice when writing functions is to add a [documentation string](https://docs.python.org/3/tutorial/controlflow.html#documentation-strings) in the first statement. It can be accessed by means of the `__doc__` attribute.

```python
>>> fibonacci.__doc__
'Returns the n-th Fibonacci number.'
```

### Functions can be **stored in data structures**

Given that Python functions are objects, they can be stored in data structures. Let's take this simple function as well

```python
def square(n):
    """Returns the squared number."""
    return n**2
```

and build the following list:

```python
my_functions = [fibonacci, square]
```

We can now do something like this

```python
>>> my_functions
[<function __main__.fibonacci(n)>, <function __main__.square(n)>]
>>> for function in my_functions:
...     print(function.__doc__)
Returns the n-th Fibonacci number.
Returns the squared number.
>>> my_functions[0](8)
21
>>> my_functions[1](8)
64
```

### Functions can be **passed to other functions**

This characteristic allows functions to be both the input and the output of other functions, empowering us to do something like evaluating the composition of the two functions that we have just defined

```python
def eval_composition(f, g, n):
    """Returns f(g(n))."""
    return f(g(n))
```

which works just as we would expect

```python
>>> eval_composition(square, fibonacci, 8)
441
>>> eval_composition(square, fibonacci, 8) == square(fibonacci(8))
True
```

### Functions can be **nested**

Python allows functions to be defined inside other functions. This opens the door to taking our composition function even further. Instead of returning $f(g(n))$ evaluated, we can return $f \circ g$ itself:

```python
def compose(f, g):
    """Returns the composition function of f and g."""
    def nested(n):
        """Returns the evaluation of f(g(n))."""
        return f(g(n))
    return nested
```

The trick is that `nested()` _does not exist_ outside `compose()`:

```python
>>> compose
<function __main__.compose(f, g)>
>>> nested
NameError: name 'nested' is not defined
```

It turns out that we can now call $f(g(n))$ in this natural way:

```python
>>> my_function = compose(square, fibonacci)
>>> my_function(8)
441
```

And last but not least, let's make it even more beautiful. Why don't we return the composition of an arbitrary number of functions $f_1 \circ f_2 \circ \dots \circ f_k$?

```python
def compose(functions):
    """Returns the composition of a list of functions."""
    def nested(n):
        """Magic happens."""
        for f in reversed(functions):
            n = f(n)
        return n
    return nested
```

In this upgraded version, we take a list of functions as the input and we loop over it in reverse order to do the composition.

```python
>>> my_function = compose([fibonacci, square, square])
>>> my_function(2)
987
>>> fibonacci((2**2)**2)
987
```

<!-- It is even more beautiful with `def compose(*functions)`. But maybe not worth mentioning. -->

<!-- What's the best part? It has only taken us 6 lines of code which look like pseudo-code! -->

<!-- ## Decorators

Simulate a top-down dynamic programming problem with decorators.

Develop... -->

<!-- ## Advanced topics

Python offers even more functionalities but they go beyond the scope of this *Cookbook*. If your ever feel like you need to

- use a flexible number of arguments,
- use anonymous (lambda) functions
- or decorate a given function

we encourage you to look it up in the [official tutorial](https://docs.python.org/3/tutorial/controlflow.html#defining-functions) and [reference](https://docs.python.org/3/reference/compound_stmts.html#def). -->

<Autors autors="adell"/>
