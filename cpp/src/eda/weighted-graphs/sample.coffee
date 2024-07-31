
element = "div-sample"

node = (id) ->
  data:
    id: id

arc = (src, dst, weight) ->
  data:
    id: src+"->"+dst
    source: src
    target: dst
    label: weight


window.cy = cytoscape
  container: document.getElementById(element)
  elements: [
    node "0"
    node "1"
    node "2"
    node "3"
    node "4"
    node "5"
    node "6"
    node "7"
    arc "0", "1", "10"
    arc "2", "1", "1"
    arc "2", "3", "1"
    arc "3", "4", "3"
    arc "4", "5", "-1"
    arc "5", "2", "-2"
    arc "6", "5", "-1"
    arc "6", "1", "-4"
    arc "7", "6", "1"
    arc "0", "7", "8"
    arc "1", "5", "2.5"
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
        'label': 'data(label)',
        'width': 2
        'line-color': 'SeaGreen'
        'target-arrow-color': 'SeaGreen'
        'target-arrow-shape': 'triangle'
        "curve-style": "bezier",
        "control-point-step-size": 40
#        'text-margin-y': -10
        'text-rotation' : 'autorotate'
    }
  ]
  layout:
    name: 'circle'
