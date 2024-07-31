#include <iostream>
#include "queue-nodes.cc"
using namespace std;

int main() {
    Queue<int> q;
    int x;
    while (cin >> x) {
        q.push(x);
    }
    Queue<int> q2 = q;
    q2 = q;
    while (not q.empty()) {
        cout << q.top() << endl;
        q.pop();
    }
    while (not q2.empty()) {
        cout << q2.top() << endl;
        q2.pop();
    }
}
