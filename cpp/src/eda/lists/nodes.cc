#include <cassert>
using namespace std;


template <typename T>
class List {

    /** Node with an element, and pointers to the previous and next nodes. */
    struct Node {
        Node* prev;
        T elem;
        Node* next;
    };

    /** Ghost node for the list. */
    Node* ghost;

    /** Pointer to the node after the cursor. */
    Node* cursor;

    /** Number of elements in the list. */
    int n;

public:

    /** Creates an empty list. */
    List ()
    :   ghost(new Node),
        cursor(ghost),
        n(0)
    {
        ghost->prev = ghost->next = ghost;
    }

    /** Copy constructor. */
    List (const List& L) {
        copy(L);
    }

    /** Destructor. */
    ~List () {
        free();
    }

    /** Assignment. */
    List& operator= (const List& L) {
        if (&L != this) {
            free();
            copy(L);
        }
        return *this;
    }

    /** Returns the number of elements in the list. */
    int size () const {
        return n;
    }

    /** Tells whether the list is empty. */
    bool empty () const {
        return size() == 0;
    }

    /** Tells whether the cursor is at the front of the list. */
    bool is_at_front () const {
        return cursor == ghost->next;
    }

    /** Tells whether the cursor is at the end of the list. */
    bool is_at_end () const {
        return cursor == ghost;
    }

    /** Moves the cursor one position to the left.
        Precondition: the cursor is not at the front of the list.
    */
    void move_left () {
        assert(not is_at_front());
        cursor = cursor->prev;
    }

    /** Moves the cursor one position to the right.
        Precondition: the cursor is not at the end of the list.
    */
    void move_right () {
        assert(not is_at_end());
        cursor = cursor->next;
    }

    /** Moves the cursor to the front of the list. */
    void move_to_front () {
        cursor = ghost->next;
    }

    /** Moves the cursor to the end of the list. */
    void move_to_end () {
        cursor = ghost;
    }

    /** Inserts an element x before the cursor. */
    void insert (const T& x) {
        cursor->prev = cursor->prev->next = new Node {cursor->prev, x, cursor};
        ++n;
    }

    /** Erases the element after the cursor.
        Precondition: the cursor is not at the end of the list.
    */
    void erase () {
        assert(not is_at_end());
        Node *p = cursor;
        p->next->prev = p->prev;
        cursor = p->prev-next = p->next;
        delete p;
        --n;
    }

    /** Returns the element after the cursor.
        Precondition: the cursor is not at the end of the list.
    */
    T get () const {
        assert(not is_at_end());
        return cursor->elem;
    }

private:

    /** Copies the list L. */
    void copy (const List& L) {
        n = L.n;
        Node* q = cursor = ghost = new Node;
        Node* p = L.ghost->next;
        while (p != L.ghost) {
            q = q->next = new Node {q, p->elem};
            if (p == L.cursor) cursor = q;
            p = p->next;
        }
        q->next = ghost;
        ghost->prev = q;
    }

    /** Frees the linked list of nodes in the list. */
    void free () {
        Node* p = ghost->next;
        while (p != ghost) {
            Node* old = p;
            p = p->next;
            delete old;
        }
        delete p;
    }

};

