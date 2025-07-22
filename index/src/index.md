---
# https://vitepress.dev/reference/default-theme-home-page
layout: home

hero:
    name: "Lliçons d'Algorísmia i Programació"
    text: lliçons.jutge.org
    tagline: ''
    actions:
        - theme: brand
          text: Python
          link: https://lliçons.jutge.org/python
        - theme: brand
          text: C++
          link: https://lliçons.jutge.org/cpp
        - theme: brand
          text: Terminal
          link: https://lliçons.jutge.org/terminal
        - theme: brand
          text: El.Digital
          link: https://lliçons.jutge.org/electronica-digital
---

<img src='./logos/lliçons.png' style='max-width: 12em; margin-bottom: 2em;'/>

<br/>
<h1>Equip</h1>

<VPTeamMembers size="small" :members="members" />

<script setup>
import { VPTeamMembers } from 'vitepress/theme'

const members = [

     {
        avatar: '/autors/jpetit.png',
        name: "Jordi Petit",
        title: 'Autor, Editor',
    },
    {
        avatar: '/autors/roura.png',
        name: "Salvador Roura",
        title: 'Autor',
    },
    {
        avatar: '/autors/jordic.png',
        name: "Jordi Cortadella",
        title: 'Autor',
    },
    {
        avatar: '/autors/omer.png',
        name: "Omer Giménez",
        title: 'Autor',
    },
    {
        avatar: '/autors/avidal.png',
        name: "Alex Vidal",
        title: 'Autor',
    },
    {
        avatar: '/autors/cristina.png',
        name: "Cristina Raluca Vijulie",
        title: 'Autor',
    },
    {
        avatar: '/autors/joan.png',
        name: "Joan Alemany",
        title: 'Autor',
    },
    {
        avatar: '/autors/adell.png',
        name: "Víctor Adell",
        title: 'Autor',
    },
    {
        avatar: '/autors/raul.png',
        name: "Raúl Higueras",
        title: 'Autor',
    },
    {
        avatar: '/autors/rafah.png',
        name: "Rafah Hajjar",
        title: 'Autor',
    },
    {
        avatar: '/autors/jreig.png',
        name: "Jordi Reig",
        title: 'Autor',
    },
    {
        avatar: '/autors/yikai.png',
        name: 'Yikai Qiu',
        title: 'Autor',
    },
    {
        avatar: '/autors/marc.png',
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
<br/>

# Informació

L’objectiu de **Lliçons** és posar a l’abast de tothom diverses lliçons, tutorials, exemples i referències sobre diversos temes de programació i algorísmia. Aquests documents han estat creats per professors de la UPC en col·laboració amb altres experts informàtics. Encara que alguns d’aquests materials han estat escrits per a un o més cursos de diverses facultats de la UPC, els autors considerem que tots són d’interès general.

Cadascun dels punts següents consisteix en una pàgina web amb text, animacions, programes, exercicis, … que explica un tema concret, de manera força autocontinguda.

Tot aquest recull es troba en constant creixement i modificació, i avança a un ritme molt variable.
