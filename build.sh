. ~/miniconda3/bin/activate amktools
trap "exit" INT TERM ERR
trap "kill 0" EXIT
wine cmd >/dev/null &

folder=../addmusick-1.1.0-beta/
NAME=zmm-final

python -m amktools.wav2brr --verbose \
	"wav" $folder "idol1 final hours" || exit
python -m amktools.mmkparser $NAME.mmk -o $NAME.txt || exit
cp $NAME.txt $folder/music/$NAME.txt


cd $folder
echo 01 $NAME.txt> Trackmusic_list.txt

# wine addmusick -m -noblock
wine addmusick -noblock -norom $NAME.txt
vlc SPCs/$NAME.spc
# wine start "" SPCs/$NAME.spc
kill %1
