. ~/miniconda3/bin/activate amktools

wine cmd >/dev/null &

# PIPENV_PIPFILE=/home/jimbo1qaz/Dropbox/encrypted/code/amk_tools/Pipfile pipenv run \
python -m amktools.wav2brr --verbose \
	"wav" \
	"../addmusick-1.1.0-beta" \
	"idol1 final hours" || exit

kill %1
#!/usr/bin/env zsh
