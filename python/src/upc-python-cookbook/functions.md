# Functions

Functions are crucial when it comes to organise our workflow. In Python they are defined with the [`def`](https://docs.python.org/3/reference/compound_stmts.html#def) keyword which must be followed by the function name and the parenthised list of formal parameters. The statements that form the body of the function start at the next line and need to be indented. For example, we can encapsulate the computation of the $n$-$th$ Fibonacci number just as we did in the [previous section](/upc-python-cookbook/control-flow.html).

```python
def fibonacci(n):
    a, b = 0, 1
    for i in range(n):
        a, b = b, a+b
    return a
```

If we now call the function,

```python
>>> fibonacci(16)
987
>>> fibonacci(32)
2178309
```

If you are familiar with `C` you will realise that you don't have to specify the type of variable neither in the function input nor in the output. Indeed, Python functions **can return any object**.

Another feature that makes Python functions dazzle is that they **can return multiple values** simply put in a tuple. The way to indicate it is by commas, pretty straightforward. For instance,

```python
def two_fibonacci(n):
    a, b = 0, 1
    for i in range(n):
        a, b = b, a+b
    return a, b
```

Again, calling the function,

```python
>>> res = two_fibonacci(16)
>>> res
(987, 1597)
```

Once we have set the pillars of functions, one common question arises: <!-- **Are arguments passed by copy or by reference?** -->

### Are arguments passed by copy or by reference?

The best answer is neither. In Python you cannot control it in an _ad-hoc_ manner as in `C`.

Jordi Petit: Això no és correcte.

Arguments in functions work just as we described in the in the [names and values](/upc-python-cookbook/names-values.html) chapter. Whenever you call a function, the parameter becomes another name for the same value. If a mutable object like a list is passed, the caller will see any changes the callee makes to it.

Hence, instead of calling a function by copy or by reference, the accurate way to describe it is _by object-reference_.

As an illustration, find below 3 different pieces of code that intend to append a value to a list twice.

<!-- Estaria bé posar les diferents opcions en tabs. -->

#### Option 1

```python
def append_twice(a_list, val):
    a_list.append(val)
    a_list.append(val)

l = [1, 2]
append_twice(l, 'a')
print(l)
```

As a sidenote, if there is no return statement specified, automatically [`None`](https://docs.python.org/3/library/constants.html) is returned.

#### Option 2

```python
def append_twice(a_list, val):
    a_list = a_list + [val, val]

l = [1, 2]
append_twice(l, 'a')
print(l)
```

#### Option 3

```python
def append_twice(a_list, val):
    a_list = a_list + [val, val]
    return a_list

l = [1, 2]
l = append_twice(l, 'a')
print(l)
```

## Default arguments

In general, we want to compute the numbers of the Fibonacci sequence $F\_n = F\_{n-1} + F\_{n-2}$ with initial conditions $F_0 = 0$ and $F_1 = 1$ by default. However, we can allow some flexibility by letting $F_0 = a$ and $F_1 = b$. This idea translates directly to Python functions:

```python
def fibonacci(n, a=0, b=1):
    """Returns the n-th Fibonacci number."""
    for i in range(n):
        a, b = b, a+b
    return a
```

With a single argument, the result of the function call is identical to before,

```python
>>> fibonacci(3)
2
```

But we can now explore more sequences. The arguments can also be specified by its name and in this case the order does not matter.

```python
>>> fibonacci(3, 1, 4)
9
>>> fibonacci(b=4, a=1, n=4)
9
```

More advanced capabilities of functions are detailed in the [Powerful functions](/upc-python-cookbook/powerful-functions.html) section.

<!-- ⚡ **Warning!**
Add example when modifying mutable default argument values. Need to use None!! -->

<!-- Omit Flexible arguments -->

<Autors autors="adell"/>
