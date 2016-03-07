all: clean git-brunch.pdf

clean:
	@git clean -xdf

%.pdf: %.tex $(wildcard sections/*.tex)
	@pdflatex $<
	@pdflatex $<
