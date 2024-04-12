<template>

    <div>
        <div v-for="item of index_python">
            <h3>{{ item.text }}</h3>
            <ul>
                <div v-for="subitem of item.items">
                    <li>
                        <a :href="subitem.link">
                            <div v-html="subitem.text"></div>
                        </a>
                    </li>
                </div>
            </ul>
        </div>
    </div>

</template>

<script lang='ts' setup>

import { index_python } from '../python'
import { ref, onMounted } from 'vue'

</script>

<style scoped>
a:link {
    text-decoration: none;
}

a:hover {
    text-decoration: underline;
}
</style>