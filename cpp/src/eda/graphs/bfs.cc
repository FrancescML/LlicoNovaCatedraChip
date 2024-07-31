/** Returns a list of nodes with a BFS ordering of a graph. */
list<node> bfs_ordering (const Graph& G) {
    int n = G.size();                           // number of nodes in G
    list<node> L;                               // list with the BFS ordering
    vector<bool> Q(n, false);                   // subset of enqueued nodes
    for (node u = 0; u < n; ++u) {
        bfs_from(G, u, Q, L);
    }
    return L;
}

void bfs_from (const Graph& G, int u, vector<bool>& Q, list<node>& L) {
    if (not Q[u]) {
        queue<node> q;
        q.push(u);
        Q[u] = true;
        while (not q.empty()) {
            int v = q.front();
            q.pop();
            L.push_back(v);
            for (node w : G[v]) if (not Q[w]) {
                q.push(w);
                Q[w] = true;
}   }   }   }
