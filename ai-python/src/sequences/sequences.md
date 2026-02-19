# Sequences

<img src='./sequences.png' style='height: 8em; float: right; margin: 2em 0 1em 1em;'/>

So far, we have limited ourselves to writing programs that handle a few pieces of data. This lesson shows how to read and process a large amount of data obtained sequentially from input. The example used is the calculation of the average of a sequence of real numbers. Three ways to do this are shown:

- announcing the number of elements at the beginning of the input,
- indicating the end of the input with a special value, and
- letting the system automatically detect the end of the input.

To handle the last case, two new functions from the `yogi` module are introduced: `scan` and `tokens`.


## Average of a sequence of real numbers with initial counter

Suppose we want to write a program that, given many real elements, calculates their average. The number of elements to consider is given through a first integer in the input. For example, to calculate the average of 9.5, 2.5, 7, and 2, the input would be

```text
4
9.5 2.5 7 2
```

and the output should be ~~5.25~~. The first ~~4~~ indicates that four elements follow. And for the input

```text
3 4.6
19      7
```

the output should be ~~10.2~~.

Note that the elements are given one after another and can be separated by spaces or line breaks. In any case, their number is announced at the beginning. We assume that this number is not zero, because otherwise the average would not be well defined.

We already know how to read an integer by importing the `read` function from `yogi`. The effect of

```python
n = read(int)
```

is to read the next integer value from the input and store it in the integer variable `n`. Similarly, the effect of

```python
x = read(float)
```

is to read the next real value from the input and store it in the real variable `x`.

Reading data with `read` is very convenient because this function already takes care of ignoring spaces and line breaks before and after the element read.

But in this application, reading one real number is not enough; we need to read many. Specifically, since we need to read `n`, we can do it with a `for` loop. Therefore, the structure of the program that reads all the values from the input could be this:

```python
n = read(int)
for i in range(n):
    x = read(float)
```

First, the number of elements to read is read and stored in the integer variable `n`. Then, a loop is executed which, over its `n` iterations, successively reads the `n` real elements from the input, storing them in the real variable `x` at each iteration.

Obviously, the program does not calculate anything useful yet, but at least it reads all the input correctly. How to calculate the average of the read elements? Clearly, we need to sum them all and divide the sum by their number. The number of elements is known from the start: it is `n`. To find their sum, we will use a real variable `s` that starts at zero and, at each iteration, increases its value by `x`. In this way, upon exiting the loop, `s` will be the sum of all the read `x`s. This is the complete program:

```python
from yogi import read

n = read(int)
s = 0.0
for i in range(n):
    x = read(float)
    s = s + x
print(s / n)
```

Note that `s` must be a real variable because it is the sum of many real numbers. We make this clear by initializing it to `0.0`.

The body of the loop could also be written more concisely as

```python
    s = s + read(float)
```

omitting the variable `x`, but I prefer to leave the reading operation more explicit.



## Average of a sequence of real numbers with special terminator

From the user's perspective, the requirement to announce the number of elements at the beginning of the data is a bit unpleasant. Many users do not want to count first the number of elements to process before starting to provide them. In fact, at the beginning, they might not even know how many there are. An alternative would be that the data sequence ends with a special value indicating the end of the data. To be specific, let's now assume that the sequence ends with a special word: `end`. We also assume that there is at least one value, because otherwise the average would not be well defined.

For example, to calculate again the average of the numbers 9.5, 2.5, 7, and 2, the input would now be

```text
9.5
2.5
7
2
end
```

This time, the algorithm must read words sequentially (one after another) until it finds the word `end`. Likewise, it must keep the sum of the values read so far and their count. We can do it like this:

```python
from yogi import read

s = 0.0
n = 0
x = read(str)
while x != 'end':
    s = s + float(x)
    n = n + 1
    x = read(str)
print(s / n)
```

In this program,
the real variable `s` contains the sum of the values read so far.
The integer variable `n` contains the number of values read so far.
The text variable `x` contains the last word read.

Note the initializations: The values of `n` and `s` are initialized to zero since, before reading anything, the number of elements read is zero and their sum is also zero. The first `read` before the `while` loop reads the first word and stores it in `x`.

When this word is `'end'`, it will signal the end of the input, so the loop must continue iterating while `x != 'end'`. And each time the loop is entered, the sum of the values read so far must be increased by the value contained in `x`. For this, the text in `x` is converted to a real with the conversion `float(x)` and accumulated in `s`. Likewise, the number of values read must be increased by one. And before repeating the loop, a new word must be read and stored in `x` to prepare everything for the next iteration.

At the exit of the loop (when `x == 'end'`), `s` is therefore the sum of all the values read and `n` their number, so their average is `s / n`, which is printed.

You might find the structure of this loop surprising, especially the fact that the reading is before the `while` and at the end of its body, but this is the correct way to do it.



## Average of a sequence of real numbers without terminator using `scan`

The format of the previous input is still too cumbersome. In many real applications, what is needed is to read the data until there is no more. For example, to calculate now the average of the numbers 9.5, 2.5, 7, and 2, the input should be

```text
9.5
2.5
7
2
```

And that's it.

To do this, our old friend, the `read` function, is insufficient. Indeed, if `read` tries to read data when there is none, it causes an error. And, unlike the two previous situations, in this case, we have no way to know that there is no more data!

Therefore, now we must use another function from `yogi`: the `scan` function. The `scan` function is similar to `read` but when it cannot read more, it returns a special value called `None`. `None` is a value of a basic Python type also called `None` that has no other value and serves to indicate a null or undefined value.

The solution to the problem is now very similar to the previous one, but using `scan` instead of `read`, reading the numbers directly as reals instead of texts, and detecting the end of reading by comparing with `None` instead of `'end'`:

```python
from yogi import scan

s = 0.0
n = 0
x = scan(float)
while x is not None:
    s = s + x
    n = n + 1
    x = scan(float)
print(s / n)
```

A small observation: The data type returned by `scan(float)` is `None|float`, that is, the union of values of type `None` (which is only `None`) with the union of values of type `float`. Therefore, after the `scan`s, the type of `x` is `None|float`. But static type checking is very clever and can deduce that when `x is not None`, the type of `x` is `float`. For this reason, it allows us to add it to `s` (you cannot add `None` to `None|float`). Likewise, it can deduce that when `x is None`, that is, upon exiting the loop, the type of `x` is `None`. You can check this with Visual Studio Code by placing the cursor over the different occurrences of the variable `x` and letting Pylance show you its type.

The type `None|float` can also be written as `Union[None, float]` or `Optional[float]`; in all three versions it means the same.


## End of input

If we run the previous program interactively, we need to signal the end of input somehow. Otherwise, since the program cannot know that we do not want to give any more numbers, it waits to receive a new nonexistent number, the loop does not end, and the program does not print anything.

In the terminal, the way to indicate the end of input depends on the operating system:

- On Linux and Mac OS (and Unix in general), press the keys <kbd>control</kbd><kbd>d</kbd> simultaneously.

- On Windows, press the keys <kbd>control</kbd><kbd>z</kbd> simultaneously.

These key combinations indicate to the program that the input has ended, which causes `scan` to return `None` (which causes the loop to end and the average to be printed).

TODO: link If we do not run the program interactively, but pass the input from a file or from a *pipe* (see the lesson on [the terminal](/terminal/index.html)), nothing needs to be done. Simply, when the file ends, the program also ends because there is nothing more to read.

Let's take the opportunity to make another comment: The key combination <kbd>control</kbd><kbd>c</kbd> stops any program. In computer science, we call this '*killing*' the program. This combination is usually used when a program takes too long to finish, or when it '*hangs*', that is, when it seems to have entered an infinite loop and could never finish by itself. Note that if we killed the previous program instead of indicating that the input has ended, the program would stop immediately without printing anything.


## Average of a sequence of real numbers without terminator using `tokens`

An alternative way to write the previous program to calculate the average of a sequence of real numbers until the input ends is to use the `tokens` function from `yogi` instead of `scan`. The `tokens` function is always used in a `for` loop and you can imagine that it returns the list of all elements from the input (of the prescribed type), one for each iteration. It can be used like this:


```python
from yogi import tokens

s = 0.0
n = 0
for x in tokens(float):
    s = s + x
    n = n + 1
print(s / n)
```

The loop `for x in tokens(float): ...` can be read as "*for each real `x` in the input: ...*". The type of `x` is `float` because we prescribed it to `tokens`.

In the end, it turned out quite simple, right? In many cases, `tokens` will be more convenient than `scan`, in others, `scan` will be preferable. We will see more examples.




<Authors authors="jpetit"/>