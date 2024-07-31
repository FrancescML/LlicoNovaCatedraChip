/** Returns a list of nodes with a topological ordering of a directed acyclic graph. */
list<node> topological_ordering(const Graph& G) {
    int n = G.size();

    // Step 1: compute the in-degree of each node
    vector<int> indeg(n, 0);            // for each node, its in-degree
    for (int u = 0; u < n; ++u) {
        for (node v : G[u]) {
            ++indeg[v];
    }   }

    // Step 2: place all nodes with in-degree zero in some container.
    stack<int> s;                       // container with nodes with in-degree zero
    for (node u = 0; u < n; ++u) {
        if (indeg[u] == 0) {
            s.push(u);
    }   }

    // Step 3: process work from the container.
    list<node> L;                     // list with the topological ordering
    while (not s.empty()) {
        node u = s.top();
        s.pop();
        L.push_back(u);
        for (node v : G[u]) {
            if (--indeg[v] == 0) {
                s.push(v);
    }   }   }
    return L;
}
