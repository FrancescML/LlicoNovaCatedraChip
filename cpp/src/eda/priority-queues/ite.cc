#include <cassert>
#include <vector>
using namespace std;


template <typename T>
class PriorityQueue {

private:

    /** Vector for the heap (position 0 is not used). */
    vector<T> v;

public:

    /** Creates an empty priority queue. Cost: O(1). */
    PriorityQueue ()
    :   v(1)                // position 0 is not used
    {   }

    /** Inserts a new element in the priority queue. Cost: O(log n). */
    void insert (const T& x) {
        v.push_back(x);
        int i = size();
        while (i != 1 and v[i/2] > x) {
            v[i] = v[i/2];
            i = i/2;
        }
        v[i] = x;
    }

    /** Removes the minimum element from the priority queue. Cost: O(log n). */
    void remove_min () {
        assert(not empty());
        int n = size();
        const T x = v[n];
        v.pop_back();
        --n;
        int i = 1, c = 2*i;
        while (c <= n) {
            if (c+1 <= n and v[c+1] < v[c]) ++c;
            if (x <= v[c]) break;                   // this break is nice!
            v[i] = v[c];
            i = c;
            c = 2*i;
        }
        v[i] = x;
    }

    /** Returns the minimum element from the priority queue. Cost: O(1). */
    T minimum () {
        assert(not empty());
        return v[1];
    }

    /** Returns the size of the priority queue. Cost: O(1). */
    int size () {
        return v.size() - 1;
    }

    /** Indicates if the queue is empty. Cost: O(1). */
    bool empty () {
        return size() == 0;
    }

};
