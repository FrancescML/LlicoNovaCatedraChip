from yogi import tokens

paraules: list[str] = []
for paraula in tokens(str):
    paraula = paraula.lower()
    if paraula not in paraules:
        paraules.append(paraula)

for paraula in sorted(paraules):
    print(paraula)
