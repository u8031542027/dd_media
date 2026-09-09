#!/bin/sh

# install rename
apt install rename -y

# create LIB_DIR
LIB_DIR=/usr/lib/dd_media/
mkdir -p "${LIB_DIR}src/"

# install yt-dlp and deface
python3 -m venv "${LIB_DIR}src/venv"
"${LIB_DIR}src/venv/bin/python3" -m pip install yt-dlp
"${LIB_DIR}src/venv/bin/python3" -m pip install deface

# install increment-suffix 
cp -v ./src/increment-suffix "${LIB_DIR}src/"

# install main binary
cp -v ./dd_media.sh /usr/bin/dd_media
chmod +x /usr/bin/dd_media

exit 0
