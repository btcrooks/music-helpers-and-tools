#!/usr/bin/env sh

# Instructions

# Step 1: Set the version
VERSION=6 # works with versions 6, 5, and 4.

# Step 2: run the script
# `sudo ./GuitarRigPro_Uninstaller.sh`



# Do not change anything below this line... unless you know what you're doing.
# ----------------------------------------------------------------------------

# Set Home Directory
HOME=$(eval echo ~$USER)

# Files
applicationFiles=(
  /Library/Preferences/com.native-instruments.Guitar\ Rig\ $VERSION.plist
  /Applications/Native\ Instruments/Guitar\ Rig\ $VERSION
)
pluginFiles=(
  /Library/Audio/Plug-Ins/Components/Guitar\ Rig\ $VERSION.component
  /Library/Audio/Plug-Ins/VST/Guitar\ Rig\ $VERSION.vst
)
dataSupportFiles=(
  /Library/Application\ Support/Native\ Instruments/Guitar\ Rig\ $VERSION
  /Library/Application\ Support/Native\ Instruments/Service\ Center/Guitar\ Rig\ $VERSION.xml
)
preferenceFiles=(
  $HOME/Library/Preferences/com.native-instruments.Guitar\ Rig\ $VERSION.plist
  $HOME/Library/Application\ Support/Native\ Instruments/Guitar\ Rig\ $VERSION
)

ALLFILES=(
  "${applicationFiles[@]}"
  "${pluginFiles[@]}"
  "${dataSupportFiles[@]}"
  "${preferenceFiles[@]}"
)

for file in "${ALLFILES[@]}"
do
  # echo "--> ${file}"
  # echo
  # Remove Directories
  if [ -d "${file}" ]; then
    echo "Directory: ${file}"
  fi

  # Remove Files
  if [ -f "$file" ];then
    echo "File: ${file}"
  fi

  # File or diretory not found
  if [ ! -d "$file" ] && [ ! -f "$file" ]; then
    echo "File/Dir not found: ${file}"
  fi
done

# Appendix
# https://support.native-instruments.com/hc/en-us/articles/210291865-How-to-Uninstall-Native-Instruments-Software-from-a-Mac-Computer
