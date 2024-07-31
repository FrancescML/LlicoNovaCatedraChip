void dfs_from (const Graph& G, node u, vector<bool>& S, list<node>& L) {
    if (not S[u]) {
        stack<node> s;
        s.push(u);
        while (not s.empty()) {
            node v = s.top();
            s.pop();
            if (not S[v]) {
                S[v] = true;
                L.push_back(v);
                for (node w : G[v]) if (not S[w]) {
                    s.push(w);
}   }   }   }   }
