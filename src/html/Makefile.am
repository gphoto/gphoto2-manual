if XMLTOHTML

CLEANFILES = *.html

html_DATA = index.html

index.html: $(gphoto2xml)
	$(XMLTO) html -o . $<

install-data-local: index.html
	$(INSTALL_DATA) *.html $(DESTDIR)$(htmldir)/
	cd $(DESTDIR)$(htmldir) && rm -f figures && $(LN_S) -f $(figuredir) figures
	cd $(DESTDIR)$(htmldir) && rm -f screenshots && $(LN_S) -f $(screenshotsdir) screenshots

uninstall-local:
	rm -f $(DESTDIR)$(htmldir)/*.html
	rm -f $(DESTDIR)$(htmldir)/figures
	rm -f $(DESTDIR)$(htmldir)/screenshots

else

install-data-local:
	@echo "Dummy $@ target"

uninstall-local:
	@echo "Dummy $@ target"

endif
