#!/bin/bash

args="$@"
EXTRAFLAGS="-std=c99"

os=`uname`

case $os in
    Linux)
        # this is to stop GCC from complaining that
        # strlen isn't defined in string.h on my
        # chromebook.
        EXTRAFLAGS="-std=gnu99"
        ;;
    *)
        ;;
esac

if [ ${#args} -gt 1 ] 
then
    case $1 in
        debug)
            echo "[debugging enabled]"
            EXTRAFLAGS="-std=c99 -g -DDEBUG" ;;
        *)
            ;;
    esac
fi

echo "building carML/c carmlc.c"
cc $EXTRAFLAGS -o carmlc ./src/carmlc.c -L ~/homebrew/lib/ -I ~/homebrew/include/ -lgc && echo "[build success]" || echo "[build failed]"
