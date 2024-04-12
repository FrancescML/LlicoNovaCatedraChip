import Snap from 'snapsvg-cjs'

export function main(id: string) {
    const snap = Snap(id)

    const speed = 400

    const t = (x: number, y: number) => `t${x},${y}`

    const queue: Elem[] = []
    let anim = false

    class Elem {
        inside: boolean
        elem: Snap.Element

        constructor(public x: number, public y: number, public label: string) {
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
                        queue.unshift(this)
                        this.elem.animate(
                            {
                                transform: t(50, 340),
                            },
                            speed,
                            () => {
                                this.elem.animate(
                                    {
                                        transform: t(60 + 600 - 100 * queue.length, 340),
                                    },
                                    speed,
                                    () => (anim = false),
                                )
                            },
                        )
                    }
                }
            })
        }
    }

    const remove = () => {
        if (!anim) {
            if (queue.length === 0) {
                window.alert('The queue is empty.')
            } else {
                anim = true
                const front = queue[queue.length - 1]
                queue.pop()
                front.inside = false
                front.elem.animate(
                    {
                        transform: t(700, 340),
                    },
                    speed,
                    () => {
                        front.elem.animate(
                            {
                                transform: t(front.x, front.y),
                            },
                            speed,
                            () => {
                                let c = queue.length
                                let c2 = queue.length
                                for (const e of queue) {
                                    --c2
                                    e.elem.animate(
                                        {
                                            transform: t(60 + 600 - 100 * (c2 + 1), 340),
                                        },
                                        speed,
                                        () => {
                                            if (--c === 0) {
                                                anim = false
                                            }
                                        },
                                    )
                                }
                            },
                        )
                    },
                )
            }
        }
    }

    const container1 = snap.polyline(0, 0, 20, 20, 520, 20, 540, 0)
    const container2 = snap.polyline(0, 120, 20, 100, 520, 100, 540, 120)
    const container3 = snap.rect(20, 20, 500, 80)
    const container = snap.group(container3, container1, container2)
    container1.attr({
        stroke: 'SeaGreen',
        strokeWidth: 3,
        fill: 'white',
    })
    container2.attr({
        stroke: 'SeaGreen',
        strokeWidth: 3,
        fill: 'white',
    })
    container3.attr({
        fill: 'white',
    })
    container.attr({
        transform: t(130, 300),
    })

    const cloud = snap.ellipse(400, 150, 150, 120)
    cloud.attr({
        strokeWidth: 3,
        fill: 'lightgray',
        alpha: 0.5,
    })

    container.click(remove)

    const elem1 = new Elem(350, 60, 'Orange')
    const elem2 = new Elem(450, 110, 'Apple')
    const elem3 = new Elem(300, 125, 'Banana')
    const elem4 = new Elem(425, 180, 'Pear')
    const elem5 = new Elem(325, 200, 'Cherry')
}
