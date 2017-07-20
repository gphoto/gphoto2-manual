AC_PREREQ(2.59)
AC_INIT([gphoto2 manual],[2.3.1.trunk], [gphoto-devel@lists.sourceforge.net])
AC_CONFIG_SRCDIR([src/gphoto2.xml])
AC_CONFIG_AUX_DIR([auto-aux])
AC_CONFIG_MACRO_DIR([m4])
AM_INIT_AUTOMAKE([gnu 1.9 dist-bzip2])

AC_PROG_SED
AC_PROG_LN_S()

GP_BUILD_DOCS()

dnl ---------------------------------------------------------------------------
dnl GNOME support: We can use the GNOME help system if scrollkeeper is
dnl                installed.
dnl ---------------------------------------------------------------------------
scrollkeeper_msg="no"
try_scrollkeeper=true
have_scrollkeeper=false
AC_ARG_WITH([scrollkeeper],[
	AS_HELP_STRING([--without-scrollkeeper],
                       [Do not use scrollkeeper])
],[
	if test x$withval = xno; then
		try_scrollkeeper=false
	fi
])
if $try_scrollkeeper; then
	AC_PATH_PROG([SCROLLKEEPER_CONFIG],[scrollkeeper-config])
	if test -n "${SCROLLKEEPER_CONFIG}"; then
		have_scrollkeeper=true
		scrollkeeper_msg="yes"
	fi
else
	scrollkeeper_msg="no (not requested)"
fi
AM_CONDITIONAL([HAVE_SCROLLKEEPER], [$have_scrollkeeper])
GP_CONFIG_MSG([Scrollkeeper support], [$scrollkeeper_msg])

AC_CONFIG_FILES([
Makefile
gphoto2-manual.pc
gphoto2-manual-uninstalled.pc
gphoto-m4/Makefile
help/Makefile
help/C/Makefile
src/Makefile
src/css/Makefile
src/xsl/Makefile
src/html/Makefile
src/html-nochunks/Makefile
src/xhtml/Makefile
src/xhtml-nochunks/Makefile
src/pdf/Makefile
src/ps/Makefile
src/man/Makefile
src/txt/Makefile
src/txt2/Makefile
src/figures/Makefile
src/screenshots/Makefile
src/screenshots/gtkam/Makefile
])
AC_OUTPUT

GP_CONFIG_OUTPUT
