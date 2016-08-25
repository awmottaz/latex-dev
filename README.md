# latex-dev
A repository of LaTeX development

## Homework Document Class (v0.01)
The Homework document class, `mathhw.cls`, is designed with the graduate student in mind. LaTeX has a sharp learning curve, and although I believe any serious mathematicians today must develop a working knowledge of LaTeX, I also believe it should be easy for someone to get up and running creating beautifully typeset homework. 

This document class provides a comprehensive collection of mathematics packages and macros. It also applies the best practices regarding typography (see [here](http://tex.stackexchange.com/questions/71172/why-are-default-latex-margins-so-big) for some discussion on the matter). There are many other features, tweaks, and design choices contained within to help make this document class as useful and user-friendly as possible. Read below for detailed information.

### Installation

#### MiKTeX
Copy `mathhw.cls` to your local `texmf` directory and run "Refresh FNDB" in MiKTeX. For more detailed instructions, look [here](http://tex.stackexchange.com/questions/2063/how-can-i-manually-install-a-package-on-miktex-windows).

#### TeX Live
Copy `mathhw.cls` to your local `texmf` directory and run the following command in your command prompt/terminal as the super user:

    texhash

For more detailed instructions, look [here](http://tex.stackexchange.com/questions/96976/install-custom-cls-using-tex-live-in-local-directory).

### Packages
The following is a list if packages included in `mathhw.cls`.

- [`layout`](http://www.ctan.org/pkg/layout)
- [`geometry`](http://www.ctan.org/pkg/geometry)
- [`lmodern`](https://www.ctan.org/pkg/lm?lang=en)
- [`fontenc`](http://www.ctan.org/pkg/fontenc) (loaded with the *T1* option)
- [`inputenc`](http://www.ctan.org/pkg/inputenc) (loaded with the *utf8* option)
- [`mathtools`](http://www.ctan.org/pkg/mathtools)
- [`amsthm`](http://www.ctan.org/pkg/amsthm)
- [`amssymb`](https://www.ctan.org/pkg/amsfonts?lang=en)
- [`dsfont`](https://www.ctan.org/tex-archive/fonts/doublestroke?lang=en)
- [`mathrsfs`](http://www.ctan.org/pkg/mathrsfs)
- [`cancel`](http://www.ctan.org/pkg/cancel)
- [`enumitem`](http://www.ctan.org/pkg/enumitem) (loaded with the *shortlabels* option)
- [`array`](http://www.ctan.org/pkg/array)
- [`arydshln`](http://www.ctan.org/pkg/arydshln)
- [`relsize`](http://www.ctan.org/pkg/relsize)
- [`xcolor`](http://www.ctan.org/pkg/xcolor) (loaded with the *dvipsnames* option)
- [`tikz`](http://www.texample.net/tikz/)
- [`pgfplots`](https://www.ctan.org/pkg/pgfplots?lang=en)
- [`needspace`](http://www.ctan.org/pkg/needspace)
- [`todonotes`](http://www.ctan.org/pkg/todonotes)
- [`fancyhdr`](http://www.ctan.org/pkg/fancyhdr)
- [`parskip`](http://www.ctan.org/pkg/parskip) (loaded with the *parfill* option)
- [`hyperref`](http://www.ctan.org/pkg/hyperref)
- [`cleveref`](http://www.ctan.org/pkg/cleveref)
- [`framed`](http://www.ctan.org/pkg/framed)
- [`wasysym`](http://www.ctan.org/pkg/wasysym)
- [`lipsum`](http://www.ctan.org/pkg/lipsum)
- [`alphalph`](http://www.ctan.org/pkg/alphalph)
- [`pdfpages`](http://www.ctan.org/pkg/pdfpages)
- [`float`](http://www.ctan.org/pkg/float)
- [`tabularx`](http://www.ctan.org/pkg/tabularx)
- [`textgreek`](http://www.ctan.org/pkg/textgreek)
- [`upgreek`](http://www.ctan.org/pkg/upgreek)
- [`signchart`](http://www.ctan.org/pkg/signchart)
- [`microtype`](http://www.ctan.org/pkg/microtype)
- [`multicol`](http://www.ctan.org/pkg/multicol)
- [`tikz-cd`](http://www.ctan.org/pkg/tikz-cd)
