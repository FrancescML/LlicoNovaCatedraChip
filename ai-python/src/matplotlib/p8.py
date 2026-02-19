import matplotlib.pyplot as plt
import numpy as np

dades = np.random.rand(10, 10)

plt.imshow(dades, cmap="viridis", aspect="auto")
plt.colorbar()
plt.title("Mapa de calor")
plt.savefig("p8.svg", bbox_inches="tight")
