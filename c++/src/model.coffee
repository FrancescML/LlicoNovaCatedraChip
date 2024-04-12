snap = Snap "#svg-model"


t = (x, y) -> "t#{x},#{y}"


class Box

   constructor: (@xc, @yc, @width, @height, @label, @attrs) ->

      rect = snap.rect 0, 0, @width, @height, 5, 5

      rect.attr @attrs

      text = snap.text 0, 0, @label

      # això és una mica dubtós, però funciona prou bé...
      tx = (@width - text.node.getBoundingClientRect().width) / 2
      ty = (@height + text.node.getBoundingClientRect().height) / 2 - 4

      text.attr
         transform: t tx, ty

      @elem = snap.group rect, text

      @elem.attr
         transform: t @xc, @yc


elem0 = snap.rect 120, 10, 360, 270, 5, 5

elem0.attr
   stroke: "Maroon"
   strokeWidth: 3
   fill: "Linen"

attr =
   stroke: "IndianRed"
   strokeWidth: 3
   fill: "PeachPuff"

elem1 = new Box 200, 30, 200, 40, "Memòria", attr
elem2 = new Box 200, 90, 200, 40, "Unitat de càlcul", attr
elem3 = new Box 200, 150, 200, 40, "Unitat de control", attr
elem4 = new Box 80, 210, 200, 40, "Dispositiu d'entrada", attr
elem5 = new Box 320, 210, 200, 40, "Dispositiu de sortida", attr

attr2 =
   strokeWidth: 0
   fill: "White"

caption = new Box 120, 300, 360, 40, "Elements del model abstracte de computador", attr2

fig = snap.group elem0, elem1.elem, elem2.elem, elem3.elem, elem4.elem, elem5.elem, caption.elem

