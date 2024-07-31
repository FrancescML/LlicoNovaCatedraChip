# Graphs

In this lesson we consider directed graphs (without weights) represented with
adjacency lists. We first present how to encode them in an easy way in C++ and
then show the implementation of several basic graph algorithms.

## Graph representation

In the following, we assume that directed graphs are represented through
**adjacency lists**: For each node, we have an (unordered) list of its
succesors. For simplicity, we assume that the nodes (also known as
_vertices_) are identified with integers from 0 up to $n-1$, where $n$ is the
total number of nodes in the graph. Consequently, nodes and graphs can simply
be declared like this:

```c++
using node = int; // nodes are represented by indices from 0
using AdjacencyList = vector<node>; // the adjacency list of one node (arcs to successor nodes)
using Graph = vector<AdjacencyList>; // the complete adjacency list for all nodes in the graph
```

The outter vector of the `Graph` type stores, for each node,
an adjacency list. This adjacency list is stored as a vector of
nodes. As an example, the graph

TODO:

```
<script type="text/coffeescript" src="sample.coffee"></script>
<div style='display: flex;'>
<div id="div-graph-sample" class="figura" style="flex: 75%; height: 200px; margin-bottom: 2em;">
</div>
<div class="figura" style='flex: 25%; height: 200px; padding: 20px;' >
<p><small>Layout:</small></p>
<button style='width: 10em;' onclick='window.cy.layout({ name: "random" }).run();'>Random</button><br/>
<button style='width: 10em;' onclick='window.cy.layout({ name: "circle" }).run();'>Circle</button><br/>
<button style='width: 10em;' onclick='window.cy.layout({ name: "concentric" }).run();'>Concentric</button><br/>
<button style='width: 10em;' onclick='window.cy.layout({ name: "cose" }).run();'>Springs</button><br/>
</div>
</div>
```

can be defined as

```c++
Graph G = {{2, 3}, {4, 2}, {3}, {2}, {1, 3, 5}, {0, 1}};
```

Observe that we do not add contraints on the order of the nodes in the
adjacency lists —even though this could make sense in some settings. However,
we do not allow repetitions (this would mean multiple arcs) nor self-loops.

This representations has the following interesting properties:

-   The number of nodes in a graph `G` is `G.size()`.
-   The out-degree of node `u` in a graph `G` is `G[u].size()`.
-   One can iterate through all nodes `u` in a graph `G`
    using a `for (node u = 0; u < G.size(); ++u)` loop.
-   One can iterate through all succesors `v` of a node `u` in a graph `G`
    using a `for (node v : G[u])` loop.
-   It is possible to set attributes or properties of the nodes through additional vectors.

In the following, $n$ denotes the number of nodes of a directed graph, and $m$
denotes its number of arcs. Therefore, the size of the graph is $\O(m+n)$.
Consequently, algorithms of cost $\O(m+n)$ are linear time algorithms.

All given algorithms are given for directed graphs, but work all the same
in directed graphs when each edge is given as two symmetric arcs.
As an example, the undirected graph

TODO:

```
<script type="text/coffeescript" src="undirected-sample.coffee"></script>
<div style='display: flex;'>
<div id="div-graph-undirected-sample" class="figura" style="flex: 75%; height: 200px; margin-bottom: 2em;">
</div>
<div class="figura" style='flex: 25%; height: 200px; padding: 20px;' >
<p><small>Layout:</small></p>
<button style='width: 10em;' onclick='window.cy22.layout({ name: "random" }).run();'>Random</button><br/>
<button style='width: 10em;' onclick='window.cy22.layout({ name: "circle" }).run();'>Circle</button><br/>
<button style='width: 10em;' onclick='window.cy22.layout({ name: "concentric" }).run();'>Concentric</button><br/>
<button style='width: 10em;' onclick='window.cy22.layout({ name: "cose" }).run();'>Springs</button><br/>
</div>
</div>
```

can be defined as

```c++
Graph G = {{1, 2}, {2, 0, 3}, {0, 1, 4}, {1, 4}, {3, 2}};
```

In the following, some algorithms need the notion of an unknown natural or node
value. To do so, we shall use the following `None` constant:

```c++
const int None = -1;
```

## Simple traversal

The following code snippet shows how to traverse each node in
a directed graph and how to traverse its succesors in order to
print them.

```c++
<? include "pages/eda/graphs/traversal.cc"; ?>
```

Applying this code to the first sample graph above would produce this output:

```c++text
0: 2 3
1: 4 2
2: 3
3: 2
4: 1 3 5
5: 0 1
```

## Depth-first search ordering (recursive)

**Depth-first search** (**DFS**) is an algorithm for traversing or searching a graph.
It starts from each node in the graph and explores as far as possible along
each branch before backtracking.

The following code returns a DFS ordering of the nodes of a given graph
`G = (V,E)`. This DFS implementation uses recursion and needs to keep track of
the subset `S ⊆ V` of nodes that have already been **visited**. Starting from an
empty ordering in a list `L`, it adds each new visited node to the end of `L`
and recursively visits all its unvisited succesors.

The subset of visited nodes `S` is represented as a vector of booleans that
tells, for each of the `n` possible nodes, whether they are in `S` or not.
Using a `set<int>` for `S` would be overkill. The returned DFS ordering is a
list of nodes. For efficiency reasons, one could prefer using a vector of
nodes, as the only necessary operation is to push nodes at its end.

```c++
<? include "pages/eda/graphs/dfs-rec.cc"; ?>
```

Applying this code to the first sample graph above produces
`[0, 2, 3, 1, 4, 5]`.

The running time is $\O(m+n)$, which is linear in the size of the graph.

**🤔 Exercice:** How would you modify this program to check
if an undirected graph is connected? (An undirected graph
is connected if there is a path between any pair of its nodes.)

## Depth-first search ordering (iterative)

One may change the previous `dfs_from()` function to work in a iterative rather
than recursive way. In this case, a stack of nodes `s` is used to keep track
of the nodes that have already been found and their order.

```c++
<? include "pages/eda/graphs/dfs-ite.cc"; ?>
```

Applying this code to the first sample graph above produces `[0, 3, 2, 1, 4,
5]`. You should think why this DFS ordering is different from the DFS ordering
in the recursive implementation and why both are valid.

The running time is still $\O(m+n)$.

## Breadth-first search ordering

**Breadth-first search** (**BFS**) is an algorithm for traversing or searching
a graph. It starts from each node of the graph and explores the succesor
nodes first, before moving to the next level of succesors.

The following code returns a BFS ordering of the nodes of a given graph. The
BFS implementation uses a queue of nodes. It also needs to keep track of the
subset of nodes `Q ⊆ V` that have already **enqueued** (🧠remember: _enqueued_
for BFS and _visited_ for DFS).

```c++
<? include "pages/eda/graphs/bfs.cc"; ?>
```

Applying this code to the above sample graph produces `[0, 2, 3, 1, 4, 5]`.

The running time is $\O(m+n)$.

**🤔 Exercice:** How would you modify this program to check
if an undirected graph is connected?

## Minimum distance from a source node

The following code performs a breadth-first search on an undirected graph in
order to compute the minimum distance (number of hops) from a given source
node to all other nodes in the graph. The input is the graph `G` and the
source node `s` (with `0 ≤ s < G.size`), and the returned value is a vector
with the distances from `s` for all nodes in the graph. In the case that some
node is not reachable from `s`, the computed distance is the special value
`None` (defined as `-1` through a constant).

The implementation is based on BFS. It starts from `s` and runs until all
reachable nodes have been enqueued. For each node, we keep its distance from
`s` in `d`, which is initialized to `None` values, to reflect unreachableness.
We do not need to use a subset `Q` to tell whether a node has been
enqueued or not because `d` can be used for that same purpouse.
Its running time is $\O(m+n)$.

```c++
<? include "pages/eda/graphs/min-dist.cc"; ?>
```

Applying this code to the initial sample graph from source node `1` produces
`[3, 0, 1, 2, 1, 2]`.

You may think how to modify this function to get the minimum distance
between a source node and a target node.

**🤔 Exercice:** How would you modify this program to compute
the minimum distance from a source node `s` to a target node `t`?

## Topological ordering

A **topological ordering** of an acyclic directed graph is a linear ordering
of its nodes such that for every directed edge $(u,v)$ from node $u$ to node
$v$, $u$ comes before $v$ in the ordering.

Given a directed acyclic graph, the following algorithm returns a topological
ordering if its nodes. To do so, at step 1, we count the in-degree of all
nodes. Then, at step 2, we place all nodes with in-degree zero in some
container. In this implementation, the chosen container is a stack, but any
other fast data structure would do. Finally, at step 3, the nodes are
extracted from the container and placed at the end of the ordering, as they
have in-degree zero. Moreover, since they can be cosidered “done”, they can
discount one unit to the in-degree of their succesors and, when their
in-degree becomes zero, they are placed in the container, as all their
dependencies have been fulfilled.

```c++
<? include "pages/eda/graphs/topo-sort.cc"; ?>
```

As an exemple, the previous algorithm ran on the next DAG produces
the `[1, 3, 0, 2, 5, 4]` topological ordering.

TODO:

```
<script type="text/coffeescript" src="dag.coffee"></script>
<div style='display: flex;'>
<div id="div-graph-dag" class="figura" style="flex: 75%; height: 200px; margin-bottom: 2em;">
</div>
<div class="figura" style='flex: 25%; height: 200px; padding: 20px;' >
<p><small>Layout:</small></p>
<button style='width: 10em;' onclick='window.cy2.layout({ name: "random" }).run();'>Random</button><br/>
<button style='width: 10em;' onclick='window.cy2.layout({ name: "circle" }).run();'>Circle</button><br/>
<button style='width: 10em;' onclick='window.cy2.layout({ name: "concentric" }).run();'>Concentric</button><br/>
<button style='width: 10em;' onclick='window.cy2.layout({ name: "cose" }).run();'>Springs</button><br/>
</div>
</div>
```

The running time is $\O(m+n)$.

**🤔 Exercice:** How would you modify this program to check
that the given directed graph is really acyclic?

## Strongly-connected components

A **strongly-connected component** of a directed graph is a maximal subset of
nodes of the graph such that any pair of them is connected through some
directed path. Therefore, the nodes of a graph can be partitioned into
several strongly connected components.

The following code computes the strongly-connected components of a graph. More
precisely, given an undirected graph `G`, it returns the identifier of the
strongly connected component of each node, as a number between zero and
$C-1$, where $C$ is the total number of strongly connected components.

You can get an explanation of this algorithm in
[these slides](https://www.cs.upc.edu/~jordicf/Teaching/AP2/pdf/Graphs_Connectivity.pdf).

```c++
<? include "pages/eda/graphs/scc.cc"; ?>
```

Applying this code to the first sample graph produces `[1, 2, 0, 0, 2, 2]`.
These strong connected components are shown in different colors below:

TODO:

```
<script type="text/coffeescript" src="scc.coffee"></script>
<div style='display: flex;'>
<div id="div-graph-scc" class="figura" style="flex: 75%; height: 200px; margin-bottom: 2em;">
</div>
<div class="figura" style='flex: 25%; height: 200px; padding: 20px;' >
<p><small>Layout:</small></p>
<button style='width: 10em;' onclick='window.cy3.layout({ name: "random" }).run();'>Random</button><br/>
<button style='width: 10em;' onclick='window.cy3.layout({ name: "circle" }).run();'>Circle</button><br/>
<button style='width: 10em;' onclick='window.cy3.layout({ name: "concentric" }).run();'>Concentric</button><br/>
<button style='width: 10em;' onclick='window.cy3.layout({ name: "cose" }).run();'>Springs</button><br/>
</div>
</div>
```

The running time is $\O(m+n)$.

<Autors autors="jpetit jordic"/>
