if XMLTOHTML

CLEANFILES = gphoto2.html

xhtmlnochunks_DATA = gphoto2.html

gphoto2.html: $(gphoto2xml)
	$(XMLTO) xhtml-nochunks -o . $<

install-data-local:
	$(INSTALL) -d $(DESTDIR)$(xhtmlnochunksdir)/
	cd $(DESTDIR)$(xhtmlnochunksdir) && rm -f figures && $(LN_S) -f $(figuredir) figures
	cd $(DESTDIR)$(xhtmlnochunksdir) && rm -f screenshots && $(LN_S) -f $(screenshotsdir) screenshots

uninstall-local:
	rm -f $(DESTDIR)$(xhtmlnochunksdir)/figures
	rm -f $(DESTDIR)$(xhtmlnochunksdir)/screenshots
	-rmdir $(DESTDIR)$(xhtmlnochunksdir)

else

install-data-local:
	@echo "Dummy $@ target"

uninstall-local:
	@echo "Dummy $@ target"

endif
