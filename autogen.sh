#!/bin/sh

here=$(dirname $0)

echo "#### Cleaning directory tree from non-CVS files"
for dir in $(find . -type d)
do
(
    if cd "${dir}" && test -s .cvsignore
    then
	echo "Cleaning directory from non-CVS files: ${dir}"
	rm -rf $(cat .cvsignore)
    fi
)
done
echo "Finished cleaning."

cat<<EOF | while read command; do echo "#### Executing \"$command\"..."; $command; done
aclocal -I m4
automake --gnu --add-missing
autoconf
EOF

echo "#### You may run $here/configure now."
