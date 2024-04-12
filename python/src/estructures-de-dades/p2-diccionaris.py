from yogi import read, tokens
from typing import TypeAlias
from pprint import pprint

Index: TypeAlias = dict[str, set[str]]


def construir_index() -> Index:
    index: Index = {}
    for doc in tokens(str):
        n = read(int)
        for i in range(n):
            par = read(str)
            if par in index:
                index[par].add(doc)
            else:
                index[par] = {doc}
    return index


def escriure_documents(index: Index, par: str) -> None:
    if par in index:
        print(f'La paraula {par} apareix en aquests documents:')
        for doc in index[par]:
            print(doc)
    else:
        print(f'La paraula {par} no apareix en cap document.')


idx = construir_index()
pprint(idx)
