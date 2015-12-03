#!/bin/sh
grep :version "$1" \
  | sed -E 's/^.*:version *"([^"]*)".*$/\1/'
