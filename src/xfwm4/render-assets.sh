#! /bin/bash

INKSCAPE="/usr/bin/inkscape"
OPTIPNG="/usr/bin/optipng"

INDEX="assets.txt"

for variant in '' '-Dark'; do
  for color in '' '-Doder'; do

    ASSETS_DIR="assets${variant}${color}"
    SRC_FILE="assets${variant}${color}.svg"

    for i in `cat $INDEX`
    do
    if [ -f $ASSETS_DIR/$i.png ]; then
        echo $ASSETS_DIR/$i.png exists.
    else
        echo
        echo Rendering $ASSETS_DIR/$i.png
        $INKSCAPE --export-id=$i \
                  --export-id-only \
                  --export-png=$ASSETS_DIR/$i.png $SRC_FILE >/dev/null \
        && $OPTIPNG -o7 --quiet $ASSETS_DIR/$i.png
    fi
    done
  done
done

    LIGHT_ASSETS_DIR="assets-Light"
    LIGHT_SRC_FILE="assets-Light.svg"

    for i in `cat $INDEX`
    do
    if [ -f $LIGHT_ASSETS_DIR/$i.png ]; then
        echo $LIGHT_ASSETS_DIR/$i.png exists.
    else
        echo
        echo Rendering $LIGHT_ASSETS_DIR/$i.png
        $INKSCAPE --export-id=$i \
                  --export-id-only \
                  --export-png=$LIGHT_ASSETS_DIR/$i.png $LIGHT_SRC_FILE >/dev/null \
        && $OPTIPNG -o7 --quiet $LIGHT_ASSETS_DIR/$i.png
    fi
    done

exit 0
