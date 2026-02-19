# Greeting Programs

👋 Hello, let's get started!

<img src='./programs-that-greet.png' style='height: 10em; margin-left: auto; margin-right: auto; '/>

This lesson presents some small Python programs that politely greet the user who runs them. Step by step, this lesson shows reading, writing, and assignment instructions. For now, you don't need to install anything on your computer, as the programs run directly inside this very webpage. This way, you can try them without any hassle.

## First Program

This is our first Python program:

```python
print('Hello everyone!')
```

Not very impressive, right? It only uses an instruction called `print` that writes whatever is inside the parentheses. To write texts, you need to enclose them in quotes. We say that `print` is a **writing instruction** because it makes the computer write something.

In the small app below this paragraph, you have the previous program loaded in the left window. Click the <a href='#' onclick='alert("Not this triangle! The one below (bigger).")' style='all: unset;'>▶</a> button to run it!

<PyWeb :code="`print('Hello everyone!')`" :height="200"/>

When you click the ▶ button, the Python program runs and in the right window you can see how the program greets you. You also see an indication (in green) that the program has finished.

Pretty easy, right? You have already run your first Python program! 👏👏👏

::: info Exercise

Change the greeting message and run the program again by clicking the ▶ button to try it out. If from one run to another you want to clear the right window, you can click the ⨂ button. If you have changed the program on the left (intentionally or not) and want to restore the original, click the ↻ button.

:::

::: info Important Note

I wanted to tell you that there are three important things for your learning:

1. **Try the programs!** To learn programming, you need to see how programs work.

1. **Experiment!** Don't be afraid to try new things. You won't break anything.

1. **Do the exercises!** Don't just read the solution.

:::

## Greeting with a Variable

Now let's make a program that, when greeting, writes the name of the person to greet. For now, we will assume their name is Mireia, later we will make it more personal. The program is this:

```python
name = 'Mireia'
print('Hello', name)
```

Click the ▶ button to run it:

<PyWeb :code="`name = 'Mireia'
print('Hello', name)`"  :height="250"/>

Now the program writes the message "Hello Mireia". How does it work?

This program consists of two instructions:

```python
name = 'Mireia'
print('Hello', name)
```

Each instruction in Python is written on one line. By default, the computer executes the instructions **sequentially**, that is, one after the other, starting from the top.

The first instruction, `name = 'Mireia'`, is an **assignment** and serves to store a value in a **variable**. Here, the value is the text `'Mireia'` and the variable is `name`. A variable is like a drawer in the computer's memory with a label where a piece of data is stored. In this case, the drawer has the label `name` and contains the value `'Mireia'`.

The second instruction, `print('Hello', name)`, we already know is a writing instruction. This time, it indicates that it should write the text `'Hello'` followed by the value stored in the variable `name`. Notice that to write text you need to put it in quotes, while to write the value of a variable, you write the variable identifier without quotes.

Inside a `print` instruction, you can write different elements, separating them with commas. When printed, they appear separated by spaces. The `print` also adds a newline at the end.

Because of this, when the program runs, it writes a line that says "Hello Mireia".

:::info Exercise
Change the program so that it now greets a person named Pep. Check that you did it correctly by running it again.

::: details Solution

```python
name = 'Pep'
print('Hello', name)
```

:::

:::info Exercise
Change the program so that it now greets Marta and Arnau, storing the values of both names in two variables. Check that it works well!

::: details Solution

```python
name1 = 'Marta'
name2 = 'Arnau'
print('Hello', name1, 'and', name2)
```

:::

## Greeting Asking for the Name

Now we want a more interactive program so that it greets the user more personally. For that, the program must first ask for their name and then greet them using that name. The corresponding program is this:

```python
name = input('What is your name? ')
print('Hello', name)
```

The second instruction is the same as before but the first one is different. We will explain what it does shortly. But first, see what it does. You know: click the ▶ button below to run it.

<PyWeb :code="`name = input('What is your name? ')
print('Hello', name)`"  :height="250"/>

When you run the program, a dialog box will open and ask for your name, type it in. Then, in the right window, you will see how the program writes the greeting message using the name you gave it. In fact, the entire conversation is shown in the right panel. The black text is what the computer writes, the blue text is what the user writes.

So, if when the program asks my name I say "Jordi", the program replies "Hello Jordi". Hooray! 🥳

This new program is essentially the same as the previous one but now, the value assigned to the variable `name` is not embedded inside the program, but is the result of the `input` function:

```python
name = input('What is your name? ')
```

`input` is a **reading instruction** and serves to ask the user for data. Inside the parentheses, you can write a text that is a prompt for the requested data. When Python executes an `input`, it first writes the prompt and then waits to read a line that the user enters. The value of this line is stored in the variable `name` thanks to the assignment instruction.

The second instruction of this program, as in the previous section, writes the appropriate greeting.

Notice that the important difference between the two programs is that, in the previous case, the value of the variable was always the same, while now, it is the value given by the user. In programming, it is very common to ask users for data (called **inputs**) and write results (called **outputs**) that depend on them.

As you have seen, `print` and `input` allow interaction between the computer and the user:

-   `print` allows writing,
-   `input` allows reading.

Notice that reading and writing instructions adopt the computer's point of view:

-   In a reading instruction, _the computer reads_ information that _the user writes_ (probably on the keyboard). This information is input data.

-   In a writing instruction, _the computer writes_ information that _the user reads_ (probably on the screen). This information is output data.

## Exercise

Now it's your turn 👩‍💻! Make a program that reads the names of two people and greets both. The program must ask for two names and make a single greeting to both. For example, if the first name is "Marta" and the second is "Arnau", the program should reply "Hello Marta and Arnau".

Using the previous program as a template, write the program below and run it to make sure it works well. If you get stuck (and even if you don't), click the ✎ button to see a possible solution. Click the ↻ button to restore the template.

<PyWeb
:code="`name = input('What is your name? ')
print('Hello', name)`
"
:sol="`name1 = input('First name? ')
name2 = input('Second name? ')
print('Hello', name1, 'and', name2)`
"
:height="250"
/>

I hope it wasn't too hard! When you have mastered this topic, click the tab below to go to the next lesson, where we will start seeing how to do calculations with Python.

<Autors autors="jpetit"/>