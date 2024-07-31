#include <iostream>
#include "stack-nodes.cc"
using namespace std;

int main() {
    Stack<int> s;
    int x;
    while (cin >> x) {
        s.push(x);
    }
    auto s2 = s;
    while (not s.empty()) {
        cout << s.top() << endl;
        s.pop();
    }
    while (not s2.empty()) {
        cout << s2.top() << endl;
        s2.pop();
    }
}
