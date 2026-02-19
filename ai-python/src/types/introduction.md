# Data Types: Introduction

This lesson introduces the concept of data types and type systems.

## Concept of Data Types

In Python, each value is of a type. For example, the value `38` is of integer type (`int`), the value `3.14` is of real type (`float`), and the value `'Coldplay'` is of text type (`str`). We can see the type of a value using `type()` in the interpreter:

```python
>>> type(38)
<class 'int'>
>>> type(3.14)
<class 'float'>
>>> type('Coldplay')
<class 'str'>
```

In Python, the type of a variable is the type of the value that the variable has at that moment. For example:

```python
>>> x = 12
>>> type(x)
<class 'int'>
>>> y = 'Star Wars'
>>> type(y)
<class 'str'>
>>> y = x
>>> type(y)
<class 'int'>
```

As seen with the variable `y`, the type of a variable in Python can change over time. This usually introduces problems and, therefore, it is better to avoid it.

In computer science, a **data type** (or, simply, a **type**) defines a set of possible values and a set of possible operations. For example, the integer type has as possible values all integer numbers and as possible operations addition, subtraction, multiplication, etc.

## Literals

**Literals** are the constant values of a certain type that are written in programs. For example, `38` is an integer literal and `3.14` is a real literal.

## Type System

Programming languages (such as Python) have a **type system** that ensures that the operations applied to data are of the appropriate type. If they are, the operations will be carried out. If they are not, perhaps an automatic conversion will be introduced before carrying them out or, simply, they will not be executed and will give rise to a **type error**.

Let's see some examples:

- The type system regulates that the sum of two integers is an integer. Therefore the sum of the integer 3 and the integer 4 corresponding to `3 + 4` gives rise to the integer 7.

- Similarly, Python's type system indicates that the sum of two texts is the text resulting from the concatenation of the first with the second. Therefore, `'Cold' + 'play'` gives the text `'Coldplay'`.

- However, Python prohibits adding a text and an integer: If we try to execute `'Marta' + 1`, there will be a type error, reflected by the message ~~TypeError: can only concatenate str (not "int") to str~~.

- On the other hand, the product between a text and an integer is possible: `'ma' * 2` is `'mama'`.

- Finally, the type system indicates that the sum of an integer and a real is a real, automatically converting the integer to a real. Then `2 + 1.5` is the same as `2.0 + 1.5` which is the real `3.5`.

The objective of the type system rules is to decrease the possibility of errors in programs. However, type rules change from one programming language to another.

## Python's Basic Types

Next we will present four basic Python types:

- [The integer type](/types/integers) (`int`)
- [The real type](/types/reals) (`float`)
- [The text type](/types/texts) (`str`)
- [The boolean type](/types/booleans) (`bool`)

There are other basic types and also complex types, which we will see later. For now, in this course we have been working mainly with integers, we have used reals and texts in passing, and we have used booleans without realizing it.

Let's continue!

<Autors autors="jpetit"/>
