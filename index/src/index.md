---
# https://vitepress.dev/reference/default-theme-home-page
layout: home

hero:
    name: "Lliçons d'Algorísmia i Programació"
    text: lliçons.jutge.org
    tagline: ''
    actions:
        - theme: brand
          text: Lliçons Python
          link: https://python.lliçons.jutge.org
        - theme: brand
          text: Lliçons C++
          link: https://c++.lliçons.jutge.org
---

<img src='./logos/lliçons.png' style='max-width: 12em; margin-bottom: 2em;'/>

<br/>
<h1>Equip</h1>

<VPTeamMembers size="small" :members="members" />

<script setup>
import { VPTeamMembers } from 'vitepress/theme'

const members = [

     {
        avatar: '/public/autors/jpetit.png',
        name: "Jordi Petit",
        title: 'Autor, Editor',
    },
    {
        avatar: '/public/autors/roura.png',
        name: "Salvador Roura",
        title: 'Autor',
    },
    {
        avatar: '/public/autors/jordic.png',
        name: "Jordi Cortadella",
        title: 'Autor',
    },
    {
        avatar: '/public/autors/omer.png',
        name: "Omer Giménez",
        title: 'Autor',
    },
    {
        avatar: '/public/autors/avidal.png',
        name: "Alex Vidal",
        title: 'Autor',
    },
    {
        avatar: '/public/autors/cristina.png',
        name: "Cristina Raluca Vijulie",
        title: 'Autor',
    },
    {
        avatar: '/public/autors/joan.png',
        name: "Joan Alemany",
        title: 'Autor',
    },
    {
        avatar: '/public/autors/adell.png',
        name: "Víctor Adell",
        title: 'Autor',
    },
    {
        avatar: '/public/autors/raul.png',
        name: "Raúl Higueras",
        title: 'Autor',
    },
    {
        avatar: '/public/autors/rafah.png',
        name: "Rafah Hajjar",
        title: 'Autor',
    },
    {
        avatar: '/public/autors/jreig.png',
        name: "Jordi Reig",
        title: 'Autor',
    },
    {
        avatar: '/public/autors/yikai.png',
        name: 'Yikai Qiu',
        title: 'Autor',
    },
    {
        avatar: '/public/autors/marc.png',
        name: "Marc Gállego",
        title: 'Autor',
    },
]
</script>

<style >
.title {
    text-align: center;
}
.affiliation {
    text-align: center;
}
</style>
