from yogi import tokens

paraules: set[str] = set()
for paraula in tokens(str):
    paraules.add(paraula.lower())

for paraula in sorted(paraules):
    print(paraula)
