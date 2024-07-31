void dijkstra(const WGraph& G, node s, vector<weight>& d, vector<node>& p) {
    int n = G.size();                       // number of nodes in the graph
    d = vector<weight>(n, infinity);        // for each node, its minimum distance from s
    d[s] = 0;
    p = vector<node>(n, None);              // for each node, its parent node
    vector<bool> S(n, false);               // subset of nodes with optimal distance
    priority_queue<arc, vector<arc>, greater<arc>> pq;
    pq.push({0, s});
    while (not pq.empty()) {
        node u = pq.top().second;
        pq.pop();
        if (not S[u]) {
            S[u] = true;
            for (Arc a : G[u]) {
                weight c = a.first;
                node v = a.second;
                if (d[v] > d[u] + c) {
                    d[v] = d[u] + c;
                    p[v] = u;
                    pq.push({d[v], v});
}   }   }   }   }
