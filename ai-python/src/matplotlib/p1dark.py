import matplotlib.pyplot as plt

x = [1, 2, 3, 4, 5]
y = [2, 4, 8, 16, 32]


plt.style.use("dark_background")
plt.plot(x, y)
plt.xlabel("Eix X")
plt.ylabel("Eix Y")
plt.title("El meu primer gràfic")
plt.savefig("p1dark.svg", bbox_inches="tight")
