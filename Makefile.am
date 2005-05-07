
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
	./tesseract.ps	\
	./html2text-test.txt	\
	./html2text-test.xxxhtml

CVS_ENTRIES := $(shell find $(top_srcdir) -type d -name CVS | while read dir; do echo "$${dir}/Entries"; done)

ChangeLog: $(CVS_ENTRIES)
	cd $(top_srcdir) && cvs2cl --utc

update-webserver:
	cd src/html && $(MAKE) $@
