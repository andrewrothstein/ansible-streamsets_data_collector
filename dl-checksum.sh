#!/usr/bin/env sh
VER=3.9.1
DIR=~/Downloads

dl() {
    TGZTY=$1
    TGZ=streamsets-datacollector-${TGZTY}-${VER}.tgz
    SHA1=${TGZ}.sha1
    MIRROR=https://archives.streamsets.com/datacollector
    URL=${MIRROR}/${VER}/tarball/$SHA1

    printf "    # %s\n" $URL
    printf "    %s: sha1:%s\n" $TGZTY `curl -sSL $URL | awk '{print $1}'`
}

printf "  '%s':\n" $VER
dl all
dl core


