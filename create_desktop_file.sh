#!/bin/sh
set -e
WORKING_DIR=`pwd`
THIS_PATH=`readlink -f $0`
cd `dirname ${THIS_PATH}`
FULL_PATH=`pwd`
cd ${WORKING_DIR}
cat <<EOS > Notion.desktop
[Desktop Entry]
Name[en_US]=Notion.so
Comment=Notion.so Desktop application for Linux
Exec="${FULL_PATH}/notion-app"
Terminal=false
Categories=Application;
Type=Application
Icon=${FULL_PATH}/notion.png
EOS
chmod +x Notion.desktop
