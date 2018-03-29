#! /bin/bash
set -eu

txtdir=../txt
mddir=../md

rm -rf "${mddir}"
mkdir -p "${mddir}"

cd "${txtdir}"
for txtfile in *.txt; do
  mdfile=${txtfile%.*}.md
  cp "${txtfile}" "${mddir}/${mdfile}"
  sed -i "s/^\([A-Z \':-\.]\+\)$/## \1/g" "${mddir}/${mdfile}"
  sed -i "s/^## CHAPTER/# CHAPTER/g" "${mddir}/${mdfile}"
  sed -i "s/\*/\\\*/g" "${mddir}/${mdfile}"
done
