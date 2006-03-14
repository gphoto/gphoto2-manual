figs = $(shell find $(srcdir)/figures $(srcdir)/screenshots -name '*.png')
docname = gtkam
lang = C
omffile = gtkam-C.omf
entities = $(gphoto2xml) $(srcdir)/legal.xml

include $(top_srcdir)/xmldocs.make

dist-hook: app-dist-hook
