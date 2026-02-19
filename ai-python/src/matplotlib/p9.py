import matplotlib.pyplot as plt
import numpy as np

dades = [np.random.normal(0, std, 100) for std in range(1, 5)]

plt.violinplot(dades, showmeans=True, showmedians=True)
plt.xlabel("Grups")
plt.ylabel("Valors")
plt.savefig("p9.svg", bbox_inches="tight")
