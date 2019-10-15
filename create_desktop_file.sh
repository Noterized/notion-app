#!/bin/sh
set -e
WORKING_DIR=`pwd`
THIS_PATH=`readlink -f $0`
cd `dirname ${THIS_PATH}`
FULL_PATH=`pwd`
cd ${WORKING_DIR}
cat <<EOS > Notion.desktop
[Desktop Entry]
Name=Notion
Name[en_US]=Notion.so
Comment=Notion.so Desktop application for Linux
Exec="${FULL_PATH}/notion-app"
Terminal=false
Categories=Application;
Type=Application
Icon=${FULL_PATH}/notion.png
EOS
chmod +x Notion.desktop
## This can be updated if this path is not valid. 
## cp -p Notion.desktop ~/.local/share/applications
[ ! -d "$~/.local/share/applications" ] && { cd ~/.local/share; mkdir -p applications; cd ${WORKING_DIR}; cp -p Notion.desktop ~/.local/share/applications; } || { cd ${WORKING_DIR}; cp -p Notion.desktop ~/.local/share/applications; }
