<template>

    <div :id="id" :key="id" :style="`padding-left: 2em; padding-bottom: 2em; background-color: white; border-radius: 8px;`"></div>

</template>

<script lang='ts' setup>

import { ref, onMounted } from 'vue'
import { useRoute } from 'vitepress'

const props = defineProps({
    src: {
        type: String,
    },
})

const id = ref("flowchart_container_" + Math.random().toString(36).substring(7))
console.log(id.value)

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