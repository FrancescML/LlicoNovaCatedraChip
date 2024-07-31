#include <cmath>
#include <iostream>
#include <map>
#include <queue>
#include <utility>
#include <vector>
using namespace std;

const int infinity = 999999999;

using Node = int;
using Capacity = int;
using WeightedGraph = vector<map<Node, Capacity>>;
using Parents = vector<Node>;

bool find_augmenting_path(const WeightedGraph& rG, Node s, Node t, Parents& parents)
{
    int n = rG.size();
    vector<bool> enqueued(n, false);
    queue<Node> q;
    q.push(s);
    enqueued[s] = true;
    while (not q.empty()) {
        Node u = q.front();
        q.pop();
        for (auto [v, c] : rG[u]) {
            if (c > 0 and not enqueued[v]) {
                q.push(v);
                enqueued[v] = true;
                parents[v] = u;
                if (v == t) {
                    return true;
                }
            }
        }
    }
    return false;
}

Capacity min_cap_in_augmenting_path(const WeightedGraph& rG, Node s, Node t, const Parents& parents)
{
    Capacity min_cap = infinity;
    for (Node u = t; u != s; u = parents[u]) {
        min_cap = min(min_cap, rG[parents[u]].at(u));
    }
    return min_cap;
}

void increase_flow(WeightedGraph& rG, Node s, Node t, const Parents& parents, Capacity flow)
{
    for (Node u = t; u != s; u = parents[u]) {
        rG[parents[u]][u] -= flow;
        rG[u][parents[u]] += flow;
    }
}

Capacity ford_fulkerson(const WeightedGraph& G, Node s, Node t)
{
    int n = G.size();
    WeightedGraph rG = G;
    Parents parents(n);
    Capacity maxflow = 0;
    while (find_augmenting_path(rG, s, t, parents)) {
        Capacity increase = min_cap_in_augmenting_path(rG, s, t, parents);
        increase_flow(rG, s, t, parents, increase);
        maxflow += increase;
    }
    return maxflow;
}

bool read_weighted_graph(WeightedGraph& G)
{
    int n, m;
    if (not(cin >> n >> m)) {
        return false;
    }

    G = WeightedGraph(n);
    for (int i = 0; i < m; ++i) {
        Node u, v;
        Capacity c;
        cin >> u >> v >> c;
        G[u][v] = c;
    }

    return true;
}

int main()
{
    WeightedGraph G;
    while (read_weighted_graph(G)) {
        int source = 0;
        int target = G.size() - 1;
        cout << ford_fulkerson(G, source, target) << endl;
    }
}
