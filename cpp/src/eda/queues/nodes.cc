#include <cassert>
using namespace std;


template <typename T>
class Queue {

    /** A Node stores an element and a pointer down to the next node in the queue. */
    struct Node {
        T elem;
        Node* next;
    };

    /** Pointer to the first node of the queue. Null if the queue is empty. */
    Node* first;

    /** Pointer to the last node of the queue. Null if the queue is empty. */
    Node* last;

    /** Number of elements in the queue. */
    int n;

public:

    /** Builds an empty queue. */
    Queue ()
    :   first(nullptr),
        last(nullptr),
        n(0)
    {   }

    /** Copy constructor. */
    Queue (const Queue& q) {
        copy(q);
    }

    /** Assigment operator. */
    Queue& operator= (const Queue& q) {
        if (&q != this) {
            free();
            copy(q);
        }
        return *this;
    }

    /** Destructor. */
    ~Queue () {
        free();
    }

    /** Returns the number of elements in the queue. */
    int size () const {
        return n;
    }

    /** Tells whether the queue is empty. */
    bool empty () const {
        return size() == 0;
    }

    /** Inserts a new element at the last of the queue, after its current last element. */
    void push (const T& x) {
        Node* p = new Node {x, nullptr};
        if (n++ == 0) first = last = p;
        else last = last->next = p;
    }

    /** Removes the first element of the queue.
        Precondition: the queue is not empty.
    */
    void pop () {
        assert(not empty());
        Node* old = first;
        first = first->next;
        delete old;
        if (--n == 0) last = nullptr;
    }

    /** Returns the first element of the queue.
        Precondition: the queue is not empty.
    */
    T top () const {
        assert(not empty());
        return first->elem;
    }

private:

    /** Copies the queue q. */
    void copy (const Queue& q) {
        n = q.n;
        if (n == 0) {
            first = last = nullptr;
        } else {
            Node* p1 = q.first;
            Node* p2 = first = new Node {p1->elem};
            while (p1->next) {
                p1 = p1->next;
                p2 = p2->next = new Node {p1->elem};
            }
            p2->next = nullptr;
            last = p2;
    }   }

    /** Frees the linked list of nodes in the queue. */
    void free () {
        Node* p = first;
        while (p) {
            Node* old = p;
            p = p->next;
            delete old;
    }   }

};

