import matplotlib.pyplot as plt
import numpy as np

dades = np.random.randn(1000)

plt.hist(dades, bins=30, edgecolor="black")
plt.xlabel("Valor")
plt.ylabel("Freqüència")
plt.title("Histograma")
plt.savefig("p4.svg", bbox_inches="tight")
