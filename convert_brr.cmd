@echo off
call "C:\Users\jimbo1qaz\encrypted\code\amk_tools\venv\Scripts\activate.bat"
python -m amktools.wav2brr --verbose ^
	"wav" ^
	"..\addmusick-1.1.0-beta" ^
	"idol1 final hours" || goto :eof
