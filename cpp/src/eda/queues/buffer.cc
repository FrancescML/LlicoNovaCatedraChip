#include <cassert>
#include <vector>
using namespace std;


template <typename T>
class Queue {

    /** Circular buffer. */
    vector<T> v;

    /** Index of the first element: position to read. */
    int r;

    /** Index past the last element: position to write. */
    int w;

    /** Number of elements in the queue. */
    int n;

public:

    /** Builds an empty queue with some capacity. */
    Queue(int capacity=1000)
    :   v(capacity),
        r(0),
        w(0),
        n(0)
    {   }

    /** Returns the number of elements in the queue. */
    int size () const {
        return n;
    }

    /** Returns the capacity of the queue. */
    int capacity () const {
        return v.size();
    }

    /** Tells whether the queue is empty. */
    bool empty () const {
        return size() == 0;
    }

    /** Tells whether the queue is full. */
    bool full () const {
        return size() == capacity();
    }

    /** Inserts a new element at the end of the queue, after its current end element.
        Precondition: the queue is not full.
    */
    void push (const T& x) {
        ++n;
        assert(not full());
        v[w] = x;
        inc(w);
    }

    /** Removes the first element of the queue.
        Precondition: the queue is not empty.
    */
    void pop () {
        assert(not empty());
        inc(r);
        --n;
    }

    /** Returns the first element of the queue.
        Precondition: the queue is not empty.
    */
    T top () const {
        assert(not empty());
        return v[r];
    }

private:

    /** Increments x circularly. */
    void inc (int& x) {
        if (++x == capacity()) x = 0;
    }
};
