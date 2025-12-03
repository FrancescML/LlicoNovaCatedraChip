import matplotlib.pyplot as plt

etiquetes = ["Python", "Java", "JavaScript", "C++"]
mides = [35, 25, 20, 20]
colors = ["gold", "lightblue", "lightgreen", "coral"]
explode = (0.1, 0, 0, 0)

plt.pie(
    mides,
    explode=explode,
    labels=etiquetes,
    colors=colors,
    autopct="%1.1f%%",
    shadow=True,
    startangle=90,
)
plt.axis("equal")
plt.savefig("p6.svg")
