# $Id$

CLEANFILES = *.pdf *.eps *.ps *.png *.jpg

EXTRA_DIST = architecture.fig libgphoto2-api.fig libgphoto2-camlib.fig libgphoto2_port.fig gphotofs.fig

magnification = 1.0

if ENABLE_FIGURES

figure_DATA = \
	architecture.png libgphoto2-api.png libgphoto2-camlib.png libgphoto2_port.png gphotofs.png
#	architecture.eps libgphoto2-api.eps libgphoto2-camlib.eps libgphoto2_port.eps gphotofs.eps

%.eps: %.fig
	fig2dev -L eps $< $@

%.tex: %.fig
	fig2dev -L latex $< $@

%.ps: %.fig
	fig2dev -L ps -z A4 -c $< $@

%.pdf: %.fig
	fig2dev -L pdf -z A4 -p dummy -c $< $@

%.png: %.fig
	fig2dev -L png -m $(magnification) $< $@

%.jpg: %.fig
	fig2dev -L jpeg -m $(magnification) $< $@

endif
