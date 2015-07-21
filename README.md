
# Firefox User Testing Helpers

Steps to generate a test build (Windows)

1) Generate a try push with your changes.  Here is an [example push](https://treeherder.mozilla.org/#/jobs?repo=mozilla-central&revision=d7a9e44717b7).
2) Find the win32.zip file in the Windows [build directory](http://ftp.mozilla.org/pub/mozilla.org/firefox/tinderbox-builds/mozilla-central-win32/1437484964/) - [win32.zip for example build](http://ftp.mozilla.org/pub/mozilla.org/firefox/tinderbox-builds/mozilla-central-win32/1437484964/firefox-42.0a1.en-US.win32.zip)
3) Unzip the build
4) Copy `_DOUBLE_CLICK_TO_RUN_FIREFOX_TEST.bat` and the `tmp-profile` folder into the build
5) Rezip the build folder

Now when someone runs _DOUBLE_CLICK_TO_RUN_FIREFOX_TEST.bat it should start a copy of Firefox with the clean profile alongside any other running copy.