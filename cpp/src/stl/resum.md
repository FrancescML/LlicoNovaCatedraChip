# Contenidors: resum

<img src='./resum.png' style='height: 10em; float: right; margin: 0 0 1em 1em;'/>

Aquesta pàgina resumeix les principals operacions dels contenidors
del la llibreria estàndard de C++ que s'han descrit i en dóna la seva
eficiència.

A totes les taules, $n$ denota el nombre d'elements dins del contenidor,
és a dir, el seu `size()`.

<table>
    <thead>
        <tr>
            <th>Contenidor</th>
            <th colspan=3>Cost en el cas pitjor i mitjà</th>
            <th>Espai</th>
        </tr>
        <tr>
            <th></th>
            <th>Consulta</th>
            <th>Inserció</th>
            <th>Esborrat</th>
            <th></th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Pila<br/>`stack`</td>
            <td>O(1)</td>
            <td>O(1)</td>
            <td>O(1)</td>
            <td>O(n)</td>
        </tr>
        <tr>
            <td>Cua<br/>`queue`</td>
            <td>O(1)</td>
            <td>O(1)</td>
            <td>O(1)</td>
            <td>O(n)</td>
        </tr>
        <tr>
            <td>Cua de prioritats<br/>`priority_queue`</td>
            <td>O(1)</td>
            <td>O(log n)</td>
            <td>O(log n)</td>
            <td>O(n)</td>
        </tr>
    </tbody>
</table>

<table>
    <thead>
        <tr>
            <th>Contenidor</th>
            <th colspan=3>Cost en el cas pitjor</th>
            <th colspan=3>Cost en el cas mitjà</th>
            <th>Espai</th>
        </tr>
        <tr>
            <th></th>
            <th>Cerca</th>
            <th>Inserció</th>
            <th>Esborrat</th>
            <th>Cerca</th>
            <th>Inserció</th>
            <th>Esborrat</th>
            <th></th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Conjunt<br/>`set`</td>
            <td>O(log n)</td>
            <td>O(log n)</td>
            <td>O(log n)</td>
            <td>O(log n)</td>
            <td>O(log n)</td>
            <td>O(log n)</td>
            <td>O(n)</td>
        </tr>
        <tr>
            <td>Diccionari<br/>`map`</td>
            <td>O(log n)</td>
            <td>O(log n)</td>
            <td>O(log n)</td>
            <td>O(log n)</td>
            <td>O(log n)</td>
            <td>O(log n)</td>
            <td>O(n)</td>
        </tr>
        <tr>
            <td>Conjunt no ordenat<br/>`unordered_set`</td>
            <td>O(n)</td>
            <td>O(n)</td>
            <td>O(n)</td>
            <td>O(1)</td>
            <td>O(1)</td>
            <td>O(1)</td>
            <td>O(n)</td>
        </tr>
        <tr>
            <td>Diccionari no ordenat<br/>`unordered_map`</td>
            <td>O(n)</td>
            <td>O(n)</td>
            <td>O(n)</td>
            <td>O(1)</td>
            <td>O(1)</td>
            <td>O(1)</td>
            <td>O(n)</td>
        </tr>
    </tbody>
</table>

<Autors autors="jpetit jordic"/>
