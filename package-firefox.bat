set PATH=%PATH%;C:\Program Files\7-Zip\;C:\Program Files (x86)\7-Zip\

del firefox.7z

copy _DOUBLE_CLICK_TO_RUN_FIREFOX_TEST.bat firefox\

del firefox\tmp-profile /Q
mkdir firefox\tmp-profile
xcopy tmp-profile firefox\tmp-profile /E

cd firefox
7z a ../firefox.7z *

pause
