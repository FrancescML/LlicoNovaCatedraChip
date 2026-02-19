import matplotlib.pyplot as plt
import numpy as np

x = np.linspace(0, 10, 100)

plt.plot(x, x, "r-", label="línia vermella")
plt.plot(x, x**1.5, "b--", label="línia blava discontínua")
plt.plot(x, x**2, "g:", linewidth=3, label="línia verda de punts")
plt.legend()
plt.savefig("p11.svg", bbox_inches="tight")
