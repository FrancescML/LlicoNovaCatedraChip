from treelib import Node, Tree


def gen(s, p):
    e = str(list(map(int, list(s)))).replace(' ', '')
    t.create_node(e, s, parent=p)
    if len(s) < n:
        gen(s + '0', s)
        gen(s + '1', s)


n = 3
t = Tree()
gen('', None)
t.show()
