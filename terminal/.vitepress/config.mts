import { defineConfig } from 'vitepress'
import { index } from './index'
import { tabsMarkdownPlugin } from 'vitepress-plugin-tabs'

// https://vitepress.dev/reference/site-config

const year = new Date().getFullYear()

export default defineConfig({

    base: '/terminal/',

    srcDir: 'src',

    title: 'Lliçons Terminal',

    lang: 'ca-ES',

    description: 'Lliçons Terminal',

    themeConfig: {
        // https://vitepress.dev/reference/default-theme-config

        logo: '/logos/lliçons.png',

        nav: [
            {
                text: 'Lliçons',
                items: [
                    {
                        text: 'Lliçons',
                        link: 'https://llicons.potipoti.org',
                    },
                    {
                        text: 'Lliçons Python',
                        link: 'https://llicons.potipoti.org/python',
                    },
                    {
                        text: 'Lliçons C++',
                        link: 'https://llicons.potipoti.org/cpp',
                    },
                    {
                        text: 'Lliçons Terminal',
                        link: '/',
                    },
                ],
            },
        ],

        outline: {
            level: 2,
            label: 'Índex',
        },

        footer: {
            message: 'llicons.potipoti.org',
            copyright: `Copyright © ${year} Universitat Politècnica de Catalunya`,
        },

        sidebar: {
            '/': index,
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
