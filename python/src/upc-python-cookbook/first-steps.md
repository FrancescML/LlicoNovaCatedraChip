# Diving into Python

In this section we present two short pieces of code that
will serve as an informal introduction to Python, its syntax and a glimpse of
its capabilities. All of the topics commented here are further discussed in
the following chapters where we go through more particularities.

## A first Python program

Let's get started and take a look at our first Python code! Here it is:

```python
def common_letter(word1, word2):
    for x in word1:
        if x in word2:
            return True
    return False

def main():
    a = 'python'
    b = input('Insert word: ')

    if common_letter(a, b):
        print('At least one letter in common with', a, '!')
    else:
        print('No letter in common...')

main()
```

<!-- > jo aniria més poc a poc. a l'explicació següent hi ha moltes coses, tantes que ho fa semblar complicat. -->

That's what happens when we execute it and input the following word:

```text
Insert word: cookbook
At least one letter in common with python !
```

Analysing the code in greater detail, the first line that has been executed is the call to the function `main()`. Next, in `a = 'python'` we assign a name (`a`) on the left with a value (the string `'python'`) on the right. Notice that there is no need to declare the type of variables.

The third line in order of execution is `b = input('Insert word: ')`. It is analogous to the previous one but in this case, the value is given by the [`input()`](https://docs.python.org/3/library/functions.html#input) function that reads a line, converts it to a string and returns it.

Once we have `a` and `b` defined, we would like to know if they share at least one letter. To do so, we encounter our first [`if`](https://docs.python.org/3/reference/compound_stmts.html#if) statement which is evaluated according to the call to the function `common_letter(word1, word2)`.

In Python, functions are defined with the [`def`](https://docs.python.org/3/reference/compound_stmts.html#def) keyword and we don't have to specify which type of object is returned. The body of the function is pretty self-explanatory. For each character in the first word we check if it is present in the second word. In case we find a coincidence we return `True` or `False` otherwise. Notice that Python doesn't use curly brackets to group different code blocks. Instead, it relies on identation.

Finally, we use the [`print()`](https://docs.python.org/3/library/functions.html#print) function in the body of the `if`-`else` clause.

So far so good.

## A second Python program

Why don't we take Python some steps further?

Rather than manually entering our data we can download it. The `json` format is commonly used to exchange data between a server and a web application. For instance, http://wservice.viabicing.cat/v2/stations provides real-time information of the Barcelona city council bicycle service, _Bicing_. This address contains a `json` file with the location of each station together with the number of bikes and slots available among others.

Find below a fragment of the file:

```json
{
    "stations": [
        {
            "id": "1",
            "type": "BIKE",
            "latitude": "41.397952",
            "longitude": "2.180042",
            "streetName": "Gran Via Corts Catalanes",
            "streetNumber": "760",
            "altitude": "21",
            "slots": "29",
            "bikes": "0",
            "nearbyStations": "24, 369, 426",
            "status": "CLS"
        },
        {
            "id": "2",
            "type": "BIKE",
            "latitude": "41.39553",
            "longitude": "2.17706",
            "streetName": "Roger de Flor/ Gran Vía",
            "streetNumber": "126",
            "altitude": "21",
            "slots": "8",
            "bikes": "17",
            "nearbyStations": "2",
            "status": "OPN"
        }
        /* ... */
    ],
    "updateTime": 1550096472
}
```

In order to download and read this file with Python we need to use two Python built-in modules: [`urllib.request`](https://docs.python.org/3/library/urllib.request.html) for opening the `url` and [`json`](https://docs.python.org/3/library/json.html) to decode the file obtained:

```python
import urllib.request
import json

response = urllib.request.urlopen('http://wservice.viabicing.cat/v2/stations')
bicing = json.load(response)
```

Essentially, the structure of the file is a dictionary with two keys: `'stations'` and `'updateTime'`. Inside of `'stations'`, we have a list of all the _Bicing_ stations and, for each one, we have another dictionary with all its relevant information.

For instance, if you want to print the location of all the open stations, you can loop over `bicing['stations']` in this natural way:

```python
for station in bicing['stations']:
    if station['status'] == 'OPN':
        print(station['streetName'], station['streetNumber'])
```

To visualize this information on a map you can rely on a useful third-party module called [Folium](https://github.com/python-visualization/folium). It allows you to manipulate data in Python with minimal instructions and it gets the job done in the background. To install it you just need to open the Terminal (or the Anaconda Prompt on Windows) and enter the command

```shell
conda install folium
```

Once it is installed, you can import the module and start working:

```python
import folium

BCN_COORDINATES = [41.390205, 2.154007]

# Create the base map
m = folium.Map(location=BCN_COORDINATES, tiles='Stamen Terrain', zoom_start=12)
```

At this point, if you display the map by just typing

```python
>>> m
```

you will see the map of Barcelona magically appear.

Let's now focus on bringing the open stations to the map `m`. To do so, you can repeat the same loop as before and for each station define a marker from the `folium` module and add it to the map:

```python
for station in bicing['stations']:
    if station['status'] == 'OPN':
        lat, lon = float(station['latitude']), float(station['longitude'])
        # Create new marker...
        new_marker = folium.CircleMarker(location=[lat, lon])
        # ... and add it to the map
        new_marker.add_to(m)
```

Note that you need to parse the latitude and longitude into floats since in the loaded data they come as strings. Again, you can display `m` to make sure that you are on the right path and all the open stations are marked:

<iframe width="100%" height="500" frameborder="0" src="/programes/bicing-map-0.html"> </iframe>

&nbsp;

Finally, you can enhance the visualization by means of changing the color of the stations according to how many bikes are available and adding pop-ups:

```python
# Function that determines the color of the stations
def set_color(bikes, slots):
    if bikes > slots:
        return 'green'
    elif 3*bikes > slots:
        return 'orange'
    return 'red'

# Iterate the list of stations
for station in bicing['stations']:
    # Only interested in open stations
    if station['status'] == 'OPN':
        # Get the required information from the station
        slots, bikes = int(station['slots']), int(station['bikes'])
        lat, lon = float(station['latitude']), float(station['longitude'])
        # Text that will appear in the marker
        text = str(bikes) + '/' + str(bikes+slots) + ' available'
        # Create new marker...
        new_marker = folium.CircleMarker(location=[lat, lon], radius=7,
                                         popup=text, fill_color=set_color(bikes, slots),
                                         color='gray', fill_opacity=0.7)
        # ... and add it to the map
        new_marker.add_to(m)

# Save map
m.save('bicing-map.html')
```

You can download the full program [here](/programes/bicing-map.py) to obtain a map like this one!

<iframe width="100%" height="500" frameborder="0" src="/programes/bicing-map.html"> </iframe>

<Autors autors="adell"/>
