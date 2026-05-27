# References


<img src='./references.png' style='height: 8em; float: right; margin: 0 0 1em 2em;'/>

This lesson presents some important details about lists. Indeed, lists are objects that are manipulated through references, and it is important to understand what happens when references are assigned, either explicitly with the assignment operator or implicitly through parameter passing in function calls.


## Introduction to Python Tutor

To better explain the concepts in this lesson, we will use [Python Tutor](https://pythontutor.com/visualize.html#mode=edit), a system that allows you to visualize the execution of Python programs in your browser interactively.

Familiarize yourself with Python Tutor by playing with the execution of this first program that calculates the greatest common divisor of 24 and 8 using Euclid's algorithm. Explanations are provided below.


<iframe width="800" height="500" frameborder="0" src="https://pythontutor.com/iframe-embed.html#code=a%20%3D%2024%0Ab%20%3D%208%0Awhile%20a%20!%3D%20b%3A%0A%20%20%20%20if%20a%20%3E%20b%3A%0A%20%20%20%20%20%20%20%20a%20%3D%20a%20-%20b%20%0A%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20b%20%3D%20b%20-%20a%0Aprint%28a%29&codeDivHeight=400&codeDivWidth=350&cumulative=false&curInstr=0&heapPrimitives=nevernest&origin=opt-frontend.js&py=3&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe>

If you click the **Next>** button, you will see how the program executes instruction by instruction. The red arrow points to the next instruction to execute, and the green arrow points to the last executed instruction. As the program progresses, on the right you have a representation of the current memory state, where you can see the defined variables and their values. The *global frame* represents the memory space where global variables are stored.

You should have no problem understanding how the variables `a` and `b` are added to memory and how their values change.

Okay? Let's continue!


## Situation 1A

Now consider this small program:

```python
a = 2
b = a
a = a + 1
print(a)
print(b)
```

Take a moment to think about what this program prints.

Check if you guessed correctly by executing the above program instruction by instruction with Python Tutor:

<iframe width="800" height="500" frameborder="0" src="https://pythontutor.com/iframe-embed.html#code=a%20%3D%202%0Ab%20%3D%20a%0Aa%20%3D%20a%20%2B%201%20%0Aprint%28a%29%0Aprint%28b%29%0A&codeDivHeight=400&codeDivWidth=350&cumulative=false&curInstr=0&heapPrimitives=nevernest&origin=opt-frontend.js&py=3&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe>

Notice that when `2` is assigned to `a`, the variable `a` is created in memory and its content is `2`. Then, when `a` is assigned to `b`, the variable `b` is created in memory and its content becomes `2`, which is a copy of the value of `a`. When `a` is incremented, the value `2` of `a` is lost and becomes `3`, and obviously, the value of `b` does not change. Therefore, the program ends up printing ~~3 2~~.

No surprises, right?


## Situation 1B

Let's see if this surprises you a bit more! Consider an almost identical situation, but where `a` is a list and, instead of adding 1, we add an element at the end:

```python
a = [3, 2, 1]
b = a
a.append(9)
print(a)
print(b)
```

Take a moment to think about what this program prints. When you have done so, see what actually happens:

<iframe width="800" height="500" frameborder="0" src="https://pythontutor.com/iframe-embed.html#code=a%20%3D%20%5B3,%202,%201%5D%0Ab%20%3D%20a%0Aa.append%289%29%0Aprint%28a%29%0Aprint%28b%29&codeDivHeight=400&codeDivWidth=350&cumulative=false&curInstr=0&heapPrimitives=nevernest&origin=opt-frontend.js&py=3&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe>

This time, it can be seen that the list `[3, 2, 1]` is not stored directly as the content of the variable `a`, but it is stored in another space (*objects*) and the variable `a` points (with an arrow) to where it is located. This is because lists are **objects** and are manipulated through **references**. Internally, these arrows and references are stored as **memory addresses**, but that is not relevant right now.

Then, when the assignment `b = a` is made, the content of the list is not copied, but since `a` is a reference, the reference is copied (that is, the "arrow" is copied). Therefore, there are now two arrows pointing to the list `[3, 2, 1]`. Hence, this list now has two names: `a` and `b`.

Then, when `a.append(9)` is executed, the `9` is added to the end of the list referenced by `a`. Therefore, the list `[3, 2, 1]` becomes `[3, 2, 1, 9]`. But, wow!, with this, it turns out that not only `a` has changed, but also `b` has changed. Or not entirely... because, in fact, neither `a` nor `b` have changed: `a` and `b` continue to be the same reference they were, to a list that is the one that has changed. As you can see, the call `append(9)` applied to `a` changes the list referenced by `a`.

Therefore, the program prints ~~[3, 2, 1, 9] [3, 2, 1, 9]~~.

With this example, we have learned that lists are not manipulated directly, but are handled through references. Assignments between references only copy the reference, and do not copy the referred object.


## Situation 1C

Let's make a small change to the previous program:

```python
a = [3, 2, 1]
b = a[:]
a.append(9)
print(a)
print(b)
```

What does it print? See what happens:

<iframe width="800" height="500" frameborder="0" src="https://pythontutor.com/iframe-embed.html#code=a%20%3D%20%5B3,%202,%201%5D%0Ab%20%3D%20a%5B%3A%5D%0Aa.append%289%29%0Aprint%28a%29%0Aprint%28b%29&codeDivHeight=400&codeDivWidth=350&cumulative=false&curInstr=0&heapPrimitives=nevernest&origin=opt-frontend.js&py=3&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe>


Remember that slice operators return new lists. Therefore, now `b` is a reference to another object, which is a copy of the object referenced by `a`. Hence, when the `9` is added to the list referenced by `a`, the list referenced by `b` does not change.


## Exercise 1

Think about what this program prints and check it with the tutor:

```python
a = [3, 2, 1]
b = a
a[1] = 9
print(a)
print(b)
```

<iframe width="800" height="500" frameborder="0" src="https://pythontutor.com/iframe-embed.html#code=a%20%3D%20%5B3,%202,%201%5D%0Ab%20%3D%20a%0Aa%5B1%5D%20%3D%209%0Aprint%28a%29%0Aprint%28b%29&codeDivHeight=400&codeDivWidth=350&cumulative=false&curInstr=0&heapPrimitives=nevernest&origin=opt-frontend.js&py=3&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe>


## Situation 2A

Now consider this simple program that has a function (actually, an action, because it returns nothing):

```python
def f(x):
    x = 3

a = 2
f(a)
print(a)
```

Take a moment to think about what this program prints and, as usual, check if you guessed correctly by executing the above program instruction by instruction with Python Tutor:

<iframe width="800" height="500" frameborder="0" src="https://pythontutor.com/iframe-embed.html#code=def%20f%28x%29%3A%0A%20%20%20%20x%20%3D%203%0A%0Aa%20%3D%202%0Af%28a%29%0Aprint%28a%29&codeDivHeight=400&codeDivWidth=350&cumulative=false&curInstr=0&heapPrimitives=nevernest&origin=opt-frontend.js&py=3&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe>

When you run the program, you will see that a new global variable `f` is defined. This variable corresponds to the function; you don't need to pay attention to it. When `f` is called at line 5, you will see that the code starts executing the function `f`. And, just when it starts executing, a new *frame* appears representing the memory space where the local variables corresponding to this invocation of `f` are stored. Therefore, the parameter `x` receives a copy of the current value of `a`, that is, a `2`. Notice that when the assignment `x = 3` is made, the value stored in the formal parameter `x` becomes `3`, losing the `2`. However, the value of the corresponding actual parameter (`a` in the *global frame*) is not modified. Therefore, when the execution of the function `f` ends and its *frame* disappears from memory, `a` retains its original value `2`. Hence, the program prints `2`.

With this example, we have seen how, when a function is called, its formal parameters become local variables that receive a copy of the values of the corresponding actual parameters. Therefore, if the formal parameters are modified with an assignment, this change is not visible from the program that invoked them.



## Situation 2B

Now we repeat the previous situation, but with lists instead of integers:

```python
def f(x):
    x.append(9)

a = [3, 2, 1]
f(a)
print(a)
```

As always, try to think first about the output of the program and then execute the program step by step:

<iframe width="800" height="500" frameborder="0" src="https://pythontutor.com/iframe-embed.html#code=def%20f%28x%29%3A%0A%20%20%20%20x.append%289%29%0A%0Aa%20%3D%20%5B3,%202,%201%5D%0Af%28a%29%0Aprint%28a%29&codeDivHeight=400&codeDivWidth=350&cumulative=false&curInstr=0&heapPrimitives=nevernest&origin=opt-frontend.js&py=3&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe>

This time, when `f` is called, the value of the actual parameter `a` is copied to the local variable corresponding to the formal parameter `x`. This copy is made, as always, through an assignment. And since now `a` is a reference, the assignment copies the reference. Therefore, `a` and `x` reference the same list.

Then, when the `9` is added to the end of the list `x`, it becomes `[3, 2, 1, 9]`. But, wow!, with this, it turns out that not only `x` has changed, but also `a` has changed. Or not... Because, in fact, neither `x` nor `a` have changed: `x` and `a` continue to be the same reference to a list, which has changed.

Once the call to `f` finishes, `x` is lost, but `a` remains alive and continues referencing the list `[3, 2, 1, 9]`. Therefore, in this case, the program prints ~~[3, 2, 1, 9]~~.

With this example, we have learned that functions can change the values of the objects they receive as parameters.


## Exercise 2

What does this program print?

```python
def f(x):
    x = x + [9]

a = [3, 2, 1]
f(a)
print(a)
```

Check your answer with [Python Tutor](https://pythontutor.com/visualize.html#mode=edit). What is the difference with the program in Situation 2B?


## Exercise 3

Consider these two programs:

```python
def f(x):
    x = []

a = [10, 20, 30]
f(a)
```

```python
def f(x):
    x.clear()

a = [10, 20, 30]
f(a)
```

With which of the two programs does `a` become an empty list? Check your answer with [Python Tutor](https://pythontutor.com/visualize.html#mode=edit).


## Exercise 4

Consider these programs:

```python
def f(x):
    x = x + x
    print(x)

a = [2, 4, 8]
f(a)
print(a)
```

```python
def f(x):
    x = x * 2
    print(x)

a = [2, 4, 8]
f(a)
print(a)
```

```python
def f(x):
    x.extend(x)
    print(x)

a = [2, 4, 8]
f(a)
print(a)
```

What does each program print? Check your answer with [Python Tutor](https://pythontutor.com/visualize.html#mode=edit). Observe the differences.





## Summary

In Python, lists are objects. Therefore, a variable of list type does not store the content of the list directly, but only stores its reference. Consequently, when a change is applied to this list, the change is reflected directly in all its references. On the other hand, the assignment operator (`=`) does not make changes to objects, but changes the references.

As a corollary, this means that assignments to formal parameters of functions and actions do not affect the corresponding actual parameter, but mutations through methods or indexing can.

For now, this is all you need to know, but we will need to revisit this topic later.



<Authors authors="jpetit"/>