snap = Snap "#svg-josefus"

t = (x, y) -> "t#{x},#{y}"
T = (x, y) -> "T#{x},#{y}"

delay = (ms, func) -> setTimeout func, ms

anim = false
speed = 400


class Elem

    constructor: (@x, @y, @label) ->

        circ = snap.circle 0, 0, 20

        circ.attr
            stroke: "IndianRed"
            strokeWidth: 3
            fill: "PeachPuff"

        text = snap.text 0, 0, @label

        # això és una mica dubtós, però funciona prou bé...
        tx = (-text.node.getBoundingClientRect().width) / 2
        ty = (text.node.getBoundingClientRect().height) / 2 - 4

        text.attr
            transform: t tx, ty

        @alive = true

        @elem = snap.group circ, text

        @elem.attr
            transform: t @x, @y


n = 11
c = n - 1
k = 3
current = 0
elems = []

audioPop = new Audio 'pop.mp3'
audioYay = new Audio 'yay.mp3'
audioArgh = new Audio 'argh.mp3'

click = ->
    if c != 0 and not anim
        anim = true

        cur = elems[current]
        audioArgh.play()
        cur.elem.animate
            transform: t cur.x, 500
            speed
            =>
                cur.alive = false
                animation k


animation = (k) ->
    if k == 0
        --c
        if c == 0
            audioYay.play()
            cursor.attr
                stroke: "SeaGreen"
                strokeWidth: 9
        anim = false
    else
        cur = elems[current]
        i = 1
        while not elems[(current+i)%n].alive
            i = i + 1
        nxt = elems[(current+i)%n]

        # audioPop.play()
        cursor.animate
            transform: t nxt.x - 350, nxt.y - 200
            speed
            =>
                i = 1
                while not elems[(current+i)%n].alive
                    i = i + 1
                current = (current+i)%n
                delay 200, => animation k - 1



circle = snap.circle 200, 200, 150
circle.attr
    strokeWidth: 3
    fill: "lightgray"
    color: "lightgray"
    alpha: 0.5

circle.click -> click()

label = snap.text 200, 200, "J"
label.attr
    fill: "IndianRed"
    "font-size": 192
    "font-family": "Times"

tx = (-label.node.getBoundingClientRect().width) / 2
ty = (label.node.getBoundingClientRect().height) / 4

label.attr
    transform: t tx, ty

label.click -> click()

cursor = snap.circle 350, 200, 30
cursor.attr
    stroke: "black"
    strokeWidth: 3
    fill: "white"
    alpha: 0

for i in [0 .. n-1]
    x = 200 + 150 * Math.cos (i * 360 / n / 180 * 3.1416)
    y = 200 + 150 * Math.sin (i * 360 / n / 180 * 3.1416)
    e = new Elem x, y, String (i+1)
    elems.push e
