if XMLTOPDF

CLEANFILES = gphoto2.pdf

pdf_DATA = gphoto2.pdf

# FIXME: We work around xmlto/passivetex/latex not finding images in
#       current directory, but only relative to $(gphoto2xml)
gphoto2.pdf: $(gphoto2xml)
	@cd $(srcdir)/../figures && \
		for p in $(PWD)/../figures/*.png; do \
			if ! test -f $$(basename $$p); then \
				echo " $(LN_S) -f $$p . # working around bug in xmlto/passivetex"; \
				$(LN_S) -f $$p .; \
			fi; \
		done
	$(XMLTO) pdf -o . $<
	rm -f $(srcdir)/../figures/*.png # working around bug in xmlto/passivetex

endif
