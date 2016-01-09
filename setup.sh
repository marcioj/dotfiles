#!/usr/bin/env bash

# Usage: setup.sh
#
# For each dotfile from whithin this directory, link to user $HOME.
# Folders starting with . are ignored.

set -eu -o pipefail
# set -x

filepath=$(readlink -f $0)
basedir=$(dirname $filepath)

for dotfile in $(find $basedir -maxdepth 1 -name '.*' -type f); do
  target=$HOME/$(basename $dotfile)
  test -f $target && rm $target
  echo "Adding $target"
  ln -s $dotfile $target
done
