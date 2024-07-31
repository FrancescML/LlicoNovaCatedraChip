/** Returns the minimum distance of each node of a graph from a source node s. */
vector<int> minimum_distance (const Graph& G, node s) {
    int n = G.size();               // number of nodes in G
    vector<int> d(n, None);         // for each node, its distance from s
    d[s] = 0;
    queue<node> q;
    q.push(s);
    while (not q.empty()) {
        node v = q.front();
        q.pop();
        for (node w : G[v]) if (d[w] == None) {
            d[w] = d[v] + 1;
            q.push(w);
    }   }
    return d;
}
