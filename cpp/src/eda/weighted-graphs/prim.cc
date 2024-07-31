weight prim (const Graph& G) {
    int n = G.size();                       // number of nodes in the graph
    weight sum = 0;                         // sum of the weights of the tree edges
    vector<bool> S(n, false);               // for each node, tells if it has been included in the tree
    priority_queue<arc, vector<arc>, greater<arc>> pq;
    pq.push({0, 0});
    while (not pq.empty()) {
        weight c = pq.top().first;
        node u = pq.top().second;
        pq.pop();
        if (not S[u]) {
            sum += c;
            S[u] = true;
            for (arc a : G[u]) {
                node v = a.second;
                if (not S[v]) {
                    pq.push(a);
    }   }   }   }
    return sum;
}

