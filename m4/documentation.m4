dnl
dnl check where to install documentation
dnl
dnl determines documentation "root directory", i.e. the directory
dnl where all documentation will be placed in
dnl

AC_DEFUN(GP_CHECK_DOC_DIR,
[

AC_ARG_WITH(doc-dir, [  --with-doc-dir=PATH       Where to install docs  [default=autodetect]])dnl

# check for the main ("root") documentation directory
AC_MSG_CHECKING([main docdir])

if test "x${with_doc_dir}" != "x"
then # docdir is given as parameter
    DOC_DIR="${with_doc_dir}"
    AC_MSG_RESULT([${DOC_DIR} (from parameter)])
else # otherwise invent a docdir hopefully compatible with system policy
    if test -d "/usr/share/doc"
    then
        maindocdir='${prefix}/share/doc'
        AC_MSG_RESULT([${maindocdir} (FHS style)])
    elif test -d "/usr/doc"
    then
        maindocdir='${prefix}/doc'
        AC_MSG_RESULT([${maindocdir} (old style)])
    else
        maindocdir='${datadir}/doc'
        AC_MSG_RESULT([${maindocdir} (default value)])
    fi
    AC_MSG_CHECKING(package docdir)
    # check whether to include package version into documentation path
    # FIXME: doesn't work properly.
    if ls -d /usr/{share/,}doc/*-[[]0-9[]]* > /dev/null 2>&1
    then
        DOC_DIR="${maindocdir}/${PACKAGE}-${VERSION}"
        AC_MSG_RESULT([${DOC_DIR} (redhat style)])
    else
        DOC_DIR="${maindocdir}/${PACKAGE}"
        AC_MSG_RESULT([${DOC_DIR} (default style)])
    fi
fi

AC_SUBST(DOC_DIR)

])dnl

dnl Solaris hack for grep and tr
AC_DEFUN(GP_CHECK_TR,
[
if test -n "`echo $host_os | grep '[sS]olaris'`"; then
  TR=/usr/xpg4/bin/tr
  GREP=/usr/xpg4/bin/grep  
else
  TR=tr
  GREP=grep
fi	
])

dnl
dnl check whether to build docs and where to:
dnl
dnl * determine presence of prerequisites (only gtk-doc for now)
dnl * determine destination directory for HTML files
dnl

AC_DEFUN(GP_BUILD_DOCS,
[
# doc dir has to be determined in advance
AC_REQUIRE([GP_CHECK_DOC_DIR])
AC_REQUIRE([GP_CHECK_GTK_DOC])
AC_REQUIRE([GP_CHECK_FIG2DEV])
AC_REQUIRE([GP_CHECK_DOCBOOK_XML])
AC_REQUIRE([GP_CHECK_TR])

dnl ---------------------------------------------------------------------------
dnl Give the user the possibility to install html documentation in a 
dnl user-defined location.
dnl ---------------------------------------------------------------------------
AC_ARG_WITH(html-dir, [  --with-html-dir=PATH      Where to install html docs [default=autodetect]])
AC_MSG_CHECKING([for html dir])
if test "x${with_html_dir}" = "x" ; then
    htmldir="${DOC_DIR}/html"
    AC_MSG_RESULT([${htmldir} (default)])
else
    htmldir="${with_html_dir}"
    AC_MSG_RESULT([${htmldir} (from parameter)])
fi
AC_SUBST(htmldir)


doc_formats_list='man html ps pdf'

# initialize have_xmlto* to false
for i in $doc_formats_list; do
  d=`echo $i | $TR A-Z a-z`
  eval "have_xmlto$d=false"
done

AC_MSG_CHECKING(checking doc formats)
AC_ARG_WITH(doc_formats,
  [  --with-doc-formats=<list>   create doc with format in <list>; ]
  [                            'all' build all doc formats; ]
  [                            possible formats are: ]
  [                            man, html, ps, pdf ],
  doc_formats="$withval", doc_formats="man html")

if test "$doc_formats" = "all"; then
  doc_formats=$doc_formats_list
else
  doc_formats=`echo $doc_formats | sed 's/,/ /g'`
fi

# set have_xmlto* to true if requested and possible
if $have_xmlto; then
  for i in $doc_formats; do
    if test -n "`echo $doc_formats_list | $GREP -E \"(^| )$i( |\$)\"`"; then
      eval "have_xmlto$i=true"
    else
      AC_ERROR(Unknown doc format $i!)
    fi
  done
  AC_MSG_RESULT($doc_formats)
else
  AC_MSG_RESULT([deactivated (requires xmlto)])
fi

AM_CONDITIONAL(XMLTOHTML,$have_xmltohtml)
AM_CONDITIONAL(XMLTOMAN,$have_xmltoman)
AM_CONDITIONAL(XMLTOPDF,$have_xmltopdf)
AM_CONDITIONAL(XMLTOPS,$have_xmltops)

# create list of supported formats
AC_MSG_CHECKING([for manual formats to re­create])
xxx=""
manual_html=""
manual_pdf=""
manual_ps=""
if $have_xmltohtml; then
        manual_html=manual
        xxx="${xxx} html($manual_html)"
fi
if $have_xmltoman; then
        xxx="${xxx} man"
fi
if $have_xmltopdf; then
        manual_pdf=gphoto2.pdf
        xxx="${xxx} pdf($manual_pdf)"
fi
if $have_xmltops; then 
        manual_ps=gphoto2.ps
        xxx="${xxx} ps($manual_ps)"
fi
AC_SUBST(manual_html)
AC_SUBST(manual_pdf)
AC_SUBST(manual_ps)
AC_MSG_RESULT($xxx)

if test "x$xxx" != "x"
then
        if $have_fig2dev; then
                fig_out=""
        else
                fig_out="out"
        fi
        manual_msg="in (${xxx} ) format with${fig_out} figures"
fi

])dnl
