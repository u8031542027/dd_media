#!/bin/sh

# ----- Download and Deface media -----

if [ "${1}" = "" ] || [ "${1}" = "-h" ] || [ "${1}" = "--help" ]; then

    echo "Usage: dd_media [media_link]" 
    echo " "
    echo "download and deface media"
    echo " "
    echo "options:"
    echo "  -h, help          show this help message and exit"
    echo "  media_link        link to any video or playlist to download and deface"
    
    exit 0
fi

cd $(pwd)/
echo "changed dir into $(pwd)/"
ix=$(increment-suffix tmp-dd_media-)
echo "ix = ${ix}"
WORK_DIR="./tmp-dd_media-${ix}/"
mkdir "${WORK_DIR}"
cd "${WORK_DIR}"
echo "changed dir into ${WORK_DIR}"
/usr/lib/dd_media/src/venv/bin/python3 /usr/lib/dd_media/src/venv/bin/yt-dlp $@ 2>&1 | tee /tmp/dd_media_yt-dlp-output.txt
echo "\n"
rename "s/ /_/g" *
for f in $(ls); do  
    /usr/lib/dd_media/src/venv/bin/python3 /usr/lib/dd_media/src/venv/bin/deface "${f}" --keep-audio
done

exit 0
