snap = Snap "#svg-queue"

speed = 400

t = (x, y) -> "t#{x},#{y}"


queue = []
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
               queue.unshift @
               @elem.animate
                  transform: t 50, 340
                  speed
                  =>
                     @elem.animate
                        transform: t 60 + 600 - 100 * queue.length, 340
                        speed
                        => anim = false



remove = ->
   if not anim
      if queue.length == 0
         alertify.alert "The queue is empty."
      else
         anim = true
         front = queue[queue.length-1]
         queue.pop()
         front.inside = false
         front.elem.animate
            transform: t 700, 340
            speed
            ->
               front.elem.animate
                  transform: t front.x, front.y
                  speed
                  ->
                     c = queue.length
                     c2 = queue.length
                     for e in queue
                        --c2
                        e.elem.animate
                           transform: t 60 + 600 - 100 * (c2+1), 340
                           speed
                           ->
                              if --c == 0
                                 anim = false

container1 = snap.polyline 0, 0,  20, 20,  520, 20,  540, 0
container2 = snap.polyline 0, 120,  20, 100,  520, 100,  540, 120
container3 = snap.rect 20, 20,  500, 80
container = snap.group container3, container1, container2

container1.attr
   stroke: "SeaGreen"
   strokeWidth: 3
   fill: "white"
container2.attr
   stroke: "SeaGreen"
   strokeWidth: 3
   fill: "white"
container3.attr
   fill: "white"
container.attr
   transform: t 130, 300


cloud = snap.ellipse 400, 150, 150, 120
cloud.attr
   strokeWidth: 3
   fill: "lightgray"
   alpha: 0.5


container.click remove

elem1 = new Elem 350, 60, "Orange"
elem2 = new Elem 450, 110, "Apple"
elem3 = new Elem 300, 125, "Banana"
elem4 = new Elem 425, 180, "Pear"
elem5 = new Elem 325, 200, "Cherry"

