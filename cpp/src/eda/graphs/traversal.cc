void simple_traversal (const Graph& G) {
    int n = G.size();                   // let n be the number of nodes in G
    for (node u = 0; u < n; ++u) {      // for each node u in G
        cout << u << ":" << endl;           // print u:
        for (node v : G[u]) {               // for each neighbor v of u in G
            cout << " " << v;                   // print v
        }
        cout << endl;
}   }
