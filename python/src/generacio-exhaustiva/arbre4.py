from treelib import Node, Tree


def gen(s, p):
    s2 = s
    while len(s2) != n:
        s2 = s2 + '·'
    e = str(list(s2)).replace(' ', '').replace("'", "")
    if len(s) == n:
        if s.count('1') == k:
            e += ' 🟢'
        else:
            e += ' 🔴'
    else:
        if s.count('1') > k or s.count('0') > n - k:
            e += ' ❌'
    t.create_node(e, s, parent=p)
    if len(s) < n and s.count('1') <= k and s.count('0') <= n - k:
        gen(s + '0', s)
        gen(s + '1', s)


k = 2
n = 5
t = Tree()
gen('', None)
t.show()
