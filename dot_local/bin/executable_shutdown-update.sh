#!/usr/bin/env bash

sudo pacman -Syu --noconfirm
flatpak update --assumeyes
shutdown -h now
