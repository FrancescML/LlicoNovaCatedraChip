snap = Snap "#svg-priority_queue"

speed = 400

t = (x, y) -> "t#{x},#{y}"


anim = false


class Elem

   constructor: (@x, @y, @label, @prio, @dx, @dy) ->

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
               @elem.animate
                  transform: t @x, 30
                  speed
                  =>
                     @elem.animate
                        transform: t 140, 30
                        speed
                        =>
                           @elem.animate
                              transform: t 140, 150
                              500
                              =>
                                 @elem.animate
                                    transform: t @dx, @dy
                                    500
                                    => anim = false


cloud = snap.ellipse 500, 250, 150, 120
cloud.attr
   strokeWidth: 3
   fill: "lightgray"
   alpha: 0.5


container = snap.polyline 100, -20,  120, 0,  120, 40,  40, 40,  40, 260,  320, 260,  320, 40,  240, 40,  240, 0, 260, -20
container.attr
   stroke: "SeaGreen"
   strokeWidth: 3
   fill: "white"
   transform: t 0, 100


remove = ->
   if not anim

      idx = -1
      bst = 0
      for x, i in elems
         if x.inside and x.prio > bst
            idx = i
            bst = x.prio

      if idx == -1
         alertify.alert "The priority queue is empty."
      else
         anim = true
         top = elems[idx]
         top.inside = false
         top.elem.animate
            transform: t 140, 150
            500
            ->
               top.elem.animate
                  transform: t 140, 30
                  500
                  ->
                     top.elem.animate
                        transform: t top.x, 30
                        speed
                        -> top.elem.animate
                              transform: t top.x, top.y
                              speed
                              -> anim = false

container.click remove

elem1 = new Elem 425, 160, "Tribune", 6, 220, 200
elem2 = new Elem 400, 225, "Legate", 5, 100, 200
elem3 = new Elem 525, 270, "Centurion", 4, 100, 300
elem4 = new Elem 525, 170, "Centurion", 4, 200, 150
elem5 = new Elem 550, 220, "Legionary", 1, 60, 150
elem6 = new Elem 425, 300, "Legionary", 1, 120, 250
elems = [elem1, elem2, elem3, elem4, elem5, elem6]
