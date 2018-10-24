# Firefox User Testing Helpers

Steps to manually generate a test build .zip (Windows):

1. Generate a try push with your changes.  Here are some [examples](https://treeherder.mozilla.org/#/jobs?repo=try&searchStr=windows%2Cbuild-%2C%2Fopt).
2. Find the `target.zip` artifact for the Windows opt build by clicking on a "B" and looking at the "Job Details" tab of the TreeHerder footer pane. You will see "artifact uploaded: target.zip" with the link.
    * A 32-bit version is recommended if there is a chance that a participant is still running a 32-bit Windows version.
3. Unzip the build inside the directory where you clone this repository so it creates the `firefox` directory inside of it.
4. Copy `_DOUBLE_CLICK_TO_RUN_FIREFOX_TEST.bat` and the `tmp-profile` folder into the build
5. Re-zip the build folder

Now when someone runs `_DOUBLE_CLICK_TO_RUN_FIREFOX_TEST.bat` it should start a copy of Firefox with the clean profile alongside any other running copy.

## Create a self-extracting .exe

Asking users to download the zip and then to click the .bat file can be confusing and error prone.  Here's a technique for creating a self-extracting zip file that makes it easier.  Instructions are adapted from [this stackoverflow answer](http://stackoverflow.com/questions/27904532/how-do-i-make-a-self-extract-and-running-installer/30896241#30896241).

1. Complete steps 1 though 3 above.
1. Install [7-Zip](https://www.7-zip.org/).
1. Double-click `package-firefox.bat` to create `firefox.7z`. Repeat this whenever you change `tmp-profile\` or `firefox\`.
1. Download and extract this package: http://www.7-zip.org/a/7z920_extra.7z There are [newer versions](https://bitbucket.org/muldersoft/7zsd.sfx-mod/src/8571e5c45b48ecbf5b0740ffe5301722223540d9/bin/) which improve compatibility on modern Windows versions.
1. Inside that package, there’s a file called “7zS.sfx”. Move it to this directory.
1. Double-click to run one of the `build-installer-*.bat` files depending on how you'd like Firefox to run.
    * `build-installer-tmp-profile.bat` — Create a clean temporary profile using tmp-profile as a template.
    * `build-installer-migrate-data.bat` — Same as above but show the migrator dialog on startup to allow importing profile data from another browser or existing Firefox profile. See [supported migration data types per browser](https://wiki.mozilla.org/QA/Firefox_migrators#Supported_data_types).

You get a self-extracting archive file called `firefox-test.exe`, that will automatically run Firefox. Note that since this executable isn't signed, users who download it from the Internet will get additional warnings from Windows when it's run. You won't see this warnings when running it from the computer you just created it on.
