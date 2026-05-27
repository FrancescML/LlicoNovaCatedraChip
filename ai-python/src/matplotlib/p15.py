import matplotlib.pyplot as plt
import numpy as np

x = np.linspace(0, 10, 100)
y = np.sin(x)

plt.plot(x, y)
plt.annotate(
    "Màxim",
    xy=(np.pi / 2, 1),
    xytext=(2, 1.3),
    arrowprops=dict(arrowstyle="->", color="red"),
)
plt.text(8, -0.5, "y = sin(x)", fontsize=12, style="italic")
plt.savefig("p15.svg", bbox_inches="tight")
