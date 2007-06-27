CLEANFILES = *.pdf *.eps *.ps *.png *.jpg software-dependencies.fig software-dependencies.svg

EXTRA_DIST = architecture.fig libgphoto2-api.fig libgphoto2-camlib.fig libgphoto2_port.fig gphotofs.fig software-dependencies.dot

magnification = 1.2

if ENABLE_GRAPHS

graphs = \
	software-dependencies.ps software-dependencies.pdf \
	software-dependencies.png software-dependencies.jpg \
	software-dependencies.svg # software-dependencies.fig

.dot.ps:
	$(DOT) -Tps $< -o $@

.dot.jpg:
	$(DOT) -Tjpeg $< -o $@

.dot.svg:
	$(DOT) -Tsvg $< -o $@

# %.fig: $(srcdir)/%.dot
#	$(DOT) -Tfig $< -o $@

# FIXME: Check for ps2pdf first.
.ps.pdf:
	ps2pdf14 $< $@

.dot.png:
	$(DOT) -Tpng $< -o $@

endif

if ENABLE_FIGURES

figures = \
	architecture.png libgphoto2-api.png libgphoto2-camlib.png libgphoto2_port.png gphotofs.png
#	architecture.eps libgphoto2-api.eps libgphoto2-camlib.eps libgphoto2_port.eps gphotofs.eps

.fig.eps:
	$(FIG2DEV) -L eps $< $@

.fig.tex:
	$(FIG2DEV) -L latex $< $@

.fig.ps:
	$(FIG2DEV) -L ps -z A4 -c $< $@

.fig.pdf:
	$(FIG2DEV) -L pdf -z A4 -p dummy -c $< $@

.fig.png:
	$(FIG2DEV) -L png -m $(magnification) $< $@

.fig.jpg:
	$(FIG2DEV) -L jpeg -m $(magnification) $< $@

endif

figure_DATA = $(figures) $(graphs)
