dnl ------------------------------------------------------------------------
dnl try to find xmlto (required for generation of man pages and html docs)
dnl ------------------------------------------------------------------------
AC_DEFUN(GP_CHECK_DOCBOOK_XML,
[
manual_msg="no (http://cyberelk.net/tim/xmlto/)"
try_xmlto=true
have_xmlto=false
AC_ARG_WITH(xmlto, [  --without-xmlto           Don't use xmlto],[
	if test x$withval = xno; then
		try_xmlto=false
	fi])
if $try_xmlto; then
	AC_PATH_PROG(XMLTO,xmlto)
	if test -n "${XMLTO}"; then
		have_xmlto=true
		manual_msg="yes"
		XMLTO="${XMLTO} -m \$(top_srcdir)/src/xsl/docbook-params.xsl"
        else
                # in case anybody runs $(XMLTO) somewhere, we return false
                XMLTO=false
	fi
fi

AM_CONDITIONAL(XMLTO, $have_xmlto)
])
