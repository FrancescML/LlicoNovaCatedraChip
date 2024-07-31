/** Returns a list of nodes with a DFS ordering of a graph. */
list<node> dfs_ordering (const Graph& G) {
    int n = G.size();                       // number of nodes of G
    list<node> L;                           // list with the DFS ordering
    vector<bool> S(n, false);               // subset of visited nodes
    for (node u = 0; u < n; ++u) {
        dfs_from(G, u, S, L);
    }
    return L;
}

void dfs_from (const Graph& G, node u, vector<bool>& S, list<node>& L) {
    if (not S[u]) {
        S[u] = true;
        L.push_back(u);
        for (node v : G[u]) {
            dfs_from(G, v, S, L);
}   }   }
