
if HAVE_SCROLLKEEPER
scrollkeeper_subdirs = help
endif

SUBDIRS = src $(scrollkeeper_subdirs)

ACLOCAL_AMFLAGS = -I m4
AUTOMAKE_OPTIONS = gnu

EXTRA_DIST = xmldocs.make

if MAINTAINER_MODE

CVS_ENTRIES := $(shell find $(top_srcdir) -type d -name CVS | while read dir; do echo "$${dir}/Entries"; done)

ChangeLog: $(CVS_ENTRIES)
	cd $(top_srcdir) && cvs2cl --utc

endif
