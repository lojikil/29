#!/bin/bash

args="$@"
EXTRAFLAGS="-std=c99"

if [ ${#args} -gt 1 ] 
then
    case $1 in
        debug)
            EXTRAFLAGS="-std=c99 -g" ;;
        *)
            ;;
    esac
fi

echo "building carML/c carmlc.c"
cc $EXTRAFLAGS -o carmlc carmlc.c -L ~/homebrew/lib/ -I ~/homebrew/include/ -lgc && echo "[build success]" || echo "[build failed]"
