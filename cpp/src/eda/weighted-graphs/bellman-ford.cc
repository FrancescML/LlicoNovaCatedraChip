void bellman_ford (const WGraph& G, node s, vector<weight>& d, vector<node>& p) {
    int n = G.size();                   // number of nodes in the graph
    d = vector<weight>(n, infinity);    // for each node, its minimum distance from s
    d[x] = 0;
    p = vector<node>(n, None);          // for each node, its parent node

    for (int i = 0; i < n - 1; ++i) {
        for (node u = 0; u < n; ++u) {
            for (arc a : G[u]) {
                weight c = a.first;
                node v = a.second;
                if (d[v] > d[u] + c) {
                    d[v] = d[u] + c;
                    p[v] = u;
}   }   }   }   }
