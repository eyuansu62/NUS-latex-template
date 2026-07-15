TEX_DEP_FILES = iftex.sty etoolbox.sty microtype.sty geometry.sty xcolor.sty \
	graphicx.sty tikz.sty eso-pic.sty fancyhdr.sty titlesec.sty authblk.sty \
	caption.sty subcaption.sty booktabs.sty array.sty tabularx.sty multirow.sty \
	enumitem.sty tcolorbox.sty listings.sty xurl.sty natbib.sty hyperref.sty \
	cleveref.sty XCharter.sty newtxmath.sty zi4.sty

.PHONY: all preview check-deps clean distclean

all:
	latexmk -pdf main.tex

preview: all
	mkdir -p build/preview
	pdftoppm -png -singlefile -f 1 -l 1 -r 144 build/main.pdf build/preview/page1

check-deps:
	@missing=0; \
	for f in $(TEX_DEP_FILES); do \
		if ! kpsewhich $$f >/dev/null; then \
			echo "missing $$f"; \
			missing=1; \
		fi; \
	done; \
	if [ $$missing -eq 0 ]; then \
		echo "All required LaTeX packages found."; \
	else \
		echo "Install missing packages with tlmgr; see README.md."; \
		exit $$missing; \
	fi

clean:
	latexmk -c main.tex

# Remove build products completely.
distclean:
	latexmk -C main.tex
	rm -rf build
