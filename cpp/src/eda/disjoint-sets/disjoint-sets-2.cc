class DisjointSets {

    vector<int> v;

    // find operation
    int find (int i) {
        if (v[i] < 0) return i;
        else return find(v[i]);
    }

public:

    /* Creates n disjoint sets. */
    DisjointSets (int n)
    :   v(n, -1)
    {   }

    /* Finds the class of element i. */
    int operator[] (int i) {
        return find(i);
    }

    /* Merges the classes of elements i and j. */
    void merge (int i, int j) {
        int ci = find(i);
        int cj = find(j);
        if (v[ci] > v[cj]) {
            v[cj] += v[ci];
            v[ci] = cj;
        } else {
            v[ci] += v[cj];
            v[cj] = ci;
    }   }
};

