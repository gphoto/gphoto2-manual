CLEANFILES = *.pdf *.eps *.ps *.png *.jpg software-dependencies.fig software-dependencies.svg

EXTRA_DIST = architecture.fig libgphoto2-api.fig libgphoto2-camlib.fig libgphoto2_port.fig gphotofs.fig software-dependencies.dot

magnification = 1.2

if ENABLE_GRAPHS

graphs = \
	software-dependencies.ps software-dependencies.pdf \
	software-dependencies.png software-dependencies.jpg \
	software-dependencies.svg software-dependencies.fig

%.ps: $(srcdir)/%.dot
	$(DOT) -Tps $< -o $@

%.jpg: $(srcdir)/%.dot
	$(DOT) -Tjpeg $< -o $@

%.svg: $(srcdir)/%.dot
	$(DOT) -Tsvg $< -o $@

%.fig: $(srcdir)/%.dot
	$(DOT) -Tfig $< -o $@

# FIXME: Check for ps2pdf first.
%.pdf: %.ps
	ps2pdf14 $< $@

if ENABLE_PSTOIMG

%.png: $(srcdir)/%.ps
	$(PSTOIMG) -type png -scale $(magnification) -antialias -crop a $<

else

%.png: $(srcdir)/%.dot
	$(DOT) -Tpng $< -o $@

endif

endif

if ENABLE_FIGURES

figures = \
	architecture.png libgphoto2-api.png libgphoto2-camlib.png libgphoto2_port.png gphotofs.png
#	architecture.eps libgphoto2-api.eps libgphoto2-camlib.eps libgphoto2_port.eps gphotofs.eps

%.eps: $(srcdir)/%.fig
	$(FIG2DEV) -L eps $< $@

%.tex: $(srcdir)/%.fig
	$(FIG2DEV) -L latex $< $@

%.ps: $(srcdir)/%.fig
	$(FIG2DEV) -L ps -z A4 -c $< $@

%.pdf: $(srcdir)/%.fig
	$(FIG2DEV) -L pdf -z A4 -p dummy -c $< $@

%.png: $(srcdir)/%.fig
	$(FIG2DEV) -L png -m $(magnification) $< $@

%.jpg: $(srcdir)/%.fig
	$(FIG2DEV) -L jpeg -m $(magnification) $< $@

endif

figure_DATA = $(figures) $(graphs)
