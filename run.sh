#!/bin/sh
# Run the GeoApt data browser. This script works on Mac OS X and
# Linux/Unix variants
# Copyright (C) 2008 Gary Sherman
# Licensed under the terms of GNU GPL 2
if [ -z "$1" ]
then
  echo "Specify the full path to your QGIS 1.x install."
  echo "Hint: On a Mac this will be something like /Applications/Qgis.app"
  echo "      If you have built using CMake you will have to adjust this script"
  echo "Hint: On Linux specify the directory containing bin/qgis. e.g. /usr or /usr/local"
else
  QGISBASE=$1
    if echo "$OSTYPE" | grep -q "darwin"
    then
      # setup for a Mac
      export DYLD_LIBRARY_PATH=$QGISBASE/Contents/MacOS/lib
      export PYTHONPATH=$PYTHONPATH:$QGISBASE/Contents/Resources/python 
      export QGISHOME=$QGISBASE/Contents/MacOS
     else
      # setup for a Linux/Unix variant
      export LD_LIBRARY_PATH=$QGISBASE/lib
      export PYTHONPATH=$PYTHONPATH:$QGISBASE/share/qgis/python 
      export QGISHOME=$QGISBASE
    fi
   ./GeoApt.py
fi

