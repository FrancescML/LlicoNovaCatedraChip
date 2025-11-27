import matplotlib.pyplot as plt
import numpy as np

x = np.linspace(-3, 3, 100)
y = np.linspace(-3, 3, 100)
X, Y = np.meshgrid(x, y)
Z = np.sin(X) * np.cos(Y)

plt.contour(X, Y, Z, levels=10, cmap="RdBu")
plt.colorbar()
plt.contourf(X, Y, Z, levels=10, cmap="RdBu", alpha=0.3)
plt.savefig("p16.svg")
