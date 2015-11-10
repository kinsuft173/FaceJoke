#!/bin/bash
workspacename=ksbk.xcworkspace
project=FaceJoke
scheme=$project
driver="iPhone 6"
##
##
PWD=`pwd`
rm -rf reports
xcodebuild -configuration Debug -workspace $workspacename -scheme $scheme clean test -destination name="$driver"
odir=`cat object_file_dir`


mkdir reports
mkdir reports/html
mkdir reports/xml
chmod -R  777 reports

/usr/local/bin/gcovr  --html --html-details -o reports/html/coverage.html -r $PWD/$project -v $odir
##/usr/local/bin/gcovr  --xml -o reports/xml/coverage.xml -r $PWD/$project -v $odir