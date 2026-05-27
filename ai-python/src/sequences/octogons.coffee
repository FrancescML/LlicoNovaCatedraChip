
element = "div-octogons"

node = (id, x, y) ->
  data:
    id: id
  position:
    x: x
    y: y

arc = (src, dst) ->
  data:
    id: src+"->"+dst
    source: src
    target: dst


window.mycy = cytoscape
  container: document.getElementById(element)
  elements: [
    node "main", 200, 20
    node "escriure_\noctogon", 200, 90
    node "escriure_\npart_superior", 0, 160
    node "escriure_\npart_del_mig", 200, 160
    node "escriure_\npart_inferior", 400, 160
    node "escriure_\nlinia", 200, 230
    arc "main", "escriure_\noctogon"
    arc "escriure_\noctogon", "escriure_\npart_inferior"
    arc "escriure_\noctogon", "escriure_\npart_del_mig"
    arc "escriure_\noctogon", "escriure_\npart_superior"
    arc "escriure_\npart_inferior", "escriure_\nlinia"
    arc "escriure_\npart_del_mig", "escriure_\nlinia"
    arc "escriure_\npart_superior", "escriure_\nlinia"
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
        'width': '150px'
        'height': '40px'
        'text-wrap': 'wrap'
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
    name: 'preset'

window.mycy.nodes().ungrabify()
window.mycy.userZoomingEnabled false
window.mycy.userPanningEnabled false
