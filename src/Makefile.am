SUBDIRS = figures screenshots

EXTRA_DIST = gphoto2.xml

CLEANFILES = gphoto2.html

html_DATA = gphoto2.html

if XMLTOHTML

gphoto2.html: gphoto2.xml
	$(XMLTO) html-nochunks gphoto2.xml

endif
