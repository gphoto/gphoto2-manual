if XMLTOPDF

CLEANFILES = gphoto2.pdf

pdf_DATA = gphoto2.pdf

# FIXME: We work around xmlto/passivetex/latex not finding images in
#       current directory, but only relative to $(gphoto2xml)
gphoto2.pdf: $(gphoto2xml)
	rm -f gphoto2.xml libgphoto2-FAQ libgphoto2-faq.xml && ln -s $^ .
	rm -f figures && ln -s ../figures .
	rm -f screenshots && ln -s $(srcdir)/../screenshots .
	$(XMLTO) pdf -o . gphoto2.xml
	rm -f screenshots figures gphoto2.xml

endif
