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
        shift_up(size());
    }

    /** Removes the minimum element from the priority queue. Cost: O(log n). */
    void remove_min () {
        assert(not empty());
        v[1] = v.back();
        v.pop_back();
        shift_down(1);
    }

    /** Returns the minimum element in the priority queue. Cost: O(1). */
    T minimum () {
        assert(not empty());
        return v[1];
    }

    /** Returns the size of the priority queue. Cost: O(1). */
    int size () {
        return v.size() - 1;
    }

    /** Indicates if the priority queue is empty. Cost: O(1). */
    bool empty () {
        return size() == 0;
    }

private:

    /** Shift node i up in the heap, as long as needed. */
    void shift_up (int i) {
        if (i != 1 and v[i/2] > v[i]) {
            swap(v[i], v[i/2]);
            shift_up(i/2);
    }   }

    /** Shift down node i in the heap, as long as needed. */
    void shift_down (int i) {
        const int n = size();
        int c = 2*i;
        if (c <= n) {
            if (c+1 <= n and v[c+1] < v[c]) c++;
            if (v[i] > v[c]) {
                swap(v[i],v[c]);
                shift_down(c);
    }   }   }

};
