# KTU Latex šablonas

## Naudojimas

1. Atsidaryti šią repozitoriją per VSCode.
2. Susinstalliuoti Devcontainer įskiepį ir Docker variklį.
3. Ctrl+Shift+P -> Remote-Containers: Reopen in Container.
4. Atidaryti terminalą ir suinstaliuoti LaTeX paketus (žr. žemiau)
5. Suinstaliuoti šriftus, jei reikia (žr. žemiau).
6. Redaguoti tex failus pagal poreikį.
7. Sukompiliuoti dokumentą `latexmk -lualatex -interaction=nonstopmode -f 0.\ Ataskaita.tex` komanda iš dokumento katalogo.

Demo: [PDF dokumento pavyzdys](https://github.com/nojux-official/KTU_LaTeX_template/blob/main/document/0.%20Ataskaita.pdf)

## Privalumai


 * Sugeneruotas dokumentas atitinka KTU reikalavimus keliamus bakalauro baigiamajam darbui.
 * Automatiškai numeruojamos lentelės, paveikslai ir priedai.
 * Automatiškai pritaikomi šriftų dydžiai ir kiti formatavimo reikalavimai.
 * Dokumento turinys gali būti keičiamas naudojant programavimo aplinkos įrankius.
 * Galimybė lengvai integruoti kitus LaTeX paketus.
 * Bibliografijos tvarkymas su biblatex (galima eksportuoti iš Zotero, Refworks, Mendeley ir kitų bibliografijos tvarkymo programų).
 * Galimybė eksportuoti dokumentą į kitus formatus, tokius kaip EPUB, naudojant tex4ebook įrankį.
\end{itemize}

## LaTEX paruošimas

<code>

    tlmgr option repository https://mirrors.rit.edu/CTAN/systems/texlive/tlnet
    tlmgr install fontspec
    tlmgr install newunicodechar
    tlmgr install csquotes
    tlmgr install caption
    tlmgr install subcaption
    tlmgr install listings
    tlmgr install xcolor
    tlmgr install babel
    tlmgr installamsmath
    tlmgr install amsmath
    tlmgr install booktabs
    tlmgr install graphicx
    tlmgr install xcolor
    tlmgr install hyperref
    tlmgr install lastpage
    tlmgr install biblatex
    tlmgr install biber
    tlmgr install bibtex
    tlmgr install babel-lithuanian
    tlmgr install biblatex-iso690
    tlmgr install tocloft
</code>

## Šriftų įdiegimas

Export from other machine:
<code>

    export fonts # fc-list | grep Times | grep ".ttf" | cut -d: -f1 | sort -u | xargs -I{} cp "{}" ~/Downloads/times_fonts/
</code>


Install fonts:
<code>
    mkdir -p ~/.local/share/fonts/
    cp times_fonts/*.ttf ~/.local/share/fonts/
    apt update
    apt install fontconfig
    fc-cache -f -v
</code>


## Laikinųjų failų ištrynimas
<code>

    latexmk -c "0. Ataskaita.tex"
    latexmk -c focus.tex
</code>

## Dokumento kompiliavimas

<code>

    cd document
    latexmk -lualatex -interaction=nonstopmode -f 0.\ Ataskaita.tex

</code>

## EPUB eksportas

Latex leidžia eksportuoti dokumentą į EPUB ir kitus formatą naudojant tex4ebook įrankį. Tačiau negalima naudoti tokių komandų kaip `\code` ir `\begin{inline_code}` nes jos nėra palaikomos. 
Reikalingos tokios bibliotekos:
<code>

    cd document
    tlmgr install tex4ebook
    tlmgr install luaxml
    tlmgr install luatexbase
    tlmgr install luacode
    apt install tidy
    apt install zip
    touch binhec.tex

    tex4ebook -l -f epub "0. Ataskaita.tex"
</code>


