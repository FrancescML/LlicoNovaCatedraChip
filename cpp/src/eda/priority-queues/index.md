# Priority queues

## Binary heap with recursive implementation

The priority queue is maintained as a heap in a dynamic vector. A
heap is a complete binary tree with the property that the value at
every node is smaller or equal than the values at the nodes of its
subtrees. A heap for n elements is easily implemented in
positions $1$ to $n$. An element at position $i$ with $1 \le i \le
n$ has its left child at position $2i$ if $2i \le n$, its right
child at position $2i+1$ if $2i+1 \leq n$, and its parent at
position $\lceil i/2\rceil$ if $i > 1$. For convenience, the vector
includes a position that is numbered 0 and is not used.

Below, $n$ denotes the size of the priority queue. For the
analysis, it is assumed that extending a vector by a new element
added at the end has constant cost (this is not quite true: it is
constant amortized cost).

```c++

<!--@include: ./rec.cc-->

```

## Binary heap with iterative implementation

Same as the previous version but with iterative implementation.

```c++
<!--@include: ./ite.cc-->
```

## Example

This example reads a sequence of integers and prints them back in increasing order
using a priority queue.

```c++
<!--@include: ./sample.cc-->
```

<Autors autors="jpetit"/>
