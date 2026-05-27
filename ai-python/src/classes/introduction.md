# Classes and Objects

<img src='./classes.png' style='height: 8em; float: right; margin: 0 0 1em 2em;'/>

This lesson introduces how to extend structures (*dataclasses*) into classes by adding methods that implement operations. To do this, the implementation of the `Hora` class is reviewed and the concepts of class, object, and constructor are presented. Additional examples include a class for simulating the movement of a pendulum and an outline of a class system to implement a medical appointment system.


## Introduction

Remember that a **structure** is a collection of related data stored in one place, as a whole. A structure is composed of a series of fields, each with its name and type. In Python, structures are implemented with *dataclasses*. For example, this would be a structure for the time of a digital clock:

```python
@dataclass
class Hora:
    h = 0      # hour  (0..23)
    m = 0      # minute (0..59)
    s = 0      # second (0..59)
```

Also remember that you can create a new variable of type `Hora` by using the type `Hora` as a function and access its fields with the selection operation (the dot):

```python
ara = Hora(17, 45)      # quarter to six in the afternoon

print(ara.h)            # prints 17
```

When using structures, it is common to define new actions and functions around them. For example:

```python
def write_time(hora):
    print(f'{hora.h:02d}:{hora.m:02d}:{hora.s:02d}')


def increment_one_second(hora):
    hora.s += 1
    if hora.s == 60:
        hora.s = 0
        hora.m += 1
        if hora.m == 60:
            hora.m = 0
            hora.h += 1
            if hora.h == 24:
                hora.h = 0
```

Instead of having these functions and actions detached from the data, *dataclasses* allow including these operations inside the type itself:

```python
@dataclass
class Hora:
    h = 0      # hour  (0..23)
    m = 0      # minute (0..59)
    s = 0      # second (0..59)

    def write(hora):
        print(f'{hora.h:02d}:{hora.m:02d}:{hora.s:02d}')

    def increment_one_second(hora):
        hora.s += 1
        if hora.s == 60:
            hora.s = 0
            hora.m += 1
            if hora.m == 60:
                hora.m = 0
                hora.h += 1
                if hora.h == 24:
                    hora.h = 0
```

Now, `write_time` and `increment_one_second` are no longer called functions or actions, but *methods*, because they are part of the class. Unlike functions and actions, methods are not called with the value as a parameter, but are called through the selection operator (like data fields):

```python
ara = Hora(17, 45)      # quarter to six in the afternoon

ara.increment_one_second()
ara.write()
```

If you needed to define a function that increments a time by a certain number of seconds, that value would be given as a parameter to the method:

```python
@dataclass
class Hora:
    ...

    def increment_seconds(hora, seconds):
        for _ in range(seconds):
            hora.increment_one_second()
```

and it would be called like this:

```python
ara.increment_seconds(60)
```

I like to read this as a sentence with *subject*, *verb*, and *complements*: In `ara.increment_seconds(60)`, `ara` is the subject, `increment_seconds` is the verb, and `60` the complement. [That's why I've always thought object-oriented programming should be called subject-oriented programming... Well, that's just me 😔.]

I suppose at this point you realize that this notation was already used: For example, in `L.append(42)`, `L` refers to a list that has a method `append` to which we pass the parameter `42`.

Notice that `Hora` defines a type, and that this type is a class. Variables of type `Hora` are called **objects** (or **instances**) of the class `Hora`. A class is thus a kind of mold from which many objects can be created, all of the same type, but each with its own data and operations.

Thus, as if by magic, we have achieved that classes not only have fields that store data, but can have methods that represent calculations on that data. Even if only as a resource to keep programs more organized, this is already useful, but soon we will see many more advantages.


## Classes (without *dataclasses*) with constructors

When using classes, it is not common to use *dataclasses* as we did before. *Dataclasses* are simply classes specially tuned to contain data, but once methods start to be added, these decorations lose importance. Also, in Python there is the convention of using the parameter `self` as the subject of the methods.

Thus, the previous class could be written this way:

```python
class Hora:         # without @dataclass!
    h = 0          # hour  (0..23)
    m = 0          # minute (0..59)
    s = 0          # second (0..59)

    def write(self):
        print(f'{self.h:02d}:{self.m:02d}:{self.s:02d}')

    def increment_one_second(self):
        self.s += 1
        if self.s == 60:
            self.s = 0
            self.m += 1
            if self.m == 60:
                self.m = 0
                self.h += 1
                if self.h == 24:
                    self.h = 0

    def increment_seconds(self, seconds):
        for _ in range(seconds):
            self.increment_one_second()
```

Although the type of `self` could be annotated, it is usually not done because it is already understood that it is of type `Hora`, since it is part of the class `Hora`.

However, now we have lost the ability to create times by specifying their initial value: all times are initialized at midnight:

```python
hora = Hora()
hora.write()       # writes 00:00:00
```

To be able to initialize the time value, we need to define a **constructor**. A constructor is the piece of code responsible for creating an object of a class. In Python, the constructor is written as a method called `__init__` and returns nothing:

```python
class Hora:
    h = 0
    m = 0
    s = 0

    def __init__(self, hours=0, minutes=0, seconds=0):
        self.h = hours
        self.m = minutes
        self.s = seconds

    ...
```

Now times can be created through the constructor, which already has default values:

```python
midnight = Hora()
afternoon = Hora(14)
quarter_to_three = Hora(14, 45, 0)
```

The constructor can execute any kind of code. For example, it can check that the given parameters are correct:

```python
    def __init__(self, h=0, m=0, s=0):
        assert 0 <= h < 24 and 0 <= m < 60 and 0 <= s < 60
        self.h = h
        self.m = m
        self.s = s
```

In contrast, dataclasses have no way to act on the data with which objects are initialized.

Also, notice that there is no possible confusion between the names of the constructor parameters (or methods in general) and the names of the object's fields: the latter must always be prefixed by `self.`.


## Example: Class to simulate a pendulum

Next, a small class is created to simulate the movement of a pendulum:

```python
import math

class Pendulum:

    length = 0.0
    mass = 0.0
    angle = 0.0

    def __init__(self, length, mass, initial_angle):
        """Creates a pendulum"""
        self.length = length
        self.mass = mass
        self.angle = initial_angle

    def calculate_position(self, time):
        """Calculates the current position based on time and initial angle"""

        position = self.length * math.sin(self.angle)
        return position

    def simulate_movement(self, total_time, time_step):
        """Simulates the movement for a certain time."""

        time = 0
        while time <= total_time:
            # Update the angle based on time
            new_position = self.calculate_position(time)
            print(f'Time: {time} seconds, Position: {new_position} meters')

            # Advance in time
            time += time_step
```

Here is an example of use:

```python
pendulum1 = Pendulum(length=2.5, mass=0.5, initial_angle=math.radians(30))
pendulum1.simulate_movement(10, 0.5)
```


## Example: Classes for a medical appointment system

Next, we outline a rudimentary medical appointment system that manages appointment scheduling with doctors. It includes a `Doctor` class with information such as name and specialty, an `Appointment` class with a time and date for an appointment with a doctor and whether it has been completed or not, and allows scheduling, canceling, and consulting appointments, keeping track of whether appointments have been completed or not. Doctors can be added to the system to manage their availability, and appointments are organized with details of date, time, and assigned doctor. `Hora`, `Data`, `Appointment`, and `Doctor` are made with dataclasses because they only contain data. In contrast, `AppointmentSystem` has behavior, so it is made with a class.

```python
from dataclasses import dataclass

@dataclass
class Hora:
    ...

@dataclass
class Data:
    ...

@dataclass
class Doctor:
    name = ""
    specialty = ""

@dataclass
class Appointment:
    date = None
    time = None
    doctor = None
    completed = False

class AppointmentSystem:

    appointments = []
    available_doctors = []

    def __init__(self):
        self.appointments = []
        self.available_doctors = []

    def add_doctor(self, doctor):
        self.available_doctors.append(doctor)

    def schedule_appointment(self, date, time, doctor):
        if self.check_doctor_availability(doctor):
            appointment = Appointment(date, time, doctor, False)
            self.appointments.append(appointment)
            self.available_doctors.remove(doctor)
            return f'Appointment scheduled with {doctor.name} on {date} at {time}.'
        else:
            return f'{doctor.name} is not available.'

    def check_doctor_availability(self, doctor):
        return doctor in self.available_doctors

    def cancel_appointment(self, appointment):
        freed_doctor = appointment.doctor
        self.available_doctors.append(freed_doctor)
        self.appointments.remove(appointment)
        return f'Appointment canceled with {freed_doctor.name}.'

    def mark_appointment_completed(self, appointment):
        appointment.completed = True

    def consult_appointments(self):
        return self.appointments
```

Modeling the concepts and entities of a system through classes is convenient for several reasons:

- First, classes allow encapsulating the related properties and behaviors of an entity in a single structure, thus facilitating code management and organization.

- Second, the relationships between classes reflect the interactions and dependencies among the system's entities, providing a clear and structured representation of the program's logic.

- Moreover, this approach allows code reuse, since classes can be instantiated in various parts of the application, improving cohesion and maintainability of the system over time.

Together, modeling entities and relationships in classes provides a robust foundation for developing modular, understandable, and flexible applications.

<Authors authors="jpetit"/> 