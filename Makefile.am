
if HAVE_SCROLLKEEPER
scrollkeeper_subdirs = help
endif

# we have our own macros in m4/, so do not remove it, OK?
#SUBDIRS = src m4 $(scrollkeeper_subdirs)
SUBDIRS = src m4

ACLOCAL_AMFLAGS = -I m4
AUTOMAKE_OPTIONS = gnu

EXTRA_DIST = xmldocs.make

if MAINTAINER_MODE

CVS_ENTRIES := $(shell find $(top_srcdir) -type d -name CVS | while read dir; do echo "$${dir}/Entries"; done)

ChangeLog: $(CVS_ENTRIES)
	cd $(top_srcdir) && cvs2cl --utc

endif
