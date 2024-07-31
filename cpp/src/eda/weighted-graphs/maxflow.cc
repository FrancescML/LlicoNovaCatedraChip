using Graph = vector<vector<int>>;          // adjacency lists
using Matrix = vector<map<int, int>>;       // cheap sparse matrix

int maxflow (const Graph& G, Matrix& M, int s, int t) {
    int n = G.size();
    int maxf = 0;

    while (true) {
        // find a path from s to with BFS
        queue<int> q;
        vector<bool> inq(n, false);
        vector<int> p(n, -1);
        q.push(s);
        inq[s] = true;
        while (not q.empty()) {
            int u = q.front();
            q.pop();
            if (u == t) break;
            for (int v : G[u]) {
                if (M[u][v] and not inq[v]) {
                    q.push(v);
                    inq[v] = true;
                    p[v] = u;
        }   }   }

        // if no path
        if (p[t] == -1) return maxf;

        // compute flow in the path
        int m = M[p[t]][t];
        for (int u = p[t]; u != s; u = p[u]) {
            m = min(m, M[p[u]][u]);
        }
        // increment the flows
        maxf += m;
        for (int u = t; u != s; u = p[u]) {
            M[p[u]][u] -= m;
            M[u][p[u]] += m;
}   }   }

