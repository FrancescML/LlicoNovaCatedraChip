#include <cassert>
using namespace std;


template <typename Key, typename Info>
class Dictionary {

private:

    /** Node structure with constructor. */
    struct Node {
        Key key;        // The key
        Info info;      // Its associated information
        Node* left;     // Pointer to left child
        Node* right;    // Pointer to right child

        Node (const Key& k, const Info& i, Node* l, Node* r)
        :   key(k), info(i), left(l), right(r)
        {   }
    };

    /** Number of keys. */
    int n;

    /** Pointer to the root of the BST. */
    Node* root;

public:

    /** Creates an empty dictionary. Cost: O(1). */
    Dictionary ()
    :   n(0),
        root(nullptr)
    {   }

    /** Copy constructor. Cost: O(n). */
    Dictionary (const Dictionary& d)
    :   n(d.n),
        root(copy(d.root))
    {   }

    /** Assignment operator. Cost: O(n+d.n). */
    Dictionary& operator= (const Dictionary& d) {
        if (&d != this) {
            free(root);
            n = d.n;
            root = copy(d.root);
        }
        return *this;
    }

    /** Destructor. Cost: O(n). */
    ~Dictionary () {
        free(root);
    }

º
private:

    /** Deletes the tree pointed by p.

        Cost: O(s) where s is the number of nodes in the tree pointed by p.
    */
    static void free (Node* p) {
        if (p) {
            free(p->left);
            free(p->right);
            delete p;
    }   }

    /** Returns a pointer to a copy of the tree pointed by p.

        Cost: O(s) where s is the number of nodes in the tree pointed by p.
    */
    static Node* copy (Node* p) {
        return p ? new Node(p->key, p->info, copy(p->left), copy(p->right)) : nullptr;
    }

    /** Returns a pointer to the node of the tree pointed by p that contains key,
        or nullptr if the key is not there.

        Cost: O(h) where h is the height of the tree pointed by p.
    */
    static Node* find (Node* p, const Key& key) {
        if (p) {
            if (key < p->key) {
                return find(p->left, key);
            } else if (key > p->key) {
                return find(p->right, key);
        }   }
        return p;
    }

    /** Assigns info to key if the key belongs to
        the tree pointed by p. Otherwise adds a new node into
        the tree pointed by p with the key and the associated
        information.

        Cost: O(h) where h is the height of the tree pointed by p.
    */
    void assign (Node*& p, const Key& key, const Info& info) {
        if (p) {
            if (key < p->key) {
                assign(p->left, key, info);
            } else if (key > p->key) {
                assign(p->right, key, info);
            } else {
                p->info = info;
            }
        } else {
            p = new Node(key, info, nullptr, nullptr);
            ++n;
    }   }

    /** Deleting a node with at least one
        empty child is easy. When both children are non-empty, calls
        extract_minimum(), which extracts the minimum of the
        right child and returns a pointer to it. This node is placed
        where the node that should disappear was, which is finally
        deleted.

        Cost: O(h) where h is the height of the tree pointed by p.
    */
    void erase (Node*& p, const Key& key) {
        if (p) {
            if (key < p->key) {
                erase(p->left, key);
            } else if (key > p->key) {
                erase(p->right, key);
            } else {
                Node* q = p;
                if (!p->left) p = p->right;
                else if (!p->right) p = p->left;
                else {
                    Node* m = extract_minimum(p->right);
                    m->left = p->left;
                    m->right = p->right;
                    p = m;
                }
                delete q;
                --n;
    }   }   }

    /** Extracts the node that contains the minimum element from the
        tree pointed by p. Returns a pointer to it.

        Cost: O(h) where h is the height of the tree pointed by p.
    */
    static Node* extract_minimum (Node*& p) {
        if (p->left) {
            return extract_minimum(p->left);
        } else {
            Node* q = p;
            p = p->right;
            return q;
    }   }

};
