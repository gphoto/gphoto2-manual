if XMLTOPDF

CLEANFILES = gphoto2.pdf

pdf_DATA = gphoto2.pdf

gphoto2.pdf: $(gphoto2xml)
	$(XMLTO) pdf -o . $<

endif
