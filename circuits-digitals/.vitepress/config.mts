import { defineConfig } from 'vitepress'
import { index } from './index'
import { indexEn } from './index'

import { tabsMarkdownPlugin } from 'vitepress-plugin-tabs'

// https://vitepress.dev/reference/site-config

const year = new Date().getFullYear()

export default defineConfig({
    base: '/circuits-digitals/',

    srcDir: 'src',

    locales: {
        root: {
            label: 'Català',
            lang: 'ca-ES',
            title: 'Lliçons circuits digitals',
            link: '/'
        },

        en: {
            label: 'English',
            lang: 'en-US',
            title: 'Digital Circuits Lessons',
            link: '/en/'
        }
    },






    title: 'Lliçons circuits digitals',

    lang: 'ca-ES',

    description: 'Lliçons circuits digitals',

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
                        link: 'https://lliçons.jutge.org/cpp',
                    },
                    {
                        text: 'Terminal',
                        link: 'https://lliçons.jutge.org/terminal',
                    },
                    {
                        text: 'Circuits Digitals',
                        link: 'https://lliçons.jutge.org/circuits-digitals',
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
            '/en/': indexEn,
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

    ignoreDeadLinks: true,

    cleanUrls: false,
})
