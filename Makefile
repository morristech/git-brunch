# Requirements:
# - docutils
# - texlive-latex
# - texlive-latex-recommended

all: clean git-brunch.pdf

clean:
	@git clean -xdf

%.pdf: %.tex $(wildcard sections/*.tex)
	@pdflatex $<
	@pdflatex $<

%.html: %.rst
	@rst2html.py --strict $< $@
