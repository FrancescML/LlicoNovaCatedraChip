snap = Snap "#svg-calkin-wilf-tree"

t = (x, y) -> "t#{x},#{y}"


stack = []
anim = false


class Node

   constructor: (@x, @y, @label) ->

      @inside = false

      rect = snap.circle 0, 0, 20

      rect.attr
         stroke: "IndianRed"
         strokeWidth: 3
         fill: "PeachPuff"

      text = snap.text 0, 0, @label

      # això és una mica dubtós, però funciona prou bé...
      tx = (0 - text.node.getBoundingClientRect().width) / 2
      ty = (0 + text.node.getBoundingClientRect().height) / 2 - 4

      text.attr
         transform: t tx, ty

      @node = snap.group rect, text

      @node.attr
         transform: t @x, @y


class Edge

   constructor: (@x1, @y1, @x2, @y2) ->

      line = snap.line @x1, @y1, @x2, y2

      line.attr
         stroke: "Black"
         strokeWidth: 2
         

new Edge 300, 50, 150, 100
new Edge 300, 50, 450, 100
new Edge 150, 100, 100, 160
new Edge 150, 100, 200, 160
new Edge 450, 100, 400, 160
new Edge 450, 100, 500, 160

new Edge 100, 160, 75, 220
new Edge 100, 160, 125, 220
new Edge 200, 160, 175, 220
new Edge 200, 160, 225, 220

new Edge 400, 160, 375, 220
new Edge 400, 160, 425, 220
new Edge 500, 160, 475, 220
new Edge 500, 160, 525, 220

      
node11 = new Node 300,  50, "1/1"

node12 = new Node 150, 100, "1/2"
node21 = new Node 450, 100, "2/1"

node13 = new Node 100, 160, "1/3"
node32 = new Node 200, 160, "3/2"
node23 = new Node 400, 160, "2/3"
node31 = new Node 500, 160, "3/1"

node14 = new Node  75, 220, "1/4"
node43 = new Node 125, 220, "4/3"
node35 = new Node 175, 220, "3/5"
node52 = new Node 225, 220, "5/2"

node25 = new Node 375, 220, "2/5"
node53 = new Node 425, 220, "5/3"
node34 = new Node 475, 220, "3/4"
node41 = new Node 525, 220, "4/1"

