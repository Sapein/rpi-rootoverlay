#!/bin/sh

type getarg > /dev/null 2>&1 || . /lib/dracut-lib.sh && . /lib/fs-lib.sh

[ -z "$root" ] && root=$(getarg root=)
[ -z "$trueroot" ] && trueroot=$(getarg trueroot=)

generate_overlay() {
	mkdir /lower /upper
	mount -r "${trueroot}" /lower

	mount -t tmpfs tmpfs /upper
	mkdir /upper/data
	mkdir /upper/work
	mount -t overlay -o lowerdir=/lower,upperdir=/upper/data,workdir=/upper/work overlay $NEWROOT
}

if ${overlay_module_enabled}
then
	generate_overlay
fi
