#!/bin/sh

################################################################################
# Extract documentation from an elisp function and put it on STDOUT.
#
# The first argument should be the name of a function for which you
# want documentation.
#
# Any remaining arguments are elisp files that should be loaded by
# Emacs so their documentation can be read.

################################################################################
ELPKG=`dirname $0`
TEMPF=`mktemp`
EMACS=emacs
FUNC=$1

################################################################################
loads () {
  for f in "$@"; do
    echo "-l $f"
  done
}

################################################################################
shift
${EMACS} --batch -Q -l $ELPKG/fdoc2md.el `loads "$@"` \
  --eval "(fdoc2md '$FUNC \"$TEMPF\")" > /dev/null 2>&1

cat $TEMPF
rm -f $TEMPF
