if XMLTOTXT

CLEANFILES = gphoto2.txt

txt_DATA = gphoto2.txt

gphoto2.txt: $(gphoto2xml)
	$(XMLTO) txt -o . $<

endif
