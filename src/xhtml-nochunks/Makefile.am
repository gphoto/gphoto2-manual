if XMLTOHTML

CLEANFILES = gphoto2.html

xhtmlnochunks_DATA = gphoto2.html

gphoto2.html: $(gphoto2xml)
	$(XMLTO) xhtml-nochunks -o . $<

endif
