
element = "div-graph-undirected-sample"

node = (id) ->
  data:
    id: id

arc = (src, dst) ->
  data:
    id: src+"-"+dst
    source: src
    target: dst


window.cy22 = cytoscape
  container: document.getElementById(element)
  elements: [
    node "0"
    node "1"
    node "2"
    node "3"
    node "4"
    arc "0", "1"
    arc "0", "2"
    arc "1", "2"
    arc "1", "3"
    arc "2", "4"
    arc "3", "4"
  ]
  style: [
    {
      selector: 'node'
      style:
        'border-color': 'IndianRed'
        'border-width': 2
        'background-color': 'PeachPuff'
        'text-halign': 'center'
        'text-valign': 'center'
        'color': 'black'
        'label': 'data(id)'
    }
    {
      selector: 'edge'
      style:
        'width': 2
        'line-color': 'SeaGreen'
        'target-arrow-color': 'SeaGreen'
        "curve-style": "bezier",
        "control-point-step-size": 40
    }
  ]
  layout:
    name: 'cose'
