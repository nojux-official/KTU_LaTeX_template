## LaTEX preparation

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

## fonts installation

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


## clean build
<code>

    latexmk -c "0. Ataskaita.tex"
    latexmk -c focus.tex
</code>

## BUILD

<code>
    cd document
    latexmk -lualatex -interaction=nonstopmode -f 0.\ Ataskaita.tex

</code>

## for EPUB export

<code>

    tlmgr install tex4ebook
    tlmgr install luaxml
    tlmgr install luatexbase
    tlmgr install luacode
    apt install tidy
    apt install zip
    touch binhec.tex

    tex4ebook -l -f epub "0. Ataskaita.tex"
</code>



## Miscellaneous

<code>

    eval $(ssh-agent)
    ssh-add ~/.ssh/id_rsa
    git push
</code>
