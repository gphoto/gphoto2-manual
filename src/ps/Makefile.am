if XMLTOPS

CLEANFILES = gphoto2.ps

ps_DATA = gphoto2.ps

gphoto2.ps: $(gphoto2xml)
	$(XMLTO) ps -o . $<

endif
