SUBDIRS = src gphoto-m4

# Skip the help subdir until we have replaced ancient system
# scrollkeeper with something more current (rarian/yelp?)

# SUBDIRS += help

ACLOCAL_AMFLAGS = -I m4 -I gphoto-m4

EXTRA_DIST = xmldocs.make

.PHONY: update-webserver

CLEANFILES = \
	./tesseract.png	\
	./tesseract.ps	\
	./html2text-test.txt	\
	./html2text-test.xxxhtml

pkgconfigdir = $(datadir)/pkgconfig
pkgconfig_DATA = gphoto2-manual.pc
EXTRA_DIST    += gphoto2-manual.pc.in

noinst_DATA = gphoto2-manual-uninstalled.pc
EXTRA_DIST += gphoto2-manual-uninstalled.pc.in

update-webserver:
	cd src/html && $(MAKE) $@
