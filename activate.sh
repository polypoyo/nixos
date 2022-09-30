#!/bin/sh
ACTIVATE_TYPE=${ACTIVATE_TYPE:-switch}
nixos-rebuild $ACTIVATE_TYPE --flake .