# A quick start guide for the `minted` package

## Disclaimer

This is not an official guide for the `minted` package. I strongly urge all readers to refer to the [official documentation](http://tug.ctan.org/macros/latex/contrib/minted/minted.pdf) for proper setup and use of this package. This guide may serve as a quick reference for setting up your development environment for first-time use.

## What to install

On your system you will need:

- The `minted` LaTeX package (comes with a standard TeX installation)
- Python (version 2.6 or later)
- Pygments Python package (version 1.4 or later)

## How to use

Add

```tex
\usepackage{minted}
```

to your preamble. To include a code listing, use the syntax

```tex
\begin{minted}{<language>}
...(code goes here)...
\end{minted}
```

For example,

```tex
\begin{minted}{python}
a,b = 0,1
if a < b:
	print("a is less than b")
else:
	print("a is not less than b")
\end{minted}
```

## Build commands

### Shell escape

When you compile your LaTeX document, the `minted` package will run Python code in the background using the Pygments package to create the syntax-highlighted code that will be included in your output file. In order to do this, the option `-shell-escape` must be included in your build command. For example,

```bash
pdflatex -shell-escape filename.tex
```

### Output directory
It is common to use the `-output-directory` option in a build command, e.g.

```bash
pdflatex -output-directory=build filename.tex
```

If you include this option in your build command, then you need to tell the `minted` package where your output directory is when you load the package:

```tex
\usepackage[outputdir=build]{minted}
```