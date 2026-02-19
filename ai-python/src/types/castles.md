# Application: Castles and Catapults

<img src='./castles.png' style='height: 8em; float: right; margin: 2em 0 1em 1em;'/>

This lesson presents a simple modeling with booleans
of the success or failure of an attack on a medieval castle.

## The Problem

A medieval castle is under siege.
We have the values of the height of the walls,
and also the height of the attackers' ladders.
Moreover, we know whether or not the attackers have catapults,
and how many large stones they can shoot.

The rules governing the success of the attack are:

- If the attackers have ladders taller than the castle walls,
  the attack succeeds.
- If the attackers have any catapult and at least ten large stones, the attack succeeds.

In any other case, the attack fails.

## The Boolean Formulation

The data we have been given can be described in Python in this form:

```python
alcada_muralles    : float      # height of the castle walls (in meters)
alcada_escales     : float      # height of the attackers' ladders (in meters)
catapultes         : bool       # indicates whether or not the attackers have any catapult
pedres             : int        # number of large stones available
```

The type of `alcada_muralles` and `alcada_escales` has been chosen as a real number
because they contain a measurement with possible decimals. The type of `pedres` has been chosen as
an integer because, precisely, it contains a natural number (you cannot have
three and a quarter large stones). The type of `catapultes` has been chosen as a
boolean, because it indicates the mere presence or absence of catapults.

Let's assume that these variables have been filled with certain data.
Now we want to calculate whether the attack succeeds or not,
and store it in a boolean variable:

```python
atac_amb_exit : bool            # indicates whether the attack on the castle succeeds
```

According to the rules described previously,
we need to use a disjunction operation (`or`)
to join the two conditions.
The first condition is the result of a comparison:
`alcada_escales > alcada_muralles`.
The second condition is the conjunction (`and`) of two requirements:
the presence of catapults and the existence of enough large stones.
Therefore, it can be written as `catapultes and pedres >= 10`.

All together, we have:

```python
atac_amb_exit = alcada_escales > alcada_muralles or (catapultes and pedres >= 10)
```

The parentheses are important to disambiguate this expression
from `(alcada_escales > alcada_muralles or catapultes) and pedres`,
which is different (and incorrect according to our rules).

<Autors autors="jpetit roura"/>
