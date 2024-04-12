import flowchart from 'flowchart.js'

const code = `
st=>start: Inici condicional
e=>end: Final condicional
cond=>condition: ⟨Condició⟩ ?|COND
opsi=>operation: ⟨Instruccions_SÍ⟩
opno=>operation: ⟨Instruccions_NO⟩

st->cond
cond(no)->e
cond(yes)->opsi->e
cond(no, right)->opno->e
`

export function main(id: string) {
    flowchart.parse(code).drawSVG(id, {
        scale: 0.9,
        'line-width': 3,
        fill: 'PeachPuff',
        'element-color': 'IndianRed',
        flowstate: {
            COND: {
                'yes-text': 'Sí',
                'no-text': 'No',
            },
        },
        symbols: {
            start: {
                fill: 'white',
            },
            end: {
                fill: 'white',
            },
        },
    })
}
