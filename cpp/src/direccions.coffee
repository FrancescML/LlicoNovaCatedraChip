
element = "div-direccions"

node = (id, x, y) ->
  data:
    id: id
  position:
    x: x
    y: y

arc = (id, src, dst, label) ->
  data:
    id: id
    source: src
    target: dst
    label: label


arc2 = (id, src, dst, label) ->
  data:
    id: id
    source: src
    target: dst
    label: label
    selector: 'arc2'
  style:
    'source-arrow-color': 'SeaGreen'
    'source-arrow-shape': 'triangle'
    'text-margin-y': 10


window.mycy = cytoscape
  container: document.getElementById(element)
  elements: [
    node "acció\ninvocadora", 0, 100
    node "acció\ninvocada", 250, 100
    arc2 "tres", "acció\ninvocadora", "acció\ninvocada", "entrada-i-sortida"
    arc "dos", "acció\ninvocada", "acció\ninvocadora", "sortida"
    arc "un", "acció\ninvocadora", "acció\ninvocada", "entrada"
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
        'shape': 'roundrectangle'
        'width': '100px'
        'height': '50px'
        'text-wrap': 'wrap'
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
        'text-margin-y': -10
    }
  ]
  layout:
    name: 'preset'

window.mycy.nodes().ungrabify()
window.mycy.userZoomingEnabled false
window.mycy.userPanningEnabled false
