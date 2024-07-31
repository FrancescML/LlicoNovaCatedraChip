#include <stack>
#include <cassert>
using namespace std;


template <typename T>
class List {

    /** Left and right stacks. */
    stack<T> left, right;

public:

    /** Creates an empty list. */
    List ()
    {   }

    /** Returns the number of elements in the list. */
    int size () const {
        return left.size() + right.size();
    }

    /** Tells whether the list is empty. */
    bool empty () const {
        return size() == 0;
    }

    /** Tells whether the cursor is at the beginning of the list. */
    bool is_at_start () const {
        return left.empty();
    }

    /** Tells whether the cursor is at the end of the list. */
    bool is_at_end () const {
        return right.empty();
    }

    /** Moves the cursor one position to the left.
        Precondition: the cursor is not at the start of the list.
    */
    void move_left () {
        transfer(left, right);
    }

    /** Moves the cursor one position to the right.
        Precondition: the cursor is not at the end of the list.
    */
    void move_right () {
        transfer(right, left);
    }

    /** Moves the cursor to the beginning of the list. */
    void move_to_start () {
        while (not is_at_start()) move_left();
    }

    /** Moves the cursor to the end of the list. */
    void move_to_end () {
        while (not is_at_end()) move_right();
    }

    /** Inserts an element x before the cursor. */
    void insert (const T& x) {
        left.push(x);
    }

    /** Erases the element after the cursor.
        Precondition: the cursor is not at the end of the list.
    */
    void erase () {
        assert(not is_at_end());
        right.pop();
    }

    /** Returns the element after the cursor.
        Precondition: the cursor is not at the end of the list.
    */
    T get () const {
        assert(not is_at_end());
        return right.top();
    }

private:

    /** Transfers the top element of the source stack to the destionation stack.
        Precondition: the source stack is not empty.
    */
    static void transfer (stack<T>& src, stack<T>& dst) {
        assert(not src.empty());
        dst.push(src.top());
        src.pop();
    }
};

