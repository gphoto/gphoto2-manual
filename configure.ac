AC_PREREQ(2.69)
AC_INIT([gphoto2 manual],
        [2.3.2git],
        [https://github.com/gphoto/gphoto2-manual/issues],
        [gphoto2-manual],
        [https://github.com/gphoto/gphoto2-manual])
AC_CONFIG_SRCDIR([src/gphoto2.xml])
AC_CONFIG_AUX_DIR([auto-aux])
AC_CONFIG_MACRO_DIR([m4])
AM_INIT_AUTOMAKE([
  gnu
  1.14.1
  dist-bzip2
])

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
AC_ARG_WITH([scrollkeeper],[dnl
AS_HELP_STRING([--without-scrollkeeper],
               [Do not use scrollkeeper])
],[dnl
AS_VAR_IF([withval], [no], [try_scrollkeeper=false])
])
AS_IF([$try_scrollkeeper], [dnl
	AC_PATH_PROG([SCROLLKEEPER_CONFIG],[scrollkeeper-config])
	if test -n "${SCROLLKEEPER_CONFIG}"; then
		have_scrollkeeper=true
		scrollkeeper_msg="yes"
	fi
], [dnl
	scrollkeeper_msg="no (not requested)"
])
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
