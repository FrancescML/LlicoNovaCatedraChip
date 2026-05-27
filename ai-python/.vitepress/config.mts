import { defineConfig } from 'vitepress'
import { index } from './index'
import { tabsMarkdownPlugin } from 'vitepress-plugin-tabs'

// https://vitepress.dev/reference/site-config

const year = new Date().getFullYear()

export default defineConfig({
    base: '/ai-python/',

    srcDir: 'src',

    title: 'Python for AI',

    lang: 'en-US',

    description: 'Python for AI',

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
                        text: 'Python for AI',
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
