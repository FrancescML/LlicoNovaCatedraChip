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
        int height;     // Height of the tree

        Node (const Key& c, const Info& i, Node* l, Node* r, int h)
        :   key(c), info(i), left(l), right(r), height(h)
        {   }
    };

    /** Number of keys in the dictionary. */
    int n;

    /** Pointer to the root of the AVL of the dictionary. */
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

    /** Assign info to key. Cost: O(h). */
    void assign (const Key& key, const Info& info) {
        assign(root, key, info);
    }

    /** Erases key and its associated information. If the
        key does not belong to the dictionary, nothing changes.

        Cost: O(log n).
    */
    void erase (const Key& key) {
        erase(root, key);
    }

    /** Returns a reference to the information associated to key.
        Prec: key belongs to the dictionary.

        Cost: O(log n).
    */
    Info& query (const Key& key) {
        Node* p = find(root, key);
        assert(p);
        return p->info;
    }

    /** Returns a reference to the information associated to key.
        Prec: key belongs to the dictionary.

        Cost: O(log n).
    */
    const Info& query (const Key& key) const {
        Node* p = find(root, key);
        assert(p);
        return p->info;
    }

    /** Determines if the dictionary contains key. Cost: O(log n). */
    bool contains (const Key& key) {
        return find(root, key);
    }

    /** Returns the size (i.e. number of keys) of the dictionary. Cost: O(1). */
    int size () {
        return n;
    }

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
        return p ? new Node(p->key, p->info, copy(p->left), copy(p->right), p->height) : nullptr;
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

    /** Returns the height of a tree through its pointer (which may be null). Cost: O(1). */
    static int height (Node* p) {
        return p ? p->height : -1;
    }


    /** Updates the height of a node using the height of its subtrees. Cost: O(1). */
    static void update_height (Node* p) {
        p->height = 1 + max(height(p->left), height(p->right));
    }

    /** Applies a LL simple roration to a node. Cost: O(1). */
    static void LL (Node*& p) {
        Node* q = p;
        p = p->left;
        q->left = p->right;
        p->right = q;
        update_height(q);
        update_height(p);
    }

    /** Applies a RR simple roration to a node. Cost: O(1). */
    static void RR (Node*& p) {
        Node* q = p;
        p = p->right;
        q->right = p->left;
        p->left = q;
        update_height(q);
        update_height(p);
    }

    /** Applies a LR double roration to a node. Cost: O(1). */
    static void LR (Node*& p) {
        RR(p->left);
        LL(p);
    }

    /** Applies a RL double roration to a node. Cost: O(1). */
    static void RL (Node*& p) {
        LL(p->right);
        RR(p);
    }


    /** Assigns info to key if the key belongs to
        the tree pointed by p. Otherwise adds a new node into
        the tree pointed by p with the key and the associated
        information. Rebalances the tree after the insertion
        of necessary.

        Cost: O(log n).
    */
    void assign (Node*& p, const Key& key, const Info& info) {
        if (p) {
            if (key < p->key) {
                assign(p->left, key, info);
                if (height(p->left) - height(p->right) == 2) {
                    if (key < p->left->key) LL(p);
                    else LR(p);
                }
                update_height(p);
            } else if (key > p->key) {
                assign(p->right, key, info);
                if (height(p->right) - height(p->left) == 2) {
                    if (key > p->right->key) RR(p);
                    else RL(p);
                }
                update_height(p);
            } else {
                p->info = info;
            }
        } else {
            p = new Node(key, info, nullptr, nullptr, 0);
            ++n;
    }   }

    /** Algorithm to delete a key from a AVL tree.
        Cost: O(log n).
    */
    void erase (Node*& p, const Key& key) {
        if (p) {
            if (key < p->key) {
                erase(p->left, key);
                rebalance_left(p);
            } else if (key > p->key) {
                erase(p->right, key);
                rebalance_right(p);
            } else {
                Node* old = p;
                if (p->height == 0) {
                    p = 0;
                } else if (!p->left) {
                    p = p->right;
                } else if (!p->right) {
                    p = p->left;
                } else {
                    Node* q = extract_minimum(p->right);
                    q->left = p->left;  q->right = p->right;
                    p = q;
                    rebalance_right(p);
                }
                delete old;
                --n;
    }   }   }


    static void rebalance_left (Node*& p) {
        if (height(p->right) - height(p->left) == 2) {
            if (height(p->right->left) - height(p->right->right) == 1) {
                RL(p);
            } else {
                RR(p);
            }
        } else {
            update_height(p);
    }   }


    static void rebalance_right (Node*& p) {
        if (height(p->left) - height(p->right) == 2) {
            if (height(p->left->right) - height(p->left->left) == 1) {
                LR(p);
            } else {
                LL(p);
            }
        } else {
            update_height(p);
    }   }


    static Node* extract_minimum (Node*& p) {
        if (p->left) {
            Node* q = extract_minimum(p->left);
            rebalance_left(p);
            return q;
        } else {
            Node* q = p;
            p = p->right;
            return q;
    }   }

};
