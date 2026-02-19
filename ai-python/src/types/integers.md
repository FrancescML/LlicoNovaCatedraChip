# The Integer Type

<img src='./int.png' style='height: 8em; float: right; margin: 2em 0 1em 1em;'/>

The type of integers in Python is written `int`. This lesson shows how integer literals are written, what values integer values can have, and what operations can be applied to them.

## Literals

The way to write integers in Python is by putting their digits in base 10, perhaps with a dash in front to indicate negatives. For example: `0`, `8437628`, `-15`, ... They can also be written in binary, octal, or hexadecimal (for example, `0b11111111` `0xFF` is the same as `255`) and in other exotic ways, but we will probably never need them in this course.

## Values

The possible values of the integer type are all integer numbers: 0, 1, -1, 2, -2, 3, -3,... Python does not impose any limit on the (integer) value of these numbers beyond the limit of the memory required to store them. Compared to many other programming languages, where the possible values of integers are bounded, this is a great advantage.

## Operations

The main internal operations of the integer type have already been presented through these arithmetic operators:

| symbol | operation                     |
| ------ | ----------------------------- |
| `+`    | addition                      |
| `-`    | subtraction (binary)          |
| `-`    | sign change (unary)           |
| `*`    | product                       |
| `//`   | integer division              |
| `%`    | remainder of integer division |
| `**`   | exponentiation                |

Remember that dividing by zero (with `//` or `%`) is a programming error.

We have also seen that we can compare integers through relational operators:

| symbol | operation                |
| ------ | ------------------------ |
| `==`   | equality                 |
| `!=`   | difference               |
| `<`    | strictly less than       |
| `>`    | strictly greater than    |
| `<=`   | less than or equal to    |
| `>=`   | greater than or equal to |

The result of comparing two integers is not, however, an integer: it is a logical value `True` or `False` of boolean type which we will discuss in the lesson about [booleans](booleans.html).

<Autors autors="jpetit"/>
