#!/usr/bin/env bash

printf "=========== START %s ===========\n" "$(date)" >>~/pacman-updates.log
sudo pacman -Syu --noconfirm | tee --append ~/pacman-updates.log
printf "=========== END   %s ===========\n\n" "$(date)" >>~/pacman-updates.log

printf "=========== START %s ===========\n" "$(date)" >>~/flatpak-updates.log
flatpak update --assumeyes --noninteractive | tee --append ~/flatpak-updates.log
printf "=========== END   %s ===========\n\n" "$(date)" >>~/flatpak-updates.log

qdbus org.kde.ksmserver /KSMServer logout 0 2 2
#shutdown -h now
