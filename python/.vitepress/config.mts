import { defineConfig } from 'vitepress'
import { index_python } from './python'
import { tabsMarkdownPlugin } from 'vitepress-plugin-tabs'

// https://vitepress.dev/reference/site-config

const year = new Date().getFullYear()

export default defineConfig({
    srcDir: 'src',

    title: 'Lliçons Python',

    lang: 'ca-ES',

    description: 'Lliçons Python',

    themeConfig: {
        // https://vitepress.dev/reference/default-theme-config

        logo: '/logos/lliçons.png',

        nav: [
            {
                text: 'Lliçons',
                items: [
                    {
                        text: 'Lliçons',
                        link: 'https://lliçons.jutge.org',
                    },
                    {
                        text: 'Lliçons Python',
                        link: '/',
                    },
                    {
                        text: 'Lliçons C++',
                        link: 'https://c++.lliçons.jutge.org',
                    },
                ],
            },
        ],

        outline: {
            level: 2,
            label: 'Índex',
        },

        footer: {
            message: 'python.lliçons.jutge.org',
            copyright: `Copyright © ${year} Universitat Politècnica de Catalunya`,
        },

        sidebar: {
            '/': index_python,
        },

        socialLinks: [
            {
                icon: 'github',
                link: 'https://github.com/jutge-org/llicons',
            },
        ],

        docFooter: {
            prev: 'Pàgina anterior',
            next: 'Pàgina següent',
        },

        lightModeSwitchTitle: 'Mode clar',
        darkModeSwitchTitle: 'Mode fosc',
        darkModeSwitchLabel: 'Commuta mode fosc o clar',
        returnToTopLabel: 'Torna al principi',

        search: {
            provider: 'local',
        },
    },

    markdown: {
        math: true,

        config(md) {
            md.use(tabsMarkdownPlugin)
        },
    },
})
