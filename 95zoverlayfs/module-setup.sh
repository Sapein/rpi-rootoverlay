#!/bin/sh

check() {
    return 0
}

depends() {
    return 0
}

install() {
    inst_hook cmdline 20 "${moddir}/parse-overlay-commands.sh"
    inst_hook cleanup 10 "${moddir}/overlay-needshutdown.sh"
    inst_hook mount 99 "${moddir}/overlay-create.sh"
}

installkerenl() {
    hostonly='' instmods overlay
}
