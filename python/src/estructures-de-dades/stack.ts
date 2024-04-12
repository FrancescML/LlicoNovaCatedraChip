import Snap from 'snapsvg-cjs'

export function main(id: string) {
    const snap = Snap(id)
    const speed = 400

    const t = (x: number, y: number) => `t${x},${y}`

    const stack: Elem[] = []
    let anim = false

    class Elem {
        x: number
        y: number
        label: string
        inside: boolean
        elem: Snap.Element

        constructor(x: number, y: number, label: string) {
            this.x = x
            this.y = y
            this.label = label
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
                        stack.push(this)
                        this.elem.animate(
                            {
                                transform: t(this.x, 10),
                            },
                            speed,
                            () => {
                                this.elem.animate(
                                    {
                                        transform: t(80, 10),
                                    },
                                    speed,
                                    () => {
                                        const yy = 360 - 50 * stack.length
                                        this.elem.animate(
                                            {
                                                transform: t(80, yy),
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
                    }
                }
            })
        }
    }

    const cloud = snap.ellipse(400, 200, 150, 120)
    cloud.attr({
        strokeWidth: 3,
        fill: 'lightgray',
        alpha: 0.5,
    })

    const container = snap.polyline(0, 0, 20, 0, 20, 300, 20 + 100, 300, 20 + 100, 0, 20 + 100 + 20, 0)
    container.attr({
        stroke: 'SeaGreen',
        strokeWidth: 3,
        fill: 'white',
        transform: t(50, 60),
    })

    const remove = () => {
        if (!anim) {
            if (stack.length === 0) {
                window.alert('La pila és buida.')
            } else {
                anim = true
                const top = stack[stack.length - 1]
                stack.pop()
                top.inside = false
                top.elem.animate(
                    {
                        transform: t(80, 10),
                    },
                    speed,
                    () => {
                        top.elem.animate(
                            {
                                transform: t(top.x, 10),
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
            }
        }
    }

    container.click(remove)

    const elem1 = new Elem(350, 110, 'Mary')
    const elem2 = new Elem(450, 160, 'Michelle')
    const elem3 = new Elem(300, 175, 'Kate')
    const elem4 = new Elem(425, 220, 'Mildred')
    const elem5 = new Elem(325, 250, 'Scarlett')
}
