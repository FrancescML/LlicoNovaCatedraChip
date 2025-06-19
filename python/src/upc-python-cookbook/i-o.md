# Input/Output

This section serves as an introduction to reading and writing files in Python.

## Text files

In order to manipulate a file in Python we first need to use the [`open()`](https://docs.python.org/3/library/functions.html#open) function which receives two arguments: the filename and the mode in which it is opened. The most common modes are

-   `'r'`: Open for reading (_default_).
-   `'w'`: Open for writing. Any existing file with the same name will be erased.
-   `'x'`: Open for exclusive creation. It fails if the file already exists.
-   `'a'`: Open for appending. New information is automatically appended to the end of the file.

The `open()` function returns the corresponding [file object](https://docs.python.org/3/glossary.html#term-file-object) with methods such as `read()` or `write()`. When we no longer need to manipulate the file we have to use the `close()` method.

To illustrate it, let's write some human rights into a file

```python
f = open('human-rights.txt', 'w')
f.write('1. All human beings are born free and equal in dignity and rights. They are endowed with reason and conscience and should act towards one another in a spirit of brotherhood.\n')
f.write('3. Everyone has the right to life, liberty and security of person.\n')
f.close()

f = open('human-rights.txt', 'a')
f.write('9. No one shall be subjected to arbitrary arrest, detention or exile.\n')
f.close()
```

and read them

```python
f = open('human-rights.txt', 'r')
for line in f:
    print(line, end='')
f.close()
```

```text
1. All human beings are born free and equal in dignity and rights. They are endowed with reason and conscience and should act towards one another in a spirit of brotherhood.
3. Everyone has the right to life, liberty and security of person.
9. No one shall be subjected to arbitrary arrest, detention or exile.
```

Another option is to read the full content of the file at once by means of `f.read()`. This practice should only be done when you are sure that the size of the file is small to avoid filling the memory with its content.

## Object serialization

Strings can easily be written to and read from a file. With numbers it isn't that direct since `read()` only returns strings but it is still feasible. With complex data structures such as lists or dictionaries, parsing and serializing by hand becomes a burden.

To do so, the [`pickle`](https://docs.python.org/3/library/pickle.html) module allows to serialize arbitrarily complex Python objects into a byte stream that can be recovered (or deserialized). As such, the file generated is specific to Python and cannot be opened from any other programming language.

The most useful functions in this module are `dump()` and `load()` which we will see in action in the example below:

```python
import pickle

data = {1:2, 2: [3, 4]}
f = open('example.dat', 'wb')
pickle.dump(data, f)
f.close()
```

If you take a look at the content of `'example.dat'` you will see some unintelligible binary for humans which is specific for `pickle`. Hence, when opening the files whe need to specify the mode `'b'` for binary data. In order to recover what we have saved:

```python
f = open('example.dat', 'rb')
data = pickle.load(f)
f.close()
print(data)     # to check that we have {1:2, 2: [3, 4]}
```

## JSON Files

As we have seen in a [Diving into Python](/upc-python-cookbook/first-steps.html) example, JavaScript Object Notation [(JSON)](https://en.wikipedia.org/wiki/JSON) is an standard file format that uses human-readable text to transmit data.

Whereas `pickle` is able to serialize any type of object, `json` only supports basic types, list and dictionaries. The good news is that `json` is readable, editable and interoperable between languages.

Python supports it with the built-in [`json`](https://docs.python.org/3/library/json.html) module which works pretty much like `pickle`:

```python
import json

data = {1:2, 2: [3, 4]}
f = open('example.json', 'w')
json.dump(data, f)
f.close()
```

In this case, the content of `example.json` is

```json
{
    "1": 2,
    "2": [3, 4]
}
```

and we can recover it with

```python
f = open('example.json', 'r')
data = json.load(f)
f.close()
```

<Autors autors="adell"/>
