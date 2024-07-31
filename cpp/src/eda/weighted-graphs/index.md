# Weighted graphs

## Weighted graph representation

In order to extend the representation of graphs to weighted graphs, we extend
adjacency lists to store not just the destination node of each arc, but also
its weight (e.g., a distance or a cost), which we will be considering a real
value:

```c++
using node = int; // nodes are represented by indices from 0
using weight = double; // weights are real numbers
using arc = pair<weight, node>; // an arc is represented by its weight and its destination node
using WAdjacencyList = vector<arc>; // the adjacency list of one node (set of arcs to successor nodes)
using WGraph = vector<WAdjacencyList>; // the complete adjacency list for all nodes in the graph
```

The reason to use the weight as the first element of the `arc` pair
is that it will determine the ordering of the pair, which will be useful
in many subsequent algorithms.

As an exemple, the following weighted graph

TODO:

```
<script type="text/coffeescript" src="sample.coffee"></script>
<div style='display: flex;'>
<div id="div-sample" class="figura" style="flex: 75%; height: 250px; margin-bottom: 2em;">
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
Graph G = {
    {{10, 1}, {8, 7}},      // 0
    {{2.5, 5}},             // 1
    {{1, 1}, {1, 3}},       // 2
    {{4, 3}},               // 3
    {{1, 5}},               // 4
    {{-2, 2}},              // 5
    {{1, 5}, {4, 1}},       // 6
    {{1, 6}},               // 7
};
```

Observe that we do not add contraints on the order of the nodes in the
adjacency lists —even though this could make sense in some settings. However,
we do not allow repetitions (this would mean multiple arcs) nor self-loops.

In the following, $n$ denotes the number of nodes of a graph, and
$m$ denotes its number of arcs.

Furthermore, the `infinity` constant will be used to denote
the infinity value for weights, which is also quite handy in
many algorithms:

```c++
const weight infinity = numeric_limits<weight>::infinity();
```

The `infinity` value is legal for `double` variables and has all
the nice properties of the ∞ symbol.

As we did the lesson on graphs, we will use the `None` constant
to denote spectial integer values:

```c++
const int None = -1;
```

## Shortest paths with Dijkstra's algorithm

The following code implements Dijkstra's algorithm in order to compute the
shortest paths from one source node to all the nodes in a directed graph
with non-negative weights on the arcs.

The input of `dijkstra()` is a weighted graph `G` with non-negative weights on
the arcs, and a source node `s` from `G`. Its output are two vectors `d` and
`p`. For each node `u` in `G`, `d[u]` is the minimum distance from `s` to
`u` (or ∞ if `u` is not reachable from `s`) and `p[u]` is the parent node of
`u`, that is the node from which `u` should be reached in order to get the
minimum distance `d[u]`. We have that `p[u]` is `None` if `u` in unreachable
from `s` or when `u == s`.

During the execution of the algorithm we maintain the subset `S ⊆ V` of vertices
for which their minimum distance from `s` computed so far is the optimal one.

```c++
<? include "pages/eda/weighted-graphs/dijkstra.cc"; ?>
```

The cost of Dijkstra's algorithm is $\O(n+m\log m)$ in the worst case.

TBD: Example

TBD: Decidir si `p` i `d` són paràmetres o es retornen amb una `pair`.

## Shortest paths with Bellman–Ford's algorithm

The following code implements Bellman–Ford's algorithm in order to compute the
shortest paths from one source node to all the nodes in a directed graph
with possible negative weights on the arcs but no negative cycles.

The input of `bellman_ford()` is a weighted graph `G` with no negative cycles,
and a source node `s` from `G`. Its output are two vectors `d` and
`p`. For each node `u` in `G`, `d[u]` is the minimum distance from `s` to
`u` (or ∞ if `u` is not reachable from `s`) and `p[u]` is the parent node of
`u`, that is the node from which `u` should be reached in order to get the
minimum distance `d[u]`. We have that `p[u]` is `-1` if `u` in unreachable
from `s` or when `u == s`.

The cost of Bellman–Ford's algorithm is $\O(nm)$ in the worst case.

```c++
<? include "pages/eda/weighted-graphs/bellman-ford.cc"; ?>
```

TBD: Example

TBD: Decidir si `p` i `d` són paràmetres o es retornen amb una `pair`.

## Minimum spanning tree with Prim's algorithm

The following code implements Prims's algorithm in order to compute a minimum
spanning tree of a connected undirected graph with edge weights.

TBD: Decidir què es retorna: el pes de l'arbre?, les arestes de l'arbre?, les
dues coses?. I, llavors, si són paràmetres o retornats.

The input of `prim()` is a connected undirected graph `G` with edge weights.
Its output is a minimum spanning tree of `G`, encoded in a
a vector `p` so that, for each node `u` in `G`, `p[u]` is the parent node of
`u` in the tree (and the tree root has parent `-1`).

The cost of Prim's algorithm is $\O(m\log m)$ in the worst case.

```c++
<? include "pages/eda/weighted-graphs/prim.cc"; ?>
```

TBD: Example

## Minimum spanning tree with Kruskal's algorithm

The following code implements Kruskal's algorithm in order to compute
the cost of a minimum
spanning tree of a connected undirected graph with edge weights.

TBD: Decidir què es retorna: el pes de l'arbre?, les arestes de l'arbre?, les
dues coses?. I, llavors, si són paràmetres o retornats.

The input of `kruskal()` is a connected undirected graph `G` with edge weights.

The implementation uses [Disjoint sets](/eda/disjoint-sets/index.html).

The cost of Kruskal's algorithm is $\O(m\log m)$ in the worst case.

```c++
<? include "pages/eda/weighted-graphs/kruskal.cc"; ?>
```

TBD: Example

<Autors autors="jpetit"/>
