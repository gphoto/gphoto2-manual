if XMLTOHTML

CLEANFILES = *.html

xhtml_DATA = index.html

index.html: $(gphoto2xml)
	$(XMLTO) xhtml -o . $<

install-data-local: index.html
	$(INSTALL_DATA) *.html $(DESTDIR)$(xhtmldir)/

uninstall-local:
	rm -f $(DESTDIR)$(xhtmldir)/*.html

else

install-data-local:
	@echo "Dummy $@ target"

uninstall-local:
	@echo "Dummy $@ target"

endif
