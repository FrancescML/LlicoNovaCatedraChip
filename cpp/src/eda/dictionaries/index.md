# Dictionaries

## Implementation with a hash table.

This implementation arranges the elements of the dictionary into `M` lists
implemented with vectors. The $i$-th list contains all the key/info pairs
$\langle k,x\rangle$ such that $`hash`(k) = i$. A counter `n` maintains
the number of keys that belong to the dictionary.

The average cost analysis is stated under two assumptions:

1. Given a key `k`, `hash(k)` returns a natural number in time $O(1)$.

2. The hash function _hashes uniformly_ at every new call with
   a different key.

Implicit copy constructor, assignment operator and destructor do
the job; no need to implement them. Their worst-case and
average-case cost is $O(n + M)$.

```c++

<!--@include: ./hash.cc-->

```

## Dictionary with a binary search tree (BST).

This implementation assumes that `Key` is of a comparable type.

A BST is a binary tree whose nodes store key/info pairs satisfying
the property that, for every node $u$, the key stored at $u$ is
bigger than all the keys stored at the left subtree of $u$ and
smaller than all the keys stored at the right subtree of $u$.

This implementation represents the BST through a pointer
`root` to a `Node` which contains: a key, the
associated information, a pointer to the root of the left subtree,
and a pointer to the root of the right subtree. Empty trees are
represented by the null pointer. A counter `n` is
maintained with the number of keys in the dictionary.
In the following, $h$ denotes the height of the BST
and we state the costs as a function of $h$ whenever possible.

In a randomly generated BST (where keys are inserted at uniformly
chosen positions in the order of the keys and never deleted), we
have $h = O(\log n)$ in expectation. Thus, a worst-case cost
of $O(h)$ translates to an average-case cost of $O(\log
n)$ (under this random model). In the worst-case scenario we have
$h = n$.

```c++
<!--@include: ./bst.cc-->
```

## Dictionary with an Adel'son-Vel'skiĭ-Landis tree (AVL).

This implementation contains no documentation yet. Check the
documentation for BSTs and Jordi Petit's notes.

The height of the null pointer is $-1$ and the height of a leaf is
$0$.

```c++
<!--@include: ./avl.cc-->
```

<Autors autors="jpetit"/>
