#!/bin/bash
# make-docs.sh - build gphoto2-manual from CVS
#
# Note that we do some path acrobatics here to get relative symlinks
# into the installation (symlinks for figures and screenshots)
#

# make sure builddir != srcdir, otherwise we're going to delete srcdir

srcdir="$HOME/src/photo/gphoto2-manual"
builddir="$HOME/src/photo/build-docs"
prefixdir="$HOME/root"
docdir="${builddir}/The_gPhoto2_Manual"

msg() {
    echo -e "\n###################################################################\n#### $@\n"
}

cmd() {
    msg "Executing [$@]..."
    "${@}"
    status=$?
    if [ $status -ne 0 ]
    then
	echo "Return value $status != 0. Aborted."
	exit $status
    fi
}

timeout() {
    local n=$1
    echo "Waiting for ${n:=5} seconds before continuing."
    while [ $n -gt 0 ]
    do
	echo -ne "\rGoing to continue in ${n} seconds..."
	sleep 1
	n=$(( $n - 1 ))
    done
    echo
    echo "Continuing."
}

cmd rm -rf "${builddir}"
# cmd rm -rf "${prefixdir}"
cmd rm -rf "${docdir}"
cmd mkdir -p "${builddir}"
cmd cd "${builddir}"

if [ -f "${srcdir}/config.status" ]
then
    if make -C "${srcdir}" clean distclean
    then
	msg "Cleaning up ${srcdir} was successful."
    else
	msg "${srcdir} is already configured. Aborting."
	exit 1
    fi
fi

cmd "${srcdir}/autogen.sh"

cmd "${srcdir}/configure" --prefix="${prefixdir}" \
    --with-doc-dir='$(top_builddir)/The_gPhoto2_Manual' \
    --with-screenshots-dir='$(docdir)/zgraphics/screenshots' \
    --with-figure-dir='$(docdir)/zgraphics/figures' \
    --with-doc-formats="html txt pdf man" \
    --enable-maintainer-mode

cmd make install

for file in $(find "${docdir}" -type f \( -name 'gphoto2.html' -or -name 'gphoto2.xml' -or -name 'gphoto2.pdf' -or -name 'gphoto2.txt' \) -print)
do
    echo "DirectoryIndex $(basename $file)" > $(dirname $file)/.htaccess; \
done

timeout

cmd chmod -R g-rwx "${docdir}"
cmd chmod -R o+r "${docdir}"
cmd rsync -avz -e ssh --delete "${docdir}" "h:n-dimensional.de/digicam/"

# cmd rm -rf "${prefixdir}"
cmd rm -rf "${builddir}"
# "${docdir}"

msg "$(basename $0) finished."
exit 0
