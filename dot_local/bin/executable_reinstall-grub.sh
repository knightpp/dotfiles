#!/bin/env bash

set -euo pipefail

sudo grub-install --target=x86_64-efi --efi-directory=/boot/

sudo grub-mkconfig -o /boot/grub/grub.cfg
# or
# sudo update-grub
