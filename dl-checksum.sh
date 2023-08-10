#!/usr/bin/env sh
MIRROR=https://archives.streamsets.com/datacollector
DIR=~/Downloads

dl() {
    ver=$1
    tgz_ty=$2
    tgz_sha1="streamsets-datacollector-${tgz_ty}-${ver}.tgz.sha1"
    url="${MIRROR}/${ver}/tarball/${tgz_sha1}"

    printf "    # %s\n" $url
    printf "    %s: sha1:%s\n" $tgz_ty $(curl -sSLf $url | awk '{print $1}')
}

dlver() {
    ver=$1
    printf "  '%s':\n" $ver
    dl $ver all
    dl $ver core
}

dlver ${1:-3.10.1}
