if XMLTOHTML

CLEANFILES = *.html

xhtml_DATA = index.html

index.html: $(gphoto2xml)
	$(XMLTO) xhtml -o . $<

install-data-local: index.html
	$(INSTALL_DATA) *.html $(DESTDIR)$(xhtmldir)/
	cd $(DESTDIR)$(xhtmldir) && rm -f figures && $(LN_S) -f $(figuredir) figures
	cd $(DESTDIR)$(xhtmldir) && rm -f screenshots && $(LN_S) -f $(screenshotsdir) screenshots

uninstall-local:
	rm -f $(DESTDIR)$(xhtmldir)/*.html
	rm -f $(DESTDIR)$(xhtmldir)/figures
	rm -f $(DESTDIR)$(xhtmldir)/screenshots

else

install-data-local:
	@echo "Dummy $@ target"

uninstall-local:
	@echo "Dummy $@ target"

endif
