if XMLTOHTML

CLEANFILES = *.html

html_DATA = index.html

index.html: $(gphoto2xml)
	$(XMLTO) html -o . $<

# FIXME: We should calculate relative paths for the symlinks
#       OK, admittedly you can work around absolute symlinks
#       by giving configure cleverly designed path names, but still...
install-data-local: index.html
	$(INSTALL) -d $(DESTDIR)$(htmldir)/
	$(INSTALL_DATA) *.html $(DESTDIR)$(htmldir)/
	cd $(DESTDIR)$(htmldir) && ( [ -d figures ] || (rm -f figures && $(LN_S) -f $(figuredir) figures))
	cd $(DESTDIR)$(htmldir) && ( [ -d screenshots ] || (rm -f screenshots && $(LN_S) -f $(screenshotsdir) screenshots))

uninstall-local:
	rm -f $(DESTDIR)$(htmldir)/*.html
	rm -f $(DESTDIR)$(htmldir)/figures
	rm -f $(DESTDIR)$(htmldir)/screenshots
	-rmdir $(DESTDIR)$(htmldir)

else

install-data-local:
	@echo "Dummy $@ target"

uninstall-local:
	@echo "Dummy $@ target"

endif
