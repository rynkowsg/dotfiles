#!/bin/bash

# Usage
#   
#    ./install-android-studio.sh 2024.3.2.14
#   

mkdir ~/bin  
cd ~/bin

VERSION=${1:-"2024.3.2.14"}
# Sample versions
# - 2024.1.2.12
# - 2024.2.1.9
# - 2024.3.2.14

if [ -d "android-studio-$VERSION" ]; then
  echo "already downloaded"
else
  wget -c https://redirector.gvt1.com/edgedl/android/studio/ide-zips/$VERSION/android-studio-$VERSION-linux.tar.gz
  tar -xvzf android-studio-$VERSION-linux.tar.gz
  mv android-studio android-studio-$VERSION
fi

rm -f android-studio ideas
ln -s android-studio-$VERSION/bin/studio.sh android-studio
ln -s android-studio-$VERSION/bin/studio.sh ideas
