#include <iostream>
#include "priority-queue-ite.cc"
using namespace std;

int main() {
    PriorityQueue<int> s;
    int x;
    while (cin >> x) {
        s.insert(x);
    }
    while (not s.empty()) {
        cout << s.minimum() << endl;
        s.remove_min();
    }
}
