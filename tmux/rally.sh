#!/bin/sh

set -eu

RALLY=rally
VERSION=0.0.1

TARGET=$(ls -d ~/dev/private/* ~/dev/s*/* ~/dev/d*-*/* ~/nomad | sk)
NAME=$(basename $TARGET)

tmuxinator start $NAME || tmuxinator start default name=$NAME root=$TARGET
