# Main Program and Global Variables


<img src='./main.png' style='height: 8em; float: right; margin: 2em 0 1em 1em;'/>


## The Story

In our introduction to functions, we wrote this program:


```python
from yogi import read

def maxim2(a, b):
    """Calculates the maximum of two integers."""

    if a > b:
        m = a 
    else:
        m = b
    return m


def maxim3(a, b, c):
    """Calculates the maximum of three integers."""

    m = maxim2(maxim2(a, b), c)
    return m


# main program
a = read(int)
b = read(int)
c = read(int)
print(maxim3(a, b, c))
```

We already know that the variables `a`, `b`, and `m` in the function `maxim2` are local variables and independent from the variables `a`, `b`, and `m` in the function `maxim3`. However, the variables defined in the main program (the one starting at the comment `# main program`) are **global variables**. Global variables have the drawback that they can be accessed from anywhere in the program.

For example, the global variable `c` defined in the main program can be accessed from the function `maxim2`. This is a serious disadvantage because it means the relationship between subprograms is not limited to parameter passing: a change in a global variable far from a function can affect its behavior. Sometimes this is useful, but it creates major difficulties in understanding and maintaining even moderately large programs.

On the other hand, the global variables `a` and `b` defined in the main program cannot be accessed from the function `maxim2`. The reason is that the parameters `a` and `b` shadow them: local parameters take precedence over global variables. But if the parameter names were changed, these global variables would no longer be hidden inside the function.

Moreover, global variables can not only be accessed from functions, they can also be modified! Doing so is a bit more complicated because you need to use the `global` keyword, which we will not explain now because we don't want you to use it 😀.

In Python, there is only one way to avoid the leakage of global variables into functions and actions of a program: not having them. Therefore, it is good practice to encapsulate what would be the main program inside an action, which by convention is called `main`. Then the program would look like this:

```python
from yogi import read

def maxim2(a, b):
    """Calculates the maximum of two integers."""

    if a > b:
        m = a 
    else:
        m = b
    return m


def maxim3(a, b, c):
    """Calculates the maximum of three integers."""

    m = maxim2(maxim2(a, b), c)
    return m


def main():
    a = read(int)
    b = read(int)
    c = read(int)
    print(maxim3(a, b, c))


main()
```

As you can see, now the instructions of the former main program are inside the action `main`, which has no parameters. Consequently, the variables defined inside `main` are local variables and are not visible from other functions. This gives the program much more safety.

When doing this, however, you must be careful not to forget to call this `main` function at the end of the program. Otherwise, the program execution would do nothing!

In fact, many times it is even better to condition the call to `main()` on the program being executed as a script and not when it is loaded with an `import`. Let me explain:

If the previous program is saved in a file `functions.py`, you know you can run it with

```bash
$ python3 functions.py
```

In this case, it makes perfect sense that the program starts executing by invoking the action `main`.

But you also know that from the Python interpreter you can load programs with `import`:

```python
>>> import functions
```

In general, in this case, it is not convenient for the main program to start executing: maybe the only intention when importing this program is to have the functions `maxim2` and `maxim3` available in the interpreter. These can be invoked with calls like `functions.maxim2(23, 52)`.

To distinguish between the first and second case, you need to use the following magic:

```python
...

if __name__ == '__main__':
    main()
```

🤣! With this conditional, the `main` function will be called when the program is executed and will not be called when it is imported.


## Summary

To avoid polluting the program with global variables that can be accessed from anywhere, it is convenient to encapsulate the main program inside a `main()` action:

```python
def main():
    ...
```


To invoke this action containing the main program only when the program is executed and not when it is imported, add this code at the end of the program:

```python
if __name__ == '__main__':
    main()
```


<Autors autors="jpetit"/> 