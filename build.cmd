@echo off
call "C:\Users\jimbo1qaz\encrypted\code\amk_tools\venv\Scripts\activate.bat"
set folder=..\addmusick-1.1.0-beta\

set NAME=zmm-final
rem set NAME=foo
rem set NAME=fuck


python -m amktools.wav2brr --verbose ^
	"wav" %folder% "idol1 final hours" || goto :eof
python -m amktools.mmkparser %NAME%.mmk -o %NAME%.txt || goto :eof
copy %NAME%.txt %folder%\music\%NAME%.txt


cd %folder%
rem echo 01 %NAME%.txt> Trackmusic_list.txt

addmusick -m -noblock
start SPCs\%NAME%.spc
