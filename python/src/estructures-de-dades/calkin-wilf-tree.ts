import Snap from 'snapsvg-cjs'

export function main(id: string) {
    const snap = Snap(id)

    const t = (x: number, y: number) => `t${x},${y}`

    const stack: any[] = []

    let anim = false

    class Node {
        x: number
        y: number
        label: string
        inside: boolean
        node: any

        constructor(x: number, y: number, label: string) {
            this.x = x
            this.y = y
            this.label = label
            this.inside = false

            const rect = snap.circle(0, 0, 20)
            rect.attr({
                stroke: 'IndianRed',
                strokeWidth: 3,
                fill: 'PeachPuff',
            })

            const text = snap.text(0, 0, this.label)
            const tx = (0 - text.node.getBoundingClientRect().width) / 2
            const ty = (0 + text.node.getBoundingClientRect().height) / 2 - 4
            text.attr({
                transform: t(tx, ty),
            })

            this.node = snap.group(rect, text)
            this.node.attr({
                transform: t(this.x, this.y),
            })
        }
    }

    class Edge {
        x1: number
        y1: number
        x2: number
        y2: number

        constructor(x1: number, y1: number, x2: number, y2: number) {
            this.x1 = x1
            this.y1 = y1
            this.x2 = x2
            this.y2 = y2

            const line = snap.line(this.x1, this.y1, this.x2, this.y2)
            line.attr({
                stroke: 'Black',
                strokeWidth: 2,
            })
        }
    }

    new Edge(300, 50, 150, 100)
    new Edge(300, 50, 450, 100)
    new Edge(150, 100, 100, 160)
    new Edge(150, 100, 200, 160)
    new Edge(450, 100, 400, 160)
    new Edge(450, 100, 500, 160)
    new Edge(100, 160, 75, 220)
    new Edge(100, 160, 125, 220)
    new Edge(200, 160, 175, 220)
    new Edge(200, 160, 225, 220)
    new Edge(400, 160, 375, 220)
    new Edge(400, 160, 425, 220)
    new Edge(500, 160, 475, 220)
    new Edge(500, 160, 525, 220)

    const node11 = new Node(300, 50, '1/1')
    const node12 = new Node(150, 100, '1/2')
    const node21 = new Node(450, 100, '2/1')
    const node13 = new Node(100, 160, '1/3')
    const node32 = new Node(200, 160, '3/2')
    const node23 = new Node(400, 160, '2/3')
    const node31 = new Node(500, 160, '3/1')
    const node14 = new Node(75, 220, '1/4')
    const node43 = new Node(125, 220, '4/3')
    const node35 = new Node(175, 220, '3/5')
    const node52 = new Node(225, 220, '5/2')
    const node25 = new Node(375, 220, '2/5')
    const node53 = new Node(425, 220, '5/3')
    const node34 = new Node(475, 220, '3/4')
    const node41 = new Node(525, 220, '4/1')
}
