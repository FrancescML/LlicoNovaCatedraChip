<template>
    <iframe :src="`https://pyweb.jutge.org/?ht&code=${code_b64}&sol=${sol_b64}`" width="100%" :height="height" frameborder="0" marginwidth="0" marginheight="0" allowfullscreen style="border: 1px solid #e8eaec; border-radius: 8px;  margin: 2ex 0;"></iframe>
</template>

<script lang='ts' setup>

import { ref, onMounted } from 'vue'


const props = defineProps({
    code: {
        type: String,
        default: '',
    },
    sol: {
        type: String,
        default: '',
    },
    height: {
        type: Number,
        default: 400,
    },
})

const code_b64 = ref(btoa(props.code))
const sol_b64 = ref(btoa(props.sol))

// nota: per alguna raó, al client, no es poden deixar línies en blanc, cal posar \n

</script>