if XMLTOHTML

CLEANFILES = gphoto2.html

htmlnochunks_DATA = gphoto2.html

gphoto2.html: $(gphoto2xml)
	$(XMLTO) html-nochunks -o . $<

install-data-local:
	$(INSTALL) -d $(DESTDIR)$(htmlnochunksdir)
	cd $(DESTDIR)$(htmlnochunksdir) && ( [ -d figures ] || (rm -f figures && $(LN_S) -f $(figuredir) figures))
	cd $(DESTDIR)$(htmlnochunksdir) && ( [ -d screenshots ] || (rm -f screenshots && $(LN_S) -f $(screenshotsdir) screenshots))

uninstall-local:
	rm -f $(DESTDIR)$(htmlnochunksdir)/figures
	rm -f $(DESTDIR)$(htmlnochunksdir)/screenshots
	-rmdir $(DESTDIR)$(htmlnochunksdir)

else

install-data-local:
	@echo "Dummy $@ target"

uninstall-local:
	@echo "Dummy $@ target"

endif
