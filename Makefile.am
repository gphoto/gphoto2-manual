SUBDIRS = src

ACLOCAL_AMFLAGS = -I m4
AUTOMAKE_OPTIONS = gnu

if MAINTAINER_MODE

CVS_ENTRIES := $(shell find $(top_srcdir) -type d -name CVS | while read dir; do echo "$${dir}/Entries"; done)

ChangeLog: $(CVS_ENTRIES)
	cd $(top_srcdir) && cvs2cl --utc

endif
