import matplotlib.pyplot as plt
import numpy as np

x = np.linspace(0, 2 * np.pi, 100)
y1 = np.sin(x)
y2 = np.cos(x)

plt.figure(figsize=(10, 6))
plt.plot(x, y1, "b-", linewidth=2, label="sin(x)")
plt.plot(x, y2, "r--", linewidth=2, label="cos(x)")
plt.fill_between(x, y1, y2, alpha=0.3)

plt.xlabel("x (radians)", fontsize=12)
plt.ylabel("y", fontsize=12)
plt.title("Funcions trigonomètriques", fontsize=14, fontweight="bold")
plt.legend(loc="upper right")
plt.grid(True, alpha=0.3)
plt.axhline(y=0, color="k", linewidth=0.5)
plt.axvline(x=0, color="k", linewidth=0.5)

plt.tight_layout()
plt.savefig("p18.svg", bbox_inches="tight")
