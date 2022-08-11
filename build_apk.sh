#!/bin/bash

BLUE="\e[36;1m%s\e[0m\n"
GREEN="\e[32;1m%s\e[0m\n"
YELLOW="\e[33;1m%s\e[0m\n"
RED="\e[31;1m%s\e[0m\n"

flutter clean
flutter pub get
flutter pub upgrade

for FILE in `find ./lib/main*.dart -type f`
do
    FILENAME=$(echo $FILE| cut -d'_' -f 2)
    FILENAME=$(echo $FILENAME| cut -d'.' -f 1)
    MAINPATH="lib/main_${FILENAME}.dart"
    printf "${FILENAME}"
    printf "\n"
    printf "${MAINPATH}"
    printf "\n"
    flutter build appbundle --release --flavor "${FILENAME}" -t "${MAINPATH}"
done
