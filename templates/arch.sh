#!/bin/sh -ex

type rsync || { apk update; apk add rsync; }

REPO=rsync://archlinux.polymorf.fr/archlinux/
DEST=./www

# Common rsync options
RSYNC_OPTS="-rtlH -4 --safe-links --no-motd --exclude=os/i686"

# Only be verbose on tty
if tty -s; then
  RSYNC_OPTS="$RSYNC_OPTS -v"
fi

cat > ~/exclude.txt <<EOF
iso
other
archlinux
*-testing
*-staging
*-unstable
EOF

# first get new package files (the pool) and don't delete anything
/usr/bin/rsync $RSYNC_OPTS $REPO/pool/ $DEST/pool/

# … and only then get the database, links and the structure
/usr/bin/rsync $RSYNC_OPTS --delete-after --delay-updates $REPO $DEST \
        --exclude-from ~/exclude.txt

# --delete-before so that it frees disk space earlier
/usr/bin/rsync $RSYNC_OPTS --delete-before $REPO/iso/ $DEST/iso/ --exclude archboot
