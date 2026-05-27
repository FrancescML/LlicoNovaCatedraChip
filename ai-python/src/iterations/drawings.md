# Application: Some drawings

❗️❗️❗️ It remains to verify that these programs are correct. I translated them hastily from C++ and have not tested them.


<img src='./drawings.png' style='height: 8em; float: right; margin: 2em 0 1em 1em;'/>

This lesson shows possible solutions
for a couple of exercises from the Judge:

- [P29973](https://jutge.org/problems/P29973) (Triangle)
- [P72484](https://jutge.org/problems/P72484) (Rhombus)

Both solutions naturally use the `for in range` statement. Additionally, it also shows how Python allows repeating texts.


## Exercise P29973 (Triangle)

The statement is simple:
Given a number `n`, you must write a "triangle" of size `n` with asterisks.
For example, if the input is 4,
you must write
```text
*
**
***
****
```

How can we solve it?
The fundamental observation is that the number of asterisks per line grows one by one,
from 1 up to `n`.
This suggests using a `for` with a variable, let's call it `i`,
which at all times contains the number of asterisks to write.
Thus, a first approach to the solution is:

```python
n = read(int)
for i in range(1, n + 1):
    # code to write i asterisks in one line
```

Note that in the `range` we give the value `n + 1` because we want it to go up to `n`.

Now we just need to think about what to put in the missing part.
To start, what would be a possible code to write `7` asterisks in one line?
This:

```python
for j in range(7):
    print('*', end='')
print()
```

But since we don't have to write 7 asterisks, but `i`,
what we have to do is simply replace the 7 with an `i`:

```python
for j in range(i):
    print('*', end='')
print()
```

Putting it all together, we get the solution:

```python
n = read(int)
for i in range(1, n + 1):
    for j in range(i):
        print('*', end='')
    print()
```

Notice that we have to use different control variable names, `i` and `j`, for the two `for` loops,
because one is inside the other.

Finally, for comparison, this would be the code
if we used `while` instead of `for`:

```python
n = read(int)
i = 1
while i <= n:
    j = 0
    while j < i:
        print('*', end='')
        j = j + 1
    print()
    i = i + 1
```

More complicated, right?



## Exercise P72484 (Rhombus)

The statement is similar to the previous one:
Given a number `n`, you must write a "rhombus" of size `n` with asterisks.
For example, if the input is 4,
you must write

```text
   *
  ***
 *****
*******
 *****
  ***
   *
```

At the top, although not visible,
all lines (except the middle one) have spaces to the left of the asterisks.
Here we explicitly visualize them using the symbol ␣ to highlight the spaces:

```text
␣␣␣*
␣␣***
␣*****
*******
␣*****
␣␣***
␣␣␣*
```

But the number of spaces depends on the line.
So, to start,
let's make a table to see how many spaces and how many asterisks are needed depending on `i`.
For now, let's settle with the first `n` rows:

`i` | spaces | asterisks
--- | :---: | :---:
1 | 3 | 1
2 | 2 | 3
3 | 1 | 5
4 | 0 | 7

The formulas seem clear: we need `n - i` spaces
and `2*i - 1` asterisks.
Thus, this is the interesting part of the code that writes the first `n` lines
(ignoring the `main()` and reading of `n`):

```python
for i in range(1, n + 1):
    for j in range(n - i):
        print(' ', end='')
    for j in range(2 * i - 1):
        print('*', end='')
    print()
```

Since the figure is (almost) symmetric with respect to the horizontal axis,
an easy way to draw the whole rhombus consists of copying the `for` loop as is,
but making the second `for` run from the end to the beginning
by setting a negative step:

```python
for i in range(1, n + 1):
    for j in range(n - i):
        print(' ', end='')
    for j in range(2 * i - 1):
        print('*', end='')
    print()
for i in range(n, 0, -1):
    for j in range(n - i):
        print(' ', end='')
    for j in range(2 * i - 1):
        print('*', end='')
    print()
```

Let's test this program with a 4.
We will see that the code *almost* works:
```text
   *
  ***
 *****
*******
*******
 *****
  ***
   *
```
We see that there is an extra middle line of the rhombus.
To fix it, we can simply make the second loop start at `n - 1`
instead of `n`:

```python
for i in range(1, n + 1):
    for j in range(n - i):
        print(' ', end='')
    for j in range(2 * i - 1):
        print('*', end='')
    print()
for i in range(n - 1, 0, -1):
    for j in range(n - i):
        print(' ', end='')
    for j in range(2 * i - 1):
        print('*', end='')
    print()
```

## Bonus! Repeating texts

The previous code is already correct, but could it be made simpler?

It turns out that Python already gives us a way to repeat a text without using loops:
If we multiply a text by a number $k$, the result is the text repeated $k$ times.
For example,

```text
'x' * 3         👉 'xxx'
3 * 'x'         👉 'xxx'
2 * 'pa'        👉 'papa'
'rau' * 2       👉 'raurau'
```

Taking advantage of this, the program can be written like this:

```python
from yogi import read

n = read(int)

for i in range(1, n + 1):
    print(' ' * (n - i) + '*' * (2*i-1))
for i in range(n - 1, 0, -1):
    print(' ' * (n - i) + '*' * (2 * i - 1))
```

Not only is the code shorter, it is also faster due to Python's internal workings.
This trick can be useful in some Judge exercises 😉. Try using it with the
previous triangle drawing problem!


<Authors authors="jpetit roura"/>