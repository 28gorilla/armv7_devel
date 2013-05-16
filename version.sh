#!/bin/sh
#
ARCH=$(uname -m)

#Dual/Quad Core arms are now more prevalent, so don't just limit to x86:
CORES=$(cat /proc/cpuinfo | grep processor | wc -l)

unset GIT_OPTS
unset GIT_NOEDIT
LC_ALL=C git help pull | grep -m 1 -e "--no-edit" >/dev/null 2>&1 && GIT_NOEDIT=1

if [ "${GIT_NOEDIT}" ] ; then
	GIT_OPTS="${GIT_OPTS} --no-edit"
fi

config="sama5d3_defconfig"

#Kernel/Build
KERNEL_REL=3.6
KERNEL_TAG=${KERNEL_REL}.9
BUILD=sama5-armv7-d0.9

#v3.X-rcX + upto SHA
#KERNEL_SHA=""

#git branch
BRANCH="v3.6.x-sama5-armv7"

BUILDREV=1.0
DISTRO=cross
DEBARCH=armhf
