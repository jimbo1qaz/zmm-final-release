. ~/miniconda3/bin/activate amktools
trap "exit" INT TERM ERR
trap "kill 0" EXIT
wine cmd >/dev/null &

folder=../addmusick-1.1.0-beta/
folder=../AddmusicK_1.0.6/
NAME=zmm-final

txt="$NAME.txt"
python -m amktools.wav2brr --verbose \
	"wav" $folder "zmm-final" || exit
python -m amktools.mmkparser $NAME.mmk -o "$txt" || exit
unix2dos "$txt"
cp "$txt" "$folder/music/$txt"


cd $folder
echo 01 "$txt"> Trackmusic_list.txt

# wine addmusick -m -noblock
wine addmusick -noblock -norom "$txt"
kill %1

zip=`readlink -f "zmm-final no bell, sfx compatible.zip"`

rm "$zip"

pushd samples
7z a "$zip" "$NAME/*.brr"
popd
pushd music
7z a "$zip" "$txt"
popd
pushd SPCs
7z a "$zip" "$NAME.spc"
popd

vlc SPCs/$NAME.spc
# wine start "" SPCs/$NAME.spc
