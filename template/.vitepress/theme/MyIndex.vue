<template>
    <div>
        <div v-for="item of index">
            <h3>{{ item.text }}</h3>
            <ul>
                <div v-for="subitem of item.items">
                    <li>
                        <a :href="'/template' + subitem.link">
                            <div v-html="subitem.text"></div>
                        </a>
                    </li>
                </div>
            </ul>
        </div>
    </div>
</template>

<script lang="ts" setup>
import { index } from '../index'
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
