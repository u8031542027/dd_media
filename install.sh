#!/bin/sh


if [ ! $(whoami) = "root" ]; then
    echo "RUN SCRIPT WITH SUDO."
    exit 0
fi


# GET SCRIPT ABS DIR
export SCRIPT_REL_PATH="${0}"
export SCRIPT_REL_DIR=${SCRIPT_REL_PATH%/*}/
cd "${SCRIPT_REL_DIR}"
export SCRIPT_ABS_DIR=$(pwd)/

# install requirements
apt install rename -y
apt install ffmpeg -y

# create LIB_DIR
export LIB_DIR=/usr/lib/dd_media/
mkdir -p "${LIB_DIR}src/"

# install yt-dlp and deface
python3 -m venv "${LIB_DIR}src/venv"
"${LIB_DIR}src/venv/bin/python3" -m pip install yt-dlp
"${LIB_DIR}src/venv/bin/python3" -m pip install deface
"${LIB_DIR}src/venv/bin/python3" -m pip install onnxruntime-gpu
"${LIB_DIR}src/venv/bin/python3" -m pip install onnx

# install increment-suffix 
cp -v ./src/increment-suffix.sh "${LIB_DIR}src/increment-suffix.sh"

ln -fsv "${LIB_DIR}src/increment-suffix.sh" /usr/local/bin/increment-suffix

# install main binary
cp -v ./dd_media.sh /usr/bin/dd_media
chmod +x /usr/bin/dd_media

exit 0

