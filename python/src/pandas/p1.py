import pandas as pd
import matplotlib.pyplot as plt

# Descarregar dades de l'API de dades obertes de la UE sobre temperatures
url = "https://api.open-meteo.com/v1/forecast?latitude=41.39&longitude=2.16&hourly=temperature_2m&forecast_days=3"

# Llegir les dades directament amb pandas
df = pd.read_json(url)

# Extreure les temperatures i hores
temps = pd.DataFrame(
    {
        "Hora": pd.to_datetime(df["hourly"]["time"]),
        "Temperatura": df["hourly"]["temperature_2m"],
    }
)

# Calcular estadístiques bàsiques
print("Temperatures a Barcelona (pròxims 3 dies)")
print(f"Temperatura mitjana: {temps['Temperatura'].mean():.1f}°C")
print(f"Temperatura màxima: {temps['Temperatura'].max():.1f}°C")
print(f"Temperatura mínima: {temps['Temperatura'].min():.1f}°C")

# Crear un gràfic
plt.figure(figsize=(12, 5))
plt.plot(temps["Hora"], temps["Temperatura"], linewidth=2, color="coral")
plt.title("Temperatura a Barcelona", fontsize=14, fontweight="bold")
plt.xlabel("Data i Hora")
plt.ylabel("Temperatura (°C)")
plt.grid(True, alpha=0.3)
plt.xticks(rotation=45)
plt.tight_layout()
plt.savefig("p1.svg")
