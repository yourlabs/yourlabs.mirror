#!/bin/sh -ex

echo "start: $(date)"
type rsync || { apk update; apk add rsync; }

src=rsync://rsync.alpinelinux.org/alpine/
dest=./www

cat > ~/exclude.txt <<EOF
v2.*/
v3.0/
v3.1/
v3.2/
v3.3/
v3.4/
v3.5/
v3.6/
v3.7/
v3.8/
v3.9/
v3.10/
s390x/
ppc64le/
aarch64/
arm*/
x86/
EOF

/usr/bin/rsync -v -prua \
    --exclude-from ~/exclude.txt \
    --delete \
    --timeout=120 \
    --delay-updates \
    --delete-after \
    "$src" "$dest"

echo "finish: $(date)"
echo "###############################"
