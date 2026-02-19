import matplotlib.pyplot as plt
import numpy as np

plt.style.use("seaborn-v0_8-darkgrid")

x = np.linspace(0, 10, 100)
plt.plot(x, np.sin(x))
plt.savefig("p13.svg", bbox_inches="tight")
