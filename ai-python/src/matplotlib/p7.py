import matplotlib.pyplot as plt
import numpy as np

dades = [np.random.normal(0, std, 100) for std in range(1, 4)]

plt.boxplot(dades, tick_labels=["Grup 1", "Grup 2", "Grup 3"])
plt.ylabel("Valors")
plt.savefig("p7.svg", bbox_inches="tight")
