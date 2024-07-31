#include <cassert>
using namespace std;


template <typename T>
class Stack {

    /** A Node stores an element and a pointer down to the next node in the stack. */
    struct Node {
        T elem;
        Node* next;
    };

    /** Pointer to the top (first) node of the stack. Null if the stack is empty. */
    Node* first;

    /** Number of elements in the stack. */
    int n;

public:

    /** Builds an empty stack. */
    Stack ()
    :   first(nullptr),
        n(0)
    {   }

    /** Copy constructor. */
    Stack (const Stack& s) {
        copy(s);
    }

    /** Assigment. */
    Stack& operator= (const Stack& s) {
        if (&s != this) {
            free();
            copy(s);
        }
        return *this;
    }

    /** Destructor. */
    ~Stack () {
        free();
    }

    /** Returns the number of elements in the stack. */
    int size () const {
        return n;
    }

    /** Tells whether the stack is empty. */
    bool empty () const {
        return size() == 0;
    }

    /** Inserts a new element at the top of the stack, above its current top element. */
    void push (const T& x) {
        first = new Node {x, first};
        ++n;
    }

    /** Removes the top element of the stack.
        Precondition: the stack is not empty.
    */
    void pop () {
        assert(not empty());
        Node* old = first;
        first = first->next;
        delete old;
        --n;
    }

    /** Returns the top element of the stack.
        Precondition: the stack is not empty.
    */
    T top () const {
        assert(not empty());
        return first->elem;
    }

private:

    /** Copies the stack s. */
    void copy (const Stack& s) {
        n = s.n;
        Node** last = &first;
        for (Node* p = s.first; p; p = p->next) {
            *last = new Node {p->elem};
            last = &(*last)->next;
        }
        *last = nullptr;
    }

    /** Frees the linked list of nodes in the stack. */
    void free () {
        Node* p = first;
        while (p) {
            Node* old = p;
            p = p->next;
            delete old;
    }   }

};
