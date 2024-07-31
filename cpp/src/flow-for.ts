import flowchart from 'flowchart.js'

const code = `
st=>start: Inici bucle
e=>end: Final bucle
init=>operation: ⟨inicialització⟩
cond=>condition: ⟨condició⟩ ?|COND
inst=>operation: ⟨instruccions⟩
incr=>operation: ⟨increment⟩

st->init->cond
cond(no)->e
cond(yes, right)->inst(right)->incr(right)->cond
`

export function main(id: string) {
    flowchart.parse(code).drawSVG(id, {
        "scale": 0.9,
        "line-width": 3,
        "fill": "PeachPuff",
        "element-color": "IndianRed",
        "flowstate": {
            "COND": {
                "yes-text": "Sí",
                "no-text": "No"
            }
        },
        "symbols": {
            "start": {
                "fill": "white"
            },
            "end": {
                "fill": "white"
            }
        }
    })
}