if HAVE_SCROLLKEEPER
scrollkeeper_subdirs = help
endif

# we have our own macros in m4/, so do not remove it, OK?
#SUBDIRS = src m4 $(scrollkeeper_subdirs)
SUBDIRS = src m4m help

ACLOCAL_AMFLAGS = -I m4m

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
