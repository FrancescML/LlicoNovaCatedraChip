
element = "div-graph-sample"

node = (id) ->
  data:
    id: id

arc = (src, dst) ->
  data:
    id: src+"->"+dst
    source: src
    target: dst


window.cy = cytoscape
  container: document.getElementById(element)
  elements: [
    node "0"
    node "1"
    node "2"
    node "3"
    node "4"
    node "5"
    arc "0", "2"
    arc "0", "3"
    arc "1", "2"
    arc "2", "3"
    arc "3", "2"
    arc "1", "4"
    arc "4", "1"
    arc "4", "3"
    arc "4", "5"
    arc "5", "0"
    arc "5", "1"
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
        'target-arrow-shape': 'triangle'
        "curve-style": "bezier",
        "control-point-step-size": 40
    }
  ]
  layout:
    name: 'circle'
