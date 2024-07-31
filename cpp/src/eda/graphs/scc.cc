/** Returns the strongly connected component identifier of each nodes of a graph. */
vector<int> strongly_connected_components (const Graph& G) {
    // Reverse the graph.
    Graph Gr = reverse(G);

    // Get a DFS post-ordering L of the nodes and reverse it.
    list<node> L;                           // list of vertices in post visit order
    vector<bool> S(n, false);               // subset of visited nodes
    for (node u = 0; u < n; ++u) {
        dfs1(G, u, S, L);
    }
    L.reverse();

    // Perform DFS in G according to the order of the nodes in L.
    int c = 0;                      // current number of strongly connected component
    vector<int> scc(n, None);       // for each node, number of its strongly connected component
    for (node u : L) {
        dfs2(G, u, scc, ++c);
    }
    return scc;
}

Graph reverse(const Graph& G) {
    int n = G.size();
    Graph Gr(n);
    for (node u = 0; u < n; ++u) {
        for (node v : G[u]) {
            Gr[v].push_back(u);
    }   }
    return Gr;
}

void dfs1 (const Graph& G, node u, vector<bool>& S, list<node>& L) {
    if (not S[u]) {
        S[u] = true;
        for (node v : G[u]) {
            dfs1(G, v, S, L);
        }
        L.push_back(u);
}   }

void dfs2 (const Graph& G, node u, vector<int>& scc, int c) {
    if (scc[u] == None) {
        scc[u] = c;
        for (node v : G[u]) {
            dfs2(G, v, scc, c);
}   }   }
