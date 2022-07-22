#!/bin/sh

type getarg >/dev/null 2>&1 || . /lib/dracut-lib.sh

[ -z "${boot}" ] && boot=$(getarg boot=)
[ -z "${root}" ] && root=$(getarg root=)

if [ "${boot}" = "overlay" ]
then
	trueroot=$root
	root="overlay"
	rootok=1
	overlay_module_enabled="true"
else
	overlay_module_enabled="false"
fi
export overlay_module_enabled root trueroot rootok
