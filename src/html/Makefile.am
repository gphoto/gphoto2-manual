if XMLTOHTML

CLEANFILES = *.html

html_DATA = index.html

index.html: $(gphoto2xml)
	$(XMLTO) html -o . $<

install-data-local: index.html
	$(INSTALL_DATA) *.html $(DESTDIR)$(htmldir)/

uninstall-local:
	rm -f $(DESTDIR)$(htmldir)/*.html

else

install-data-local:
	@echo "Dummy $@ target"

uninstall-local:
	@echo "Dummy $@ target"

endif
