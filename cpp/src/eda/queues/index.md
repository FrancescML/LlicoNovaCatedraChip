# Queues

## Implementation with circular buffer

The elements of the queue are stored in a circular buffer whose capacity is
fixed and set at construction time. Elements are read at position `r` and
written at position `w`. Both indexes are incremented one unit, wrapping
around when they reach the right border.

DIBUIX. FER ANIMACIÓ

```c++

<!--@include: ./buffer.cc-->

```

## Implementation with linked nodes

The elements of the queue are stored in a linked list. They enter the list in
one end-point and leave it from the other end-point. In the code, `first`
refers to the first node of the list and `last` refers to the last node of the
list. Here is a snapshot for a list with elements [1,2,3,4], where 1 is the
first element to be served (i.e., the one that entered first):

```text
first           last
↓               ↓
1 ⟶ 2 ⟶ 3 ⟶ 4 ─┤
```

In the case of an empty queue, both `first` and `last` are null. In the case
of a queue with a single element, both point to the same node.

```c++
<!--@include: ./nodes.cc-->
```

<Autors autors="jpetit roura jordic"/>
