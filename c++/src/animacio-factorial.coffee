snap = Snap "#svg-animacio-factorial"

speed = 400

t = (x, y) -> "t#{x},#{y}"


anim = false


class Frame

   constructor: (@x, @y, @w, @h, @label) ->

      rect = snap.rect 0, 0, @w, @h, 5, 5

      rect.attr
         stroke: "IndianRed"
         strokeWidth: 3
         fill: "PeachPuff"

      text = snap.text 0, 0, @label

      text.attr
         transform: t 20, 30

      @elem = snap.group rect, text

      @elem.attr
         transform: t @x, @y


class Circle

   constructor: (@x, @y) ->

      circle = snap.circle 0, 0, 14

      circle.attr
         stroke: "IndianRed"
         strokeWidth: 3
         fill: "PeachPuff"

      text = snap.text 0, 0, '×'

      text.attr
         transform: t -5, 5

      @elem = snap.group circle, text

      @elem.attr
         transform: t @x, @y


frame_n  = new Frame 40, 20, 780, 350, "factorial(n)"
frame_n1 = new Frame 100, 70, 600, 280, "factorial(n-1)"
frame_n2 = new Frame 160, 120, 420, 210, "factorial(n-2)"
frame_0  = new Frame 280, 260, 180, 50, "factorial(0)"

circle_0 = new Circle 520, 285
circle_n2 = new Circle 640, 285
circle_n1 = new Circle 760, 285

