from yogi import tokens

comptadors: dict[str, int] = {}

for paraula in tokens(str):
    paraula = paraula.lower()
    if paraula not in comptadors:
        comptadors[paraula] = 1
    else:
        comptadors[paraula] += 1

for paraula, comptador in sorted(comptadors.items(), key=lambda x: (x[1], x[0])):
    print(comptador, paraula)
    