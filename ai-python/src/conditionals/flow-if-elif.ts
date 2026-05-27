import flowchart from 'flowchart.js'

const code = `
st=>start: Inici condicional
e=>end: Final condicional
cond1=>condition: ⟨Condició_1⟩ ?|COND
cond2=>condition: ⟨Condició_2⟩ ?|COND
cond3=>condition: ⟨Condició_3⟩ ?|COND
opsi1=>operation: ⟨Instruccions_1⟩
opsi2=>operation: ⟨Instruccions_2⟩
opsi3=>operation: ⟨Instruccions_3⟩
opno=>operation: ⟨Instruccions_SINÓ⟩

st->cond1
cond1(yes, right)->opsi1->e
cond1(no)->cond2
cond2(yes, right)->opsi2->e
cond2(no)->cond3->e
cond3(yes, right)->opsi3->e
cond3(no)->opno->e
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
