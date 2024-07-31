snap = Snap "#svg-stack"

speed = 400

t = (x, y) -> "t#{x},#{y}"


stack = []
anim = false


class Elem

   constructor: (@x, @y, @label) ->

      @inside = false

      rect = snap.rect 0, 0, 80, 40, 5, 5

      rect.attr
         stroke: "IndianRed"
         strokeWidth: 3
         fill: "PeachPuff"

      text = snap.text 0, 0, @label

      # això és una mica dubtós, però funciona prou bé...
      tx = (80 - text.node.getBoundingClientRect().width) / 2
      ty = (40 + text.node.getBoundingClientRect().height) / 2 - 4

      text.attr
         transform: t tx, ty

      @elem = snap.group rect, text

      @elem.attr
         transform: t @x, @y

      @elem.click =>
         if not anim
            if @inside
               remove()
            else
               anim = true
               @inside = true
               stack.push @
               @elem.animate
                  transform: t @x, 10
                  speed
                  =>
                     @elem.animate
                        transform: t 80, 10
                        speed
                        =>
                           yy = 360 - 50 * stack.length
                           @elem.animate
                              transform: t 80, yy
                              speed
                              => anim = false


cloud = snap.ellipse 400, 200, 150, 120
cloud.attr
   strokeWidth: 3
   fill: "lightgray"
   alpha: 0.5


container = snap.polyline 0, 0,  20, 0,  20, 300,  20+100, 300,  20+100, 0,  20+100+20, 0
container.attr
   stroke: "SeaGreen"
   strokeWidth: 3
   fill: "white"
   transform: t 50, 60


remove = ->
   if not anim
      if stack.length == 0
         alertify.alert "The stack is empty."
      else
         anim = true
         top = stack[stack.length-1]
         stack.pop()
         top.inside = false
         top.elem.animate
            transform: t 80, 10
            speed
            ->
               top.elem.animate
                  transform: t top.x, 10
                  speed
                  ->
                     top.elem.animate
                        transform: t top.x, top.y
                        speed
                        -> anim = false

container.click remove

elem1 = new Elem 350, 110, "Mary"
elem2 = new Elem 450, 160, "Michelle"
elem3 = new Elem 300, 175, "Kate"
elem4 = new Elem 425, 220, "Mildred"
elem5 = new Elem 325, 250, "Scarlett"
