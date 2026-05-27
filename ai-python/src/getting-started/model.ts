import Snap from 'snapsvg-cjs'

export function main(id: string) {
    const snap = Snap(id)

    const t = (x: number, y: number) => `t${x},${y}`

    class Box {
        xc: number
        yc: number
        width: number
        height: number
        label: string
        attrs: { [key: string]: any }
        elem: Snap.Element

        constructor(xc: number, yc: number, width: number, height: number, label: string, attrs: { [key: string]: any }) {
            this.xc = xc
            this.yc = yc
            this.width = width
            this.height = height
            this.label = label
            this.attrs = attrs

            const rect = snap.rect(0, 0, this.width, this.height, 5, 5)
            rect.attr(this.attrs)

            const text = snap.text(0, 0, this.label)
            const textWidth = text.node.getBoundingClientRect().width
            const textHeight = text.node.getBoundingClientRect().height
            const tx = (this.width - textWidth) / 2
            const ty = (this.height + textHeight) / 2 - 4
            text.attr({
                transform: t(tx, ty),
            })

            this.elem = snap.group(rect, text)
            this.elem.attr({
                transform: t(this.xc, this.yc),
            })
        }
    }

    const elem0 = snap.rect(120, 10, 360, 270, 5, 5)
    elem0.attr({
        stroke: 'Maroon',
        strokeWidth: 3,
        fill: 'Linen',
    })

    const attr = {
        stroke: 'IndianRed',
        strokeWidth: 3,
        fill: 'PeachPuff',
    }

    const elem1 = new Box(200, 30, 200, 40, 'Memòria', attr)
    const elem2 = new Box(200, 90, 200, 40, 'Unitat de càlcul', attr)
    const elem3 = new Box(200, 150, 200, 40, 'Unitat de control', attr)
    const elem4 = new Box(80, 210, 200, 40, "Dispositiu d'entrada", attr)
    const elem5 = new Box(320, 210, 200, 40, 'Dispositiu de sortida', attr)

    const attr2 = {
        strokeWidth: 0,
        fill: 'White',
    }

    const caption = new Box(120, 300, 360, 40, 'Elements del model abstracte de computador', attr2)

    const fig = snap.group(elem0, elem1.elem, elem2.elem, elem3.elem, elem4.elem, elem5.elem, caption.elem)
}
