<template>
    <div class="" style="border: 1px solid var(--vp-c-divider); padding: 1em 1em 0em 1em; border-radius: 8px; margin-top: 3em; margin-bottom: -2.5em; text-align: right;">
        <div v-for="autor of autors.split(' ').reverse()">
            <img :src="`/python/autors/${autor}.png`" style="margin-left: 1em; height: 4.5em; float: right;">
        </div>

        <div style="clear: right;"></div>

        <p style="margin-top: 1em; text-align: right;">
            <b>{{ autors.split(' ').map(id => info[id].name).join(', ') }}</b>
            <br />
            Lliçons.jutge.org
            <br />
            © Universitat Politècnica de Catalunya, {{ new Date().getFullYear() }}
        </p>
    </div>
</template>

<script lang='ts' setup>

import { ref, onMounted } from 'vue'


const info = {
    jpetit: {
        name: "Jordi Petit",
        org: "UPC",
    },
    roura: {
        name: "Salvador Roura",
        org: "UPC",
    },
    avidal: {
        name: "Alex Vidal",
        org: "UPC",
    },
    omer: {
        name: "Omer Giménez",
        org: "Google",
    },
    rubio: {
        name: "Albert Rubio",
        org: "exUPC",
    },
    jordic: {
        name: "Jordi Cortadella",
        org: "UPC",
    },
    cristina: {
        name: "Cristina Raluca Vijulie",
        org: "exUPC",
    },
    joan: {
        name: "Joan Alemany",
        org: "Aula",
    },
    adell: {
        name: "Víctor Adell",
        org: "UPC",
    },
    raul: {
        name: "Raúl Higueras",
        org: "UPC",
    },
    rafah: {
        name: "Rafah Hajjar",
        org: "UPC",
    },
    jreig: {
        name: "Jordi Reig",
        org: "UPC",
    },
    yikai: {
        name: 'Yikai Qiu',
        org: "UPC",
    },
    marc: {
        name: "Marc Gállego",
        org: "UPC",
    },
}

const props = defineProps({
    autors: {
        type: String,
        default: '',
    }
})

</script>