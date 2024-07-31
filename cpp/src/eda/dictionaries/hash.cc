#include <utility>
#include <vector>
#include <cassert>

using namespace std;


template <typename Key, typename Info>
class Dictionary {

private:

    /** Special integer value for "not found". */
    const int None = -1;

    /** A Pair wraps a Key and an Info together. */
    using Pair = pair<Key, Info>;

    /** A List is a vector (a list would also do) of Pairs. */
    using List = vector<Pair>;

    /** Hash table */
    vector<List> t;

    /** Number of keys */
    int n;

    /** Number of positions */
    int M;

public:

    /** Creates an empty dictionary. Cost: O(M). */
    Dictionary (int M = 1009)
    :   t(M),
        n(0),
        M(M)
    {   }

    /** Assigns info to key. If the key already belongs
        to the dictionary, its associated information is
        modified.

        Worst-case cost: O(n). Average-case cost: O(1+n/M).
    */
    void assign (const Key& key, const Info& info) {
        const int h = hash(key) % M;
        const int p = position(key, t[h]);
        if (p != None) {
            t[h][p].second = info;
        } else {
            t[h].push_back({key, info});
            ++n;
    }   }

    /** Erases key and its associated information from the
        dictionary. If the key does not belong to the dictionary,
        nothing changes.

        Worst-case cost: O(n). Average-case cost: O(1+n/M).
    */
    void erase (const Key& key) {
        const int h = hash(key) % M;
        const int p = position(key, t[h]);
        if (p != None) {
            t[h][p] = t[h].back();
            t[h].pop_back();
            --n;
    }   }

    /** Returns a reference to the information associated to key.
        Prec: the dictionary contains key.

        Worst-case cost: O(n). Average-case cost: O(1+n/M).
    */
    Info& query (const Key& key) {
        const int h = hash(key) % M;
        const int p = position(key, t[h]);
        assert (p != None);
        return t[h][p].second;
    }

    /** Returns a constant reference to the information associated to key.
        Prec: the dictionary contains key.

        Worst-case cost: O(n). Average-case cost: O(1+n/M).
    */
    const Info& query (const Key& key) const {
        const int h = hash(key) % M;
        const int p = position(key, t[h]);
        assert (p != None);
        return t[h][p].second;
    }

    /** Determines if the dictionary contains a given key.

        Worst-case cost: O(n). Average-case cost: O(1+n/M).
    */
    bool contains (const Key& key) const {
        const int h = hash(key) % M;
        return position(key, t[h]) != None;
    }

    /** Returns the size (i.e. number of keys) of the dictionary.

        Worst-case cost: O(1). Average-case cost: O(1).
    */
    int size () const {
        return n;
    }

private:

    /** Returns the position of key in L, or None if it is not there. */
    static int position (const Key& key, const List& L) {
        const int s = L.size();
        for (int i = 0; i < s; ++i) {
            if (L[i].first == key) return i;
        }
        return None;
    }

};
