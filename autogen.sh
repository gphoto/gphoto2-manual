#!/bin/sh

here=$(dirname $0)

aclocal -I m4
automake --gnu --add-missing
autoconf

echo "You may run $here/configure now."
