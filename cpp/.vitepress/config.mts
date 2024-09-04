import { defineConfig } from 'vitepress'
import { index } from './index'
import { tabsMarkdownPlugin } from 'vitepress-plugin-tabs'

// https://vitepress.dev/reference/site-config

const year = new Date().getFullYear()

export default defineConfig({

    base: '/cpp/',

    srcDir: 'src',

    title: 'Lliçons C++',

    lang: 'ca-ES',

    description: 'Lliçons C++',

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
                        text: 'Python',
                        link: 'https://lliçons.jutge.org/python',
                    },
                    {
                        text: 'C++',
                        link: '/',
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
            message: 'lliçons.jutge.org',
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
            prev: 'Lliçó anterior',
            next: 'Lliçó següent',
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

    ignoreDeadLinks: true,      // TODO: Treure
})
