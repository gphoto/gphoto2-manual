SUBDIRS = src

ACLOCAL_AMFLAGS = -I m4
AUTOMAKE_OPTIONS = gnu

if MAINTAINER_MODE

CVS_ENTRIES := $(shell find . -type d -name CVS | while read dir; do echo "$${dir}/Entries"; done)

ChangeLog: $(CVS_ENTRIES)
	cvs2cl --utc

endif
