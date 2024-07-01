import type { Theme } from 'vitepress'
import DefaultTheme from 'vitepress/theme'
import { enhanceAppWithTabs } from 'vitepress-plugin-tabs/client'

import MyIndex from './MyIndex.vue'
import Autors from './Autors.vue'
import Asciinema from './Asciinema.vue'

import './custom.css'

export default {
    extends: DefaultTheme,
    enhanceApp({ app }) {
        enhanceAppWithTabs(app)
        app.component('MyIndex', MyIndex)
        app.component('Autors', Autors)
        app.component('Asciinema', Asciinema)
    },
} satisfies Theme
