import type { Theme } from 'vitepress'
import DefaultTheme from 'vitepress/theme'
import { enhanceAppWithTabs } from 'vitepress-plugin-tabs/client'

import MyIndex from './MyIndex.vue'
import Autors from './Autors.vue'
import PyWeb from './PyWeb.vue'
import MyRaphael from './MyRaphael.vue'
import MyFlowChart from './MyFlowChart.vue'
import Asciinema from './Asciinema.vue'
import MySnap from './MySnap.vue'

import './custom.css'

export default {
    extends: DefaultTheme,
    enhanceApp({ app }) {
        enhanceAppWithTabs(app)
        app.component('Autors', Autors)
        app.component('MyIndex', MyIndex)
        app.component('PyWeb', PyWeb)
        app.component('MyRaphael', MyRaphael)
        app.component('MySnap', MySnap)
        app.component('Asciinema', Asciinema)
        app.component('MyFlowChart', MyFlowChart)
    },
} satisfies Theme
