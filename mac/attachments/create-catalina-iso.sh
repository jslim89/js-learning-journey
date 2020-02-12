#!/bin/bash

# Ref: https://gist.github.com/agentsim/00cc38c693e7d0e1b36a2080870d955b#gistcomment-3113518

hdiutil create -o /tmp/Catalina -size 8500m -volname Catalina -layout SPUD -fs HFS+J
hdiutil attach /tmp/Catalina.dmg -noverify -mountpoint /Volumes/Catalina
diskutil eraseDisk JHFS+ Catalina disk3
sudo /Applications/Install\ macOS\ Catalina.app/Contents/Resources/createinstallmedia --volume /Volumes/Catalina –-nointeraction
hdiutil detach /volumes/Install\ macOS\ Catalina
hdiutil convert /tmp/Catalina.dmg -format UDTO -o ~/Desktop/Catalina.cdr
mv ~/Desktop/Catalina.cdr ~/Desktop/Catalina.iso
