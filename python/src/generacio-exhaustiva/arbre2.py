from treelib import Node, Tree


def gen(s, p):
    s2 = s
    while len(s2) != n:
        s2 = s2 + '·'
    e = str(list(s2)).replace(' ', '').replace("'", "")
    t.create_node(e, s, parent=p)
    if len(s) < n:
        gen(s + '0', s)
        gen(s + '1', s)


n = 3
t = Tree()
gen('', None)
t.show()
