weight kruskal (const Graph& G) {
    int n = G.size();

    // Sort all edges by their weight
    using edge = pair<weight, pair<node, node>>;
    vector<edge> edges;
    for (node u = 0; u < n; ++u) {
        for (arc a : G[u]) {
            edges.push_back({a.first, {u, a.second}});
    }   }
    sort(edges.begin(), edges.end());

    // Add each edge if it is not creating a cycle
    DisjointSets p(n);
    weight sum = 0;
    for (edge e : edges) {
        weight c = e.first;
        node u = e.second.first;
        node v = e.second.second;
        if (p[u] != p[v]) {
            p.merge(u, v);
            sum += c;
    }   }
    return sum;
}
