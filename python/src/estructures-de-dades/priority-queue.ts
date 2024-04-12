import Snap from 'snapsvg-cjs'

export function main(id: string) {
    const snap = Snap(id)

    const speed = 400
    const t = (x: number, y: number) => `t${x},${y}`
    let anim = false

    class Elem {
        x: number
        y: number
        label: string
        prio: number
        dx: number
        dy: number
        inside: boolean
        elem: Snap.Element

        constructor(x: number, y: number, label: string, prio: number, dx: number, dy: number) {
            this.x = x
            this.y = y
            this.label = label
            this.prio = prio
            this.dx = dx
            this.dy = dy
            this.inside = false

            const rect = snap.rect(0, 0, 80, 40, 5, 5)
            rect.attr({
                stroke: 'IndianRed',
                strokeWidth: 3,
                fill: 'PeachPuff',
            })

            const text = snap.text(0, 0, this.label)
            const tx = (80 - text.node.getBoundingClientRect().width) / 2
            const ty = (40 + text.node.getBoundingClientRect().height) / 2 - 4
            text.attr({
                transform: t(tx, ty),
            })

            this.elem = snap.group(rect, text)
            this.elem.attr({
                transform: t(this.x, this.y),
            })

            this.elem.click(() => {
                if (!anim) {
                    if (this.inside) {
                        remove()
                    } else {
                        anim = true
                        this.inside = true
                        this.elem.animate(
                            {
                                transform: t(this.x, 30),
                            },
                            speed,
                            () => {
                                this.elem.animate(
                                    {
                                        transform: t(140, 30),
                                    },
                                    speed,
                                    () => {
                                        this.elem.animate(
                                            {
                                                transform: t(140, 150),
                                            },
                                            500,
                                            () => {
                                                this.elem.animate(
                                                    {
                                                        transform: t(this.dx, this.dy),
                                                    },
                                                    500,
                                                    () => {
                                                        anim = false
                                                    },
                                                )
                                            },
                                        )
                                    },
                                )
                            },
                        )
                    }
                }
            })
        }
    }

    const cloud = snap.ellipse(500, 250, 150, 120)
    cloud.attr({
        strokeWidth: 3,
        fill: 'lightgray',
        alpha: 0.5,
    })

    const container = snap.polyline(100, -20, 120, 0, 120, 40, 40, 40, 40, 260, 320, 260, 320, 40, 240, 40, 240, 0, 260, -20)
    container.attr({
        stroke: 'SeaGreen',
        strokeWidth: 3,
        fill: 'white',
        transform: t(0, 100),
    })

    const remove = () => {
        if (!anim) {
            let idx = -1
            let bst = 0
            for (let i = 0; i < elems.length; i++) {
                const x = elems[i]
                if (x.inside && x.prio > bst) {
                    idx = i
                    bst = x.prio
                }
            }
            if (idx === -1) {
                window.alert('The priority queue is empty.')
            } else {
                anim = true
                const top = elems[idx]
                top.inside = false
                top.elem.animate(
                    {
                        transform: t(140, 150),
                    },
                    500,
                    () => {
                        top.elem.animate(
                            {
                                transform: t(140, 30),
                            },
                            500,
                            () => {
                                top.elem.animate(
                                    {
                                        transform: t(top.x, 30),
                                    },
                                    speed,
                                    () => {
                                        top.elem.animate(
                                            {
                                                transform: t(top.x, top.y),
                                            },
                                            speed,
                                            () => {
                                                anim = false
                                            },
                                        )
                                    },
                                )
                            },
                        )
                    },
                )
            }
        }
    }

    container.click(remove)

    const elem1 = new Elem(425, 160, '66', 1, 220, 200)
    const elem2 = new Elem(400, 225, '50', 2, 100, 200)
    const elem3 = new Elem(525, 270, '44', 3, 100, 300)
    const elem4 = new Elem(525, 170, '44', 3, 200, 150)
    const elem5 = new Elem(550, 220, '12', 4, 60, 150)
    const elem6 = new Elem(425, 300, '12', 4, 120, 250)

    const elems = [elem1, elem2, elem3, elem4, elem5, elem6]
}
