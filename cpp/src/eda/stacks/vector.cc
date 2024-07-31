#include <vector>
#include <cassert>
using namespace std;


template <typename T>
class Stack {

    /** Elements in the stack, from bottom (0) to top. */
    vector<T> v;

public:

    /** Builds an empty stack. */
    Stack()
    {   }

    /** Returns the number of elements in the stack. */
    int size() const {
        return v.size();
    }

    /** Tells whether the stack is empty. */
    bool empty() const {
        return size() == 0;
    }

    /** Inserts a new element at the top of the stack, above its current top element. */
    void push(const T& x) {
        v.push_back(x);
    }

    /** Removes the top element of the stack.
        Precondition: the stack is not empty.
    */
    void pop() {
        assert(not empty());
        v.pop_back();
    }

    /** Returns the top element of the stack.
        Precondition: the stack is not empty.
    */
    T top() const {
        assert(not empty());
        return v.back();
    }
};
