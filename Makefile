all: clean git-brunch

git-brunch: git-brunch.pdf git-brunch_tldr.pdf

clean:
	@git clean -xdf

# PDF document with all the transitioning effects' magic <@;-)
%.pdf: %.tex
	@pdflatex $<
	@pdflatex $<

# PDF document without transition effects
%_tldr.pdf: %.tex
	@sed -e '/.*pause/d' -e 's/\[<+->\]//g' $< > $*_tldr.tex
	@pdflatex $*_tldr.tex
	@pdflatex $*_tldr.tex
	@rm $*_tldr.tex
