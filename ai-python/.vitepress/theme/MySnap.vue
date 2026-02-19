<template>

    <svg :id='id' :style='`width: 100%; height: ${height}px; background-color: white; border-radius: 8px;`'>
    </svg>


</template>

<script lang='ts' setup>

import { ref, onMounted } from 'vue'
import { useRoute } from 'vitepress'

const props = defineProps({
    src: {
        type: String,
    },
    height: {
        type: Number,
        default: 400,
    },
})

const id = ref("snap_container_" + Math.random().toString(36).substring(8))

onMounted(() => {
    if (!props.src) return
    let path = useRoute().path
    path = path.substring(0, path.lastIndexOf("/"))
    const src = `${path}/${props.src}`
    import(src).then(module => {
        module.main('#' + id.value)
    })
});

</script>