#!/usr/bin/python3
import pandas as pd

# We use a simple library to render maps from OpenStreetMaps
# Short description here: https://github.com/komoot/staticmap/blob/master/README.md
from staticmap import StaticMap, CircleMarker

# We define the location of the csv file and the name of
# the columns we want to retrive. We ignore the other columns
url = 'http://opendata-ajuntament.barcelona.cat/data/dataset/706e7507-7f84-480e-940d-23265bf5d853/resource/98b893c2-ac83-4f34-b40a-19a4911a066b/download/MERCATS_MUNICIPALS.csv'
market = 'EQUIPAMENT'
lon = 'LONGITUD'
lat = 'LATITUD'
district = 'NOM_DISTRICTE'

# Read the csv file and keep only few columns
df = pd.read_csv(url, usecols=[market, lon, lat, district])

# This is just for pretty printing
pd.set_option('display.max_rows', 20)
pd.set_option('display.width', 200)
print(df)

# Sort alphabetically by name of district
df.sort_values(by=[district], inplace=True)
print(df)

# Get some rows and print them
r8 = df.iloc[[8]]    # 8-th row
p8 = df.loc[[8]]     # row with index 8
print(r8)
print(p8)

# Let's get the list of districts (remove repeated districts)
list_districts = df.NOM_DISTRICTE.unique()
print(list_districts)

# Create a map with all markets in Barcelona.
# Mark each location with a red circle.
m_bcn = StaticMap(600, 600)
for index, row in df.iterrows():
    marker = CircleMarker((row[lon], row[lat]), 'red', 6)
    m_bcn.add_marker(marker)

# Render an image
image = m_bcn.render()
image.save('Markets.png')

# And now only the markets in Ciutat Vella.
# Create another DataFrame with only the markets in Ciutat Vella
df_cv = df.loc[df[district] == 'Ciutat Vella']
print(df_cv)

# We can store the information in another csv file.
# This time, we will use semicolon as separator
df_cv.to_csv('Markets_CiutatVella.csv', sep=';', index=False)

# And now the map
m_cv = StaticMap(600, 600)
for index, row in df_cv.iterrows():
    marker = CircleMarker((row[lon], row[lat]), 'red', 10)
    m_cv.add_marker(marker)

# Render an image
image = m_cv.render()
image.save('Markets_CiutatVella.png')
