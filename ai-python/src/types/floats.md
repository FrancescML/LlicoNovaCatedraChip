# The Real Type

<img src='./float.png' style='height: 8em; float: right; margin: 2em 0 1em 1em;'/>

The type of reals in Python is written `float`. This lesson shows how real literals are written, what values real values can have, and what operations can be applied to them. Moreover, some precision problems that real data can suffer are also mentioned. Finally, a small program that manipulates real numbers is presented.

# Floating Point Numbers

The type of reals in Python is written `float`. This word comes from the term _floating point_, which is an encoding used by computers to store real numbers.

!!! Someday I'll explain them in more detail.

## Literals

The way to write reals in Python is using the usual notation with a decimal point. For example, `3.14`, `-12434.9` or `0.0`. The zero to the left or right of the decimal point can be omitted: `0.` or `.0` also represent the real number zero. Scientific notation can also be used to express very large or very small numbers. For example, Avogadro's number can be written as `6.02252e23` which equals $6.02252 · 10^{23}$.

## Values

The possible values of the real type would ideally be all real numbers (the set $\mathbb{R}$ in mathematics). Unfortunately, digital computers cannot represent all these numbers. Therefore, they only work with _approximations_ of these numbers using the floating point technique. The reason is clear: some real numbers such as 2/3 or π have an infinity of decimal digits that cannot be stored. While in many cases this is not serious, sometimes you need to be a bit careful as precision problems can occur.

## Operations

The main internal operations of the real type are the usual ones:

| symbol | operation            |
| ------ | -------------------- |
| `+`    | addition             |
| `-`    | subtraction (binary) |
| `-`    | sign change (unary)  |
| `*`    | product              |
| `/`    | integer division     |
| `**`   | exponentiation       |

Remember that dividing by zero is a programming error.

Just like for integers, reals have relational operators that return a boolean:

| symbol | operation                |
| ------ | ------------------------ |
| `==`   | equality                 |
| `!=`   | difference               |
| `<`    | strictly less than       |
| `>`    | strictly greater than    |
| `<=`   | less than or equal to    |
| `>=`   | greater than or equal to |

## Precision Problems

Since computers store real numbers in floating point, they are not always exact, they are always a sufficiently close approximation. For example, the result of `0.1 + 0.2` gives `0.30000000000000004` and not `0.3` as one would expect. And, on top of that, these small errors propagate through successive calculations!

Consequently, the basic rules of algebra are not always satisfied: When `a` and `b` are two `float`s, it may be that `a * b != b * a` 😩. Behold the tragedy:

```python
>>> 0.1 + 0.2 == 0.3
False
```

Therefore, many times comparison operations between reals need to give a small margin of safety. Thus, to know if `x` and `y` are two equal reals, instead of asking if `x == y`, it is more prudent to ask if `abs(x - y) < ε`, where `ε` is a sufficiently small value (relative to `x` and `y`), such as `1e-9` (one millionth).

## Application: Converting Degrees Celsius to Degrees Fahrenheit

The following small program shows how to convert degrees Celsius to degrees Fahrenheit (you need to multiply by 9/5 and add 32):

```python
import yogi

celcius = yogi.read(float)
farenheit = celcius * 9 / 5 + 32
print(farenheit)
```

This time, the read operation with `read` specifies that a real must be read. Therefore, the type of the variable `celcius` is `float`. The expression `celcius * 9 / 5 + 32` also returns a real, remember that integer values are automatically converted to reals when they need to operate with other reals. Therefore, the type of the variable `farenheit` is also `float`. Finally, the result is written.

In fact, to make the result written in a more elegant way, formatted texts can be used as seen below:

```python
import yogi

celcius = yogi.read(float)
farenheit = (celcius * 9 / 5) + 32
print(f'{celcius:.2f} graus Celcius són {farenheit:.2f} graus Farenheit')
```

In a formatted text, the use of the `f` tag after the `:` indicates `float` (`d` was for integers). Moreover, the `.2` indicates that the number should be written with 2 decimal digits after the decimal point.

<Autors autors="jpetit"/>
