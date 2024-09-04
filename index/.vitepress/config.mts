import { defineConfig } from 'vitepress'
import { tabsMarkdownPlugin } from 'vitepress-plugin-tabs'

// https://vitepress.dev/reference/site-config

const year = new Date().getFullYear()

export default defineConfig({
    srcDir: 'src',

    title: 'Lliçons',

    lang: 'ca-ES',

    description: "Lliçons d'Algorísmia i Programació",

    themeConfig: {
        // https://vitepress.dev/reference/default-theme-config

        nav: [
            {
                text: 'Lliçons',
                items: [
                    {
                        text: 'Inici',
                        link: '/',
                    },
                    {
                        text: 'Python',
                        link: 'https://lliçons.jutge.org/python',
                    },
                    {
                        text: 'C++',
                        link: 'https://lliçons.jutge.org/cpp',
                    },
                    {
                        text: 'Terminal',
                        link: 'https://lliçons.jutge.org/terminal',
                    },
                ],
            },
        ],

        outline: {
            level: 2,
            label: 'Índex',
        },

        footer: {
            message: 'https://lliçons.jutge.org',
            copyright: `Copyright © ${year} Universitat Politècnica de Catalunya`,
        },

        sidebar: {},

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
    },

    markdown: {
        math: true,

        config(md) {
            md.use(tabsMarkdownPlugin)
        },
    },
})
