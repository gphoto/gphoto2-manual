if XMLTOHTML

CLEANFILES = gphoto2.html

htmlnochunks_DATA = gphoto2.html

gphoto2.html: $(gphoto2xml)
	$(XMLTO) html-nochunks -o . $<

endif
