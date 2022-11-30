#!/usr/bin/env bash

if [[ -e ../../create-dmg ]]; then
  # We're running from the repo
  CREATE_DMG=../../create-dmg
else
  # We're running from an installation under a prefix
  CREATE_DMG=../../../../bin/create-dmg
fi

# Since create-dmg does not clobber, be sure to delete previous DMG
[[ -f o0zi-installer.dmg ]] && rm o0zi-installer.dmg

# Create the DMG
$CREATE_DMG \
  --volname "o0zi" \
  --background "o0zi.png" \
  --window-pos 200 120 \
  --window-size 800 400 \
  --icon-size 100 \
  --icon "o0zi.app" 200 190 \
  --hide-extension "o0zi.app" \
  --app-drop-link 600 185 \
  "o0zi-installer.dmg" \
  "source_folder/"
