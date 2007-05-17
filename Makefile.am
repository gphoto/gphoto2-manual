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

update-webserver:
	cd src/html && $(MAKE) $@
