if XMLTOPDF

CLEANFILES = gphoto2.pdf

pdf_DATA = gphoto2.pdf

# FIXME: We work around xmlto/passivetex/latex not finding images in
#       current directory, but only relative to $(gphoto2xml)
gphoto2.pdf: $(gphoto2xml)
	@if echo "x$(top_builddir)" | grep "^x/" > /dev/null; then \
		abs_top_builddir=$(top_builddir); \
	else \
		abs_top_builddir=$(PWD)/$(top_builddir); \
	fi; \
	if echo "x$(top_srcdir)" | grep "^x/" > /dev/null; then \
		abs_top_srcdir=$(top_srcdir); \
	else \
		abs_top_srcdir=$(PWD)/$(top_srcdir); \
	fi; \
	echo "Running $(XMLTO) pdf -o . $< --searchpath $${abs_top_builddir}/src:$${abs_top_srcdir}/src"; \
	$(XMLTO) pdf -o . $< --searchpath $${abs_top_builddir}/src:$${abs_top_srcdir}/src
#	rm -f gphoto2.xml libgphoto2-usage-faq.xml install-faq.xml && ln -s $^ .
#	rm -f figures && ln -s ../figures .
#	rm -f screenshots && ln -s $(srcdir)/../screenshots .
#	$(XMLTO) pdf -o . gphoto2.xml
#	rm -f screenshots figures gphoto2.xml

endif
