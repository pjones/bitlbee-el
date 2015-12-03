#!/bin/sh

################################################################################
NAME=$1
ELFILE=$2
ELPKG=`dirname $0`
VERSION=`$ELPKG/version.sh $ELFILE`
DESC=`$ELPKG/desc.sh $ELFILE`
DEPS=`[ -r deps.el ] && cat deps.el` # FIXME: what file name to use?

###############################################################################
printf '(define-package "%s" "%s" "%s" %s)\n' \
  "$NAME" "$VERSION" "$DESC" "$DEPS"
