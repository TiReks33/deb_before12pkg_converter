#!/bin/bash

outputdir="/tmp"

if [ $# -eq 0 ]
    then
        echo "No arguments supplied, need at least 1"
        exit 1
elif [ $# -gt 2 ]
    then
        echo "Too much arguments supplied, no more than 2 are required."
        exit 1
elif [ ! -f "${1}" ]
    then   
        if [[ "${1}" = "-h" || "${1}" = "--help" ]] ; then
            echo "usage -- 1st argument is a input '.deb' file for convert, 2nd arg is a prefered path to converted output '.deb' file ('${outputdir}' by default); type --help(-h) to view this help ."
            exit 0
        else
            echo "File not found!"
            exit 1
        fi
else
    #outputdir="/tmp"
    if [ $# -gt 1 ]
        then
            if [ -d $2 ]
                then
                    outputdir="${2}"
                else
                    echo "[WARNING] argument '${2}' is not a directory; using default one (${outputdir}) ."
            fi
    fi

    ar x $1
    zstd -d < control.tar.zst | xz > control.tar.xz
    zstd -d < data.tar.zst | xz > data.tar.xz
    #ar -m -c -a sdsd /tmp/some-package.deb debian-binary control.tar.xz data.tar.xz
    basefname=$(basename -- "$1")
    outputf="${outputdir}/${basefname}"
    ar -m -c -a sdsd ${outputf} debian-binary control.tar.xz data.tar.xz
    rm debian-binary control.tar.xz data.tar.xz control.tar.zst data.tar.zst

    echo "the scipt has finished its work. Ready-To-Use package placed in '${outputf}' ." 
    


fi

