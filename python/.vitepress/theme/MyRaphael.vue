<template>

    <div :id="id" :height="heigth" :width="width" />

</template>

<script lang='ts' setup>

import { ref, onMounted } from 'vue'
import { useRoute } from 'vitepress'

const props = defineProps({
    src: {
        type: String,
    },
    heigth: {
        type: Number,
        default: 500,
    },
    width: {
        type: Number,
        default: 500,
    },
})

const id = ref("raphael_container_" + Math.random().toString(36).substring(7))

onMounted(() => {
    if (!props.src) return
    let path = useRoute().path
    path = path.substring(0, path.lastIndexOf("/"))
    const src = `${path}/${props.src}`
    import(src).then(module => {
        module.main(id.value)
    })
});

</script>