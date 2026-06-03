<template>
    <div>
        <div v-for="item in data" :key="item.text">
            <h3>{{ item.text }}</h3>

            <ul>
                <li v-for="subitem in item.items" :key="subitem.link">
                    <a :href="site.base + subitem.link">
                        <div v-html="subitem.text"></div>
                    </a>
                </li>
            </ul>

        </div>
    </div>
</template>

<script setup lang="ts">
import { computed } from 'vue'
import { useData } from 'vitepress'

import { index } from '../index'
import { indexEn } from '../index'
import { indexEs } from '../index'


const { localeIndex, site } = useData()

const data = computed(() => ({
    en: indexEn,
    es: indexEs
}[localeIndex.value] || index))

</script>

<style scoped>
a:link {
    text-decoration: none;
}

a:hover {
    text-decoration: underline;
}
</style>
