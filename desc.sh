#!/bin/sh

# Print the description from an *.el file.
egrep '^;;;.*--' $1 | \
  sed -E 's/^.*-- *//' | \
  sed -E 's/ -\*-.*$//'
