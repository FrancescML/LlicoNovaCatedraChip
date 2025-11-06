# Notació asimptòtica

La notació asimptòtica és una eina matemàtica que permet expressar l'eficiència dels algorismes de manera senzilla i clara. Però per un moment, oblidem-nos dels algorismes, i centrem-nos en les matemàtiques. A continuació es presenten les principals notacions asimptòtiques que necessitem i es presenten les seves propietats bàsiques. També s'inclouen exemples d'ús i es donen exemples i intuïcions per entendre-les millor.


## Notació O gran

**Definició:** Donada una funció $g: \mathbb{N} \rightarrow \mathbb{N}$, es defineix la notació O gran com:

$$O(g) = \{ f: \mathbb{N} \rightarrow \mathbb{N} \mid \exists c \in \mathbb{N} \; : \exists n_0 \in \mathbb{N} \; : \forall n \ge n_0 \; : f(n) \le c \cdot g(n) \}$$

Així doncs, $O(g)$ és el conjunt de les funcions que creixen com a màxim tan ràpidament com $g$ per a valors grans de $n$, ignorant constants multiplicatives i termes de menor ordre.

Per exemple, si $f(n) = 3n^2 + 100n + 5$, llavors $f(n) \in O(n^2)$.

**Demostració:** Cal trobar constants $c$ i $n_0$ tals que per a tot $n \ge n_0$, es compleixi que $f(n) \le c \cdot n^2$. En aquest cas, podem triar $c = 4$ i $n_0 = 101$. En efecte, per a $n \ge 101$, tenim que $4n^2\ge 3n^2 + 100n + 5$. <span style="float: right;">▢</span>

### Visualització de O gran

TODO: Fer una gràfica.

### Exemples i intuïcions per a O gran

A continuació es dónen uns exemples de l'ús de la notació O gran:

- $3 n^2 + 5 n - 7 \in O(n^3)$
- $n + 15 \in O(n)$
- $O(n^5) \subseteq O(n^6)$
- $n^3 \notin O(n^2)$
- $n^3 \in O(2^n)$

Intuitivament, podem entendre aquesta notació de la següent manera:

$f(n) \in O(g(n))$ significa que, per a valors grans de $n$, la funció $f(n)$ creix com a màxim, tan ràpidament com $g(n)$, tot ignorant la seva pendent i què passa per a valors petits de $n$.


## Notacions Omega i Theta

Un cop presentada la O gran, introduïm dues notacions complementàries que ens permeten caracteritzar millor el creixement de les funcions.

**Definicions:** Donada una funció $g: \mathbb{N} \rightarrow \mathbb{N}$, es defineixen:

$$\Omega (g) = \{ f: \mathbb{N} \rightarrow \mathbb{N} \mid \exists c \in \mathbb{N} \; : \exists n_0 \in \mathbb{N} \; : \forall n \ge n_0 \; : f(n) \ge c \cdot g(n) \}$$

$$\Theta (g) = \{ f: \mathbb{N} \rightarrow \mathbb{N} \mid \exists c_1, c_2 \in \mathbb{N} \; : \exists n_0 \in \mathbb{N} \; : \forall n \ge n_0 \; : c_1 g(n) \le f(n) \le c_2 g(n) \}$$

Així doncs:

- $\Omega(g)$ és el conjunt de les funcions que creixen com a mínim tan ràpidament com $g$ per a valors grans de $n$, ignorant constants multiplicatives i termes de menor ordre.

- $\Theta(g)$ és el conjunt de les funcions que creixen exactament com $g$ per a valors grans de $n$, ignorant constants multiplicatives i termes de menor ordre.

Seguint amb l'exemple anterior, si $f(n) = 3n^2 + 100n + 5$, es pot comprovar que $f(n) \in \Omega(n^2)$ i, per tant, $f(n) \in \Theta(n^2)$.

### Exemples i intuïcions per a Omega i Theta

Aquests són uns exemples de l'ús de la notació $\Omega$:

- $2^n \in \Omega(n)$
- $n^2 \in \Omega(n)$
- $n \in \Omega(n)$
- $n \notin \Omega(n^2)$
- $\Omega(n^6) \subseteq \Omega(n^5)$

I ara uns exemples de l'ús de la notació $\Theta$:

- $75 n \in \Theta(n)$
- $1023 n^2 \notin \Theta(n)$
- $n^2 \notin \Theta(n)$
- $2^n \notin \Theta(2^{n^2})$
- $\Theta(n) \ne \Theta(n^2)$

Intuitivament, podem entendre aquestes notacions de la següent manera:

- $f(n) \in \Omega(g(n))$ significa que, per a valors grans de $n$, la funció $f(n)$ creix com a mínim, tan ràpidament com $g(n)$, tot ignorant la seva pendent i què passa per a valors petits de $n$.

- $f(n) \in \Theta(g(n))$ significa que, per a valors grans de $n$, la funció $f(n)$ creix igual de ràpidament que $g(n)$, tot ignorant la seva pendent i què passa per a valors petits de $n$.


## Convencions

Malgrat que $O(g)$ és un conjunt de funcions i no una funció en si mateixa, sovint es comet un abús de notació i s'utilitza la notació $f(n) = O(g(n))$ per indicar que $f\in O(g)$. Aquesta és una convenció àmpliament utilitzada en l'anàlisi d'algorismes i facilita la comunicació dels resultats. Per tant, no ens n'estarem d'utilitzar-la. Però sempre cal tenir present que, estrictament parlant, $O(g)$ és un conjunt de funcions i no una funció en si mateixa.

Amb aquest convenció, escriurem expressions com ara
$$3(n− 1)(n + 2) = 3n^2 + 3n− 6 = O(n^2) = O(n^3)$$
que, en realitat, vol dir que
$$3(n− 1)(n + 2) = 3n^2 + 3n− 6 \in O(n^2)\subset O(n^3).$$

Igualment, és habitual estendre la notació a altres dominis diferents de $\mathbb{N}$, com ara $\mathbb{R}^+$, això no comporta cap problema.


## Propietats

Donades dues funcions $f$ i $g$, aquestes propietats relacionen les diferents notacions asimptòtiques:
- $f  = \Omega(g) \Longleftrightarrow g  = O(f)$
- $\Theta(f) = O(f) \cap \Omega(f)$
- $f = \Theta(g) \Longleftrightarrow f = O(g)$ i $f = \Omega(g)$

Donades les funcions $f$, $f_1$, $f_2$, $g$, $g_1$, $g_2$ i $h$, la O gran compleix les propietats següents:

- **Reflexivitat**: $f = O(f)$
- **Transitivitat**: $h = O(g) \wedge g = O(f) \Rightarrow h = O(f)$
- **Caracterització**: $g = O(f) \Longleftrightarrow O(g) \subseteq O(f)$
- **Suma**: $g_1 = O(f_1) \wedge g_2 = O(f_2) \Rightarrow g_1 + g_2 = O(f_1 + f_2) = O(\max(f_1,f_2))$
- **Producte**: $g_1 = O(f_1) \wedge g_2 = O(f_2) \Rightarrow g_1 \cdot g_2 = O(f_1 \cdot f_2)$
- **Invariància multiplicativa**: Per a tota constant $c = \mathbb{R}^+$, $O(f) = O(c \cdot f)$

Per a $\Omega$ es compleixen propietats similars, i en el cas de $\Theta$ es compleixen les següents propietats:

- **Reflexivitat**: $f = \Theta(f)$
- **Transitivitat**: $h = \Theta(g) \wedge g = \Theta(f) \Rightarrow h = \Theta(f)$
- **Simetria**: $g = \Theta(f) \Longleftrightarrow f = \Theta(g) \Longleftrightarrow \Theta(g) = \Theta(f)$
- **Suma**: $g_1 = \Theta(f_1) \wedge g_2 = \Theta(f_2) \Rightarrow g_1 + g_2 = \Theta(f_1 + f_2) = \Theta(\max(f_1,f_2))$
- **Producte**: $g_1 = \Theta(f_1) \wedge g_2 = \Theta(f_2) \Rightarrow g_1 \cdot g_2 = \Theta(f_1 \cdot f_2)$
- **Invariància multiplicativa**: Per a tota constant $c = \mathbb{R}^+$, $\Theta(f) = \Theta(c \cdot f)$


## Més abusos de notació

Seguint amb l'abús de notació esmentat anteriorment, es solen usar directament operacions entre les classes de funcions definides per les notacions asimptòtiques:

Si $\mathcal{F}_1$ i $\mathcal{F}_2$ són classes de funcions (com ara $O(f)$ o $\Omega(f)$):

- $\mathcal{F}_1 + \mathcal{F}_2 = \{ f+g \mid f = \mathcal{F}_1 \wedge g = \mathcal{F}_2 \}$
- $\mathcal{F}_1 \cdot \mathcal{F}_2 = \{ f \cdot g \mid f = \mathcal{F}_1 \wedge g = \mathcal{F}_2 \}$

En aquest context, es compleixen les propietats següents per a dues funcions $f$ i $g$ qualssevol:

- $O(f)+O(g) = O(f+g) = O(\max\{f,g\})$
- $O(f) \cdot O(g) = O(f \cdot g)$
- $\Theta(f)+\Theta(g) = \Theta(f+g) = \Theta(\max\{f,g\})$
- $\Theta(f) \cdot \Theta(g) = \Theta(f \cdot g)$


## Exercicis

Compara asimptòticament les següents parelles de funcions i indica quina creix més ràpidament quan $n$ tendeix a l'infinit:

- $n^{412}$ vs $1.02^n$
- $243 n^2$ vs $n^3$
- $2^n$ vs $3^n$
- $(\log n)^{923}$ vs $n^{0.0001}$
- $n (\ln n)^4$ vs $n^2 \ln n$
- $(\log_2 7)^n$ vs $(\log_4 7)^n$
- $(\ln n)^{7842}$ vs $1.001^n$
- $n\;2^n$ vs $n^3\; 1.5^n$
- $2^{\sqrt{\log n}}$ vs $n$


<Autors autors="jpetit"/>