CLEANFILES = *.pdf *.eps *.ps *.png *.jpg

EXTRA_DIST = architecture.fig libgphoto2-api.fig libgphoto2-camlib.fig libgphoto2_port.fig gphotofs.fig software-dependencies.dot

magnification = 1.0

if ENABLE_GRAPHS

graphs = \
	software-dependencies.ps software-dependencies.pdf \
	software-dependencies.png software-dependencies.jpg \
	software-dependencies.svg software-dependencies.fig

%.ps: %.dot
	$(DOT) -Tps $< -o $@

%.jpg: %.dot
	$(DOT) -Tjpeg $< -o $@

%.svg: %.dot
	$(DOT) -Tsvg $< -o $@

%.fig: %.dot
	$(DOT) -Tfig $< -o $@

if ENABLE_PSTOIMG

%.png: %.ps
	$(PSTOIMG) -type png -scale $(magnification) -antialias -crop a $<

else

%.png: %.dot
	$(DOT) -Tpng $< -o $@

endif

endif

if ENABLE_FIGURES

figures = \
	architecture.png libgphoto2-api.png libgphoto2-camlib.png libgphoto2_port.png gphotofs.png
#	architecture.eps libgphoto2-api.eps libgphoto2-camlib.eps libgphoto2_port.eps gphotofs.eps

%.eps: %.fig
	$(FIG2DEV) -L eps $< $@

%.tex: %.fig
	$(FIG2DEV) -L latex $< $@

%.ps: %.fig
	$(FIG2DEV) -L ps -z A4 -c $< $@

%.pdf: %.fig
	$(FIG2DEV) -L pdf -z A4 -p dummy -c $< $@

if ENABLE_PSTOIMG
else
%.png: %.fig
	$(FIG2DEV) -L png -m $(magnification) $< $@
endif

%.jpg: %.fig
	$(FIG2DEV) -L jpeg -m $(magnification) $< $@

endif

figure_DATA = $(figures) $(graphs)
