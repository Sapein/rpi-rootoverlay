#!/bin/sh

type getarg > /dev/null 2>&1 || . /lib/dracut-lib.sh

if "${overlay_module_enabled}"
then
	need_shutdown;
fi
