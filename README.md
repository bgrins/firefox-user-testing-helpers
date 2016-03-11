
# Firefox User Testing Helpers

Steps to generate a test build (Windows):

1. Generate a try push with your changes.  Here is an [example push](https://treeherder.mozilla.org/#/jobs?repo=mozilla-central&revision=d7a9e44717b7).
2. Find the win32.zip file in the Windows [build directory](http://ftp.mozilla.org/pub/mozilla.org/firefox/tinderbox-builds/mozilla-central-win32/1437484964/) - [win32.zip for example build](http://ftp.mozilla.org/pub/mozilla.org/firefox/tinderbox-builds/mozilla-central-win32/1437484964/firefox-42.0a1.en-US.win32.zip)
3. Unzip the build
4. Copy `_DOUBLE_CLICK_TO_RUN_FIREFOX_TEST.bat` and the `tmp-profile` folder into the build
5. Rezip the build folder

Now when someone runs _DOUBLE_CLICK_TO_RUN_FIREFOX_TEST.bat it should start a copy of Firefox with the clean profile alongside any other running copy.

## Create a self-extracting zip

Asking users to download the zip and then to click the .bat file can be confusing and error prone.  Here's a technique for creating a self-extracting zip file that makes it easier.  Instructions are adapted from [this stackoverflow answer](http://stackoverflow.com/questions/27904532/how-do-i-make-a-self-extract-and-running-installer/30896241#30896241).

* Go through step 4 above
* In the folder, select all the files, then create a new .7z archive (remember not to compress the folder itself – we want to compress all the files contained within)
* You get a .7z file. Let’s call it “firefox-nightly.7z”. Create a new directory (like `installer`) and move it there.
* Download and extract this package: http://www.7-zip.org/a/7z920_extra.7z
* Inside that package, there’s a file called “7zS.sfx”. Move it to the `installer` directory.
* Create a new file called `config.txt`. Make sure the encoding is UTF-8
** The file should contain these lines. Replace the value of “RunProgram” with the value of the file you want to execute.
```
;!@Install@!UTF-8!
RunProgram="_DOUBLE_CLICK_TO_RUN_FIREFOX_TEST.bat"
;!@InstallEnd@!
```
* Move `config.txt` to the `installer` directory.
* Go to command line, then browse to the `installer` directory
* Type `copy /b 7zS.sfx + config.txt + firefox-nightly.7z firefox-nightly.exe`
* You get a self-extracting archive file called `firefox-nightly.exe`, that will auto-execute the file you want.
