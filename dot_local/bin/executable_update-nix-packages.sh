#!/bin/env bash

set -x
set -e

    #nix profile upgrade --impure '.*' && \
nix profile list | awk '{print $4}' > /tmp/old && \
    nix profile upgrade '.*' && \
    nix profile list | awk '{print $4}' > /tmp/new && \
    meld /tmp/old /tmp/new
