import matplotlib.pyplot as plt
import numpy as np

x = np.linspace(0, 10, 100)

plt.figure(figsize=(10, 4))

plt.subplot(1, 2, 1)
plt.plot(x, np.sin(x))
plt.title("sin(x)")

plt.subplot(1, 2, 2)
plt.plot(x, np.cos(x))
plt.title("cos(x)")

plt.tight_layout()
plt.savefig("p10.svg", bbox_inches="tight")
