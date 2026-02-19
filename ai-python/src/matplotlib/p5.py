import matplotlib.pyplot as plt

categories = ["A", "B", "C", "D"]
valors = [23, 45, 56, 78]

plt.bar(categories, valors, color="skyblue")
plt.xlabel("Categoria")
plt.ylabel("Valor")
plt.savefig("p5.svg", bbox_inches="tight")
