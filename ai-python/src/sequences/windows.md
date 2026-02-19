# Windows

<img src='./sequences.png' style = 'height: 8em; float: right; margin: 2em 0 1em 1em;'/>

This lesson shows new examples of processing data sequences using the window technique that allows handling several consecutive elements of a sequence with overlaps.

# Counting pairs of repeated consecutive words

Let's consider the problem of counting how many pairs of repeated consecutive words there are in a sequence of words. For example, if the input is

```text
vela piga noia noia bossa poma poma poma noia bossa caixa bossa
```

there are three pairs of repeated consecutive words: `noia noia`, one occurrence of `poma poma` and another occurrence of `poma poma`. The repetitions of `bossa` are not relevant because they are not consecutive words.

Clearly, to solve this problem it is not enough to analyze each word of the sequence individually: pairs of words must be compared. Moreover, this must be done so that these pairs overlap: If the words are $p_1$, $p_2$, $p_3$, ... $p_n$, you must compare $p_1$ with $p_2$, $p_2$ with $p_3$, $p_3$ with $p_4$, ... You cannot skip from comparing $p_1$ with $p_2$ to comparing $p_3$ with $p_4$ because you would miss counting a possible repetition. Also, care must be taken with the case where there are few words (maybe one or none).

The way to solve this type of problem is to traverse the sequence with a pair of variables, let's call them `a` and `b`, so that `a` and `b` always represent two consecutive words. When you need to advance the variables, the new value of `a` must be `b`, and the new value of `b` must be the result of a read operation. This way they will overlap and you only need to check if they are equal or not.

This code implements the idea:

```python
r = 0               # number of repeated consecutive words read
a = scan(str)       # left part of the window
if a is not None:
    b = scan(str)   # right part of the window
    while b is not None:
        if a == b:
            r = r + 1
        a, b = b, scan(str)     # shift the window to the right
print(r)
```

The counter of repeated consecutive words is `r`. The text variables `a` and `b` always represent two consecutive words. When `a` and `b` are equal, it is clear that `r` must be incremented. The reading method is as follows:

-   First, try to read the first word into `a`. If there is no first word, nothing else needs to be done.

-   Then, try to read the second word into `b`.

-   While the word `b` exists, `a` and `b` will already be two consecutive words and can be compared. Once compared, `a` must become `b` and `b` must be a new word. The assignment `a, b = b, scan(str)` performs these two assignments, reflecting the update of the variables very concisely.

The **window technique** therefore consists of having several variables that inspect consecutive elements of the sequence with overlaps. In this case, we have used a window of two elements.

The window technique can also be used with `tokens`, but maybe it is not so explicit? Here it is:

```python
r = 0
a = scan(str)
if a is not None:
    for b in tokens(str):
        if a == b:
            r = r + 1
        a = b
print(r)
```

# Counting number of peaks

Now let's consider the problem of counting the number of peaks in a sequence of numbers. A peak is an element of the sequence that is strictly greater than its two neighboring elements. Assume there are at least two elements in the sequence.

For example, the sequence ~~5 2 4 7 6 2 2~~ has a peak at 7.

This problem can be solved with the window technique, this time with three elements:

```python
peaks = 0
a, b, c = read(float), read(float), scan(float)
while c is not None:
    if a < b > c:
        peaks = peaks + 1
    a, b, c = b, c, scan(float)
print(peaks)
```

**Exercise:** Modify the above program to properly handle sequences with only one or no elements.

And if instead of counting how many peaks there are, you only needed to know if there is any, the loop could stop as soon as the first peak is detected:

```python
there_are_peaks = False
a, b, c = read(float), read(float), scan(float)
while not there_are_peaks and c is not None:
    if a < b > c:
        there_are_peaks = True
    a, b, c = b, c, scan(float)
print(there_are_peaks)
```

<Authors authors="jpetit"/>